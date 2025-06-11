using Opticut.Types.GenericModels;

namespace Opticut.Web.ViewModels
{
    public class UserListViewModel
    {
        public required IEnumerable<UserViewModel> Users { get; set; }

        public required PagingGenericModel Paging { get; set; }
    }
}
