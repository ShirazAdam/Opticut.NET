using Microsoft.AspNetCore.Mvc;

namespace Opticut.Web.ViewModels
{
    [BindProperties]
    public class UserViewModel
    {
        public required long Id { get; set; }

        public required string FirstName { get; set; }

        public required string LastName { get; set; }

        public required DateTime DateOfBirth { get; set; }

        public required string Email { get; set; }

        public required string PhoneNumber { get; set; }
    }
}
