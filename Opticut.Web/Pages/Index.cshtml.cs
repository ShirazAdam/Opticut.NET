using Microsoft.AspNetCore.Mvc.RazorPages;
using Opticut.Services.GrpcHost;
using Opticut.Types.GenericModels;
using Opticut.Web.ViewModels;

namespace Opticut.Web.Pages;

public class IndexModel(ILogger<IndexModel> logger, UserGrpcService.UserGrpcServiceClient client) : PageModel
{
    public required UserListViewModel UserList { get; set; }

    public async Task OnGet()
    {
        var paging = new PagingGenericModel()
        {
            PageNumber = 1,
            RowsPerPage = 10
        };

        var allUsers = await client.GetAllUsersAsync(new GetAllUserRequest
        {
            Pagenumber = paging.PageNumber,
            Rowsperpage = paging.RowsPerPage,
            Totalrows = paging.TotalRows
        });

        logger.LogInformation("All users retrieved via gRPC");

        var userViewModel = allUsers.User.Select(data => new UserViewModel()
        {
            FirstName = data.Firstname,
            LastName = data.Lastname,
            DateOfBirth = data.Dateofbirth.ToDateTime(),
            Email = data.Email,
            Id = data.Id,
            PhoneNumber = data.Phonenumber
        });

        logger.LogInformation("Users converted to view model");

        UserList = new UserListViewModel()
        {
            Paging = paging,
            Users = userViewModel
        };
    }
}
