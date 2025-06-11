using Microsoft.EntityFrameworkCore;
using Opticut.Contracts.Data;
using Opticut.Data.Models;
using Opticut.Types.DataModels;
using Opticut.Types.GenericModels;

namespace Opticut.Data.Repositories
{
    public sealed class UserRepository(OpticutDbContext context) : IUserRepository
    {
        public async Task<UserListDataModel> GetAllUsers(PagingGenericModel paging)
        {
            IEnumerable<UserTable> userDataTable = await context.Users
                .OrderBy(x => x.Id)
                .Where(x => x.Id > (paging.PageNumberForDatabase * paging.RowsPerPage))
                .Take(paging.RowsPerPage)
                .ToListAsync();

            var total = context.Users.Count();

            paging.TotalRows = total;

            var userData = userDataTable.Select(dataModel => new UserDataModel()
            {
                Id = dataModel.Id,
                DateOfBirth = dataModel.DateOfBirth,
                FirstName = dataModel.FirstName,
                LastName = dataModel.LastName,
                PhoneNumber = dataModel.PhoneNumber,
                Email = dataModel.Email
            });

            return new UserListDataModel()
            {
                Users = userData,
                Paging = paging,
                Total = total
            };

        }
    }
}
