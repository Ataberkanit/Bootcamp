using System.ComponentModel.DataAnnotations;

namespace Hafta4.Entities
{
    public class Friendship_status
    {
        [Key]
        public int Id { get; set; }
        public int Friendship_sender { get; set; }
        public int Friendship_receiver { get; set; }
        public int Confirmation { get; set; }
        public DateTime Date { get; set; }

    }
}
