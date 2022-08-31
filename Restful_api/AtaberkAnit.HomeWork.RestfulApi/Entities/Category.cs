using System.ComponentModel.DataAnnotations;

namespace AtaberkAnit.HomeWork.RestfulApi.Entities
{
    public class Category
    {
        [Required]
        public int categoryId { get; set; } 

        public string categoryName { get; set; }

        [Required]
        public int categoryCode { get; set; }

    }
}
