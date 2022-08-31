using System.ComponentModel.DataAnnotations;

namespace Hafta4.Entities
{
    public class Friendships
    {
        [Key]
        public int Id { get; set; }

        public int Sender { get; set; }

        public int Receiver { get; set; }

        public int Status_id { get; set; }

    }
}
