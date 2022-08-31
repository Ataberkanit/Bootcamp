using System.ComponentModel.DataAnnotations;

namespace Hafta4.Entities
{
    public class User_messages
    {
        [Key]
        public int Id { get; set; }
        public int Sender { get; set; }
        public int Receiver { get; set; }
        public DateTime Send_date { get; set; }
        public Types Type_id { get; set; }
        public string Content { get; set; }

    }
}
