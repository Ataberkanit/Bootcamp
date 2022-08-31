using System.ComponentModel.DataAnnotations;

namespace Hafta4.Entities
{
    public class Group_messages
    {
        [Key]
        public int Id { get; set; }

        public Types Type { get; set; }

        public string Content { get; set; }

        public DateTime Send_date { get; set; }

        public int Sender { get; set; }

        public int Receiver { get; set; }

    }
}
