using System.ComponentModel.DataAnnotations;

namespace Hafta4.Entities
{
    public class Comments
    {
        [Key]
        public int Id { get; set; }

        public string Content { get; set; }

        public DateTime Send_date { get; set; }

        public int Type_id { get; set; }

        public int Sender { get; set; }

        public int Post_id { get; set; }

    }
}
