using Opticut.Types.DataModels;
using Opticut.Types.GenericModels;

namespace Opticut.Contracts.Data;

public interface IUserRepository
{
    public Task<UserListDataModel> GetAllUsers(PagingGenericModel paging);
}