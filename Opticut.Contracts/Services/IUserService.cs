using Opticut.Types.GenericModels;
using Opticut.Types.ServiceModels;

namespace Opticut.Contracts.Services;

public interface IUserService
{
    Task<UserListServiceModel> GetAllUsers(PagingGenericModel paging);
}