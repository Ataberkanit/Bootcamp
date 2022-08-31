using System.ComponentModel.DataAnnotations;

namespace Hafta4.Entities
{
    public class Posts
    {
        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Type { get; set; }
        public DateTime Date { get; set; }
        public int Sender { get; set; }


    }
}
