using System.ComponentModel.DataAnnotations;
namespace Hafta4.Entities
{
    public class Types
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
    }
}
