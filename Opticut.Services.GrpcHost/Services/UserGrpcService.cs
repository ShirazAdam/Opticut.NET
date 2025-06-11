using Google.Protobuf.WellKnownTypes;
using Grpc.Core;
using Opticut.Contracts.Services;
using Opticut.Types.GenericModels;

namespace Opticut.Services.GrpcHost.Services;

public sealed class UserGrpcService(ILogger<UserGrpcService> logger, IUserService userService) : GrpcHost.UserGrpcService.UserGrpcServiceBase
{
    public override async Task<GetAllUserResponse> GetAllUsers(GetAllUserRequest request, ServerCallContext context)
    {
        var paging = new PagingGenericModel
        {
            PageNumber = request.Pagenumber,
            RowsPerPage = request.Rowsperpage,
            TotalRows = request.Totalrows
        };

        var userData = await userService.GetAllUsers(paging);

        var response = new GetAllUserResponse();
        foreach (var user in userData.Users)
        {
            response.User.Add(new User()
            {
                Email = user.Email,
                Dateofbirth = user.DateOfBirth.ToTimestamp(),
                Firstname = user.FirstName,
                Id = user.Id,
                Lastname = user.LastName,
                Phonenumber = user.PhoneNumber
            });

            logger.LogInformation("Added: {UserFirsName} {UserLastName}", user.FirstName, user.LastName);
        }

        return await Task.FromResult(response);
    }
}