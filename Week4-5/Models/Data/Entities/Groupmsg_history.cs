using System.ComponentModel.DataAnnotations;

namespace Hafta4.Entities
{
    public class Groupmsg_history
    {
        [Key]
        public int Id { get; set; }

        public int Groupmsg_id { get; set; }

        public string Content { get; set; }

        public DateTime Update_date { get; set; }

        public string Type { get; set; }
    }
}
