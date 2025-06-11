using Opticut.Contracts.Data;
using Opticut.Contracts.Services;
using Opticut.Types.GenericModels;
using Opticut.Types.ServiceModels;

namespace Opticut.Services
{
    public sealed class UserService(IUserRepository userRepository) : IUserService
    {
        public async Task<UserListServiceModel> GetAllUsers(PagingGenericModel paging)
        {
            var allUsers = await userRepository.GetAllUsers(paging);

            var userDataToServiceTransformation = allUsers.Users.Select(data => new UserServiceModel
            {
                FirstName = data.FirstName,
                LastName = data.LastName,
                DateOfBirth = data.DateOfBirth,
                Email = data.Email,
                Id = data.Id,
                PhoneNumber = data.PhoneNumber
            });

            return new UserListServiceModel()
            {
                Paging = allUsers.Paging,
                Total = allUsers.Total,
                Users = userDataToServiceTransformation
            };
        }
    }
}
