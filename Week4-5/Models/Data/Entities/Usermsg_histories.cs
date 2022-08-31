using System.ComponentModel.DataAnnotations;

namespace Hafta4.Entities
{
    public class Usermsg_histories
    {
        [Key]
        public int Id { get; set; }
        public int Usermessage_id { get; set; }
        public Types Type { get; set; }
        public string Content { get; set; }
        public DateTime Update_date { get; set; }

    }
}
