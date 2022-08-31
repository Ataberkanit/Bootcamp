using System.ComponentModel.DataAnnotations;

namespace Hafta4.Entities
{
    public class Memberships
    {
        [Key]
        public int Id { get; set; }

        public int Member_id { get; set; }

        public int Group_id { get; set; }

    }
}
