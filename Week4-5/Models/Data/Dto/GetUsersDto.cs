namespace Hafta4.Data.Dto
{
    public class GetUsersDto
    {
        public string UserName { get; set; }

        public string Email { get; set; }

        public bool IsActive { get; set; }

        public bool IsDeleted { get; set; }
    }
}
