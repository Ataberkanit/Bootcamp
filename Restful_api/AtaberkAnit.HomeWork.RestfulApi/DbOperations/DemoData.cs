using AtaberkAnit.HomeWork.RestfulApi.Entities;
using System.Collections.Generic;

namespace AtaberkAnit.HomeWork.RestfulApi.DbOperations
{
    public class Demo
    {
        public static List<Product> products = new List<Product>()
        {
            new Product { productId = 1, productName = "Ram", productCode = "4987123554" ,description = "Xpg 16gb", isAvailable = true, productPrice = 1098, categoryId = 1 },
            new Product { productId = 2, productName = "CPU", productCode = "4321657454", description = "Intel Core i5-11400F", isAvailable = true, productPrice = 2489, categoryId = 1 },
            new Product { productId = 3, productName = "GPU", productCode = "4103674954", description = "RX6600", isAvailable = false, productPrice = 6999, categoryId = 1 },
            new Product { productId = 4, productName = "SSD", productCode = "4951034554", description = "SX7000 256gb", isAvailable = true, productPrice = 2000, categoryId = 1 },
            new Product { productId = 5, productName = "Mouse", productCode = "4954781054", description = "G300S", isAvailable = true, productPrice = 278, categoryId = 1 },
            new Product { productId = 6, productName = "Table", productCode = "7518790353", description = "SX7000 256gb", isAvailable = true, productPrice = 2000, categoryId = 2 },
            new Product { productId = 7, productName = "Chair", productCode = "7915034853", description = "G300S", isAvailable = true, productPrice = 278, categoryId = 2 },

        };

        public static List<Category> categories = new List<Category>()
        {
            new Category { categoryId = 1, categoryName = "Electronic", categoryCode = 3951753 },
            new Category { categoryId = 2, categoryName = "Furniture", categoryCode = 390510 },
        };
    }
}
