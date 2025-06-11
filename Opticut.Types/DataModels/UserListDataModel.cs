using Opticut.Types.GenericModels;
using System.ComponentModel.DataAnnotations;

namespace Opticut.Types.DataModels
{
    public record struct UserListDataModel
    {
        [Display(Name = "Users")]
        public IEnumerable<UserDataModel> Users { get; set; }

        public required PagingGenericModel Paging { get; set; }

        public required int Total { get; set; }
    }
}
