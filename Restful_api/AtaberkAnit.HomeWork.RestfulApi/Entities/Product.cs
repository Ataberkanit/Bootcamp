using System.ComponentModel.DataAnnotations;

namespace AtaberkAnit.HomeWork.RestfulApi.Entities
{
    public class Product
    {
		[Required]
		public int productId { get; set; }

		[Required]
		public string productName { get; set; }

		[Required]

        public string productCode { get; set; }

        public string description { get; set; }

        public decimal productPrice { get; set; }
		[Required]
        public int categoryId { get; set; }

        [Required]
		public bool isAvailable { get; set; }

	}
}
