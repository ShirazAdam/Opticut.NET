using Opticut.Types.GenericModels;
using System.ComponentModel.DataAnnotations;

namespace Opticut.Types.ServiceModels
{
    public record struct UserListServiceModel
    {
        [Display(Name = "Users")]
        public IEnumerable<UserServiceModel> Users { get; set; }

        public required PagingGenericModel Paging { get; set; }

        public required int Total { get; set; }
    }
}
