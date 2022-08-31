using System.ComponentModel.DataAnnotations;

namespace Hafta4.Entities
{
    public class Groups
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }

    }
}
