using System.ComponentModel.DataAnnotations;

namespace Hafta4.Entities
{
    public class Users
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }

    }
}
