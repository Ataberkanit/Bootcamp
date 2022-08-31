using AtaberkAnit.HomeWork.RestfulApi.DbOperations;
using Microsoft.Extensions.Logging;
using AtaberkAnit.HomeWork.RestfulApi.Entities;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;

namespace AtaberkAnit.HomeWork.RestfulApi.Controllers
{
    [ApiController]
    [Route("api/[controller]s")]
    public class ProductController : ControllerBase
    {

        public static List<Product> ProductList = Demo.products;


        //
        // GET: ProductController
        //

        [HttpGet]
        public IActionResult GetProducts()
        {
            if (ProductList.Count == 0)
                return NotFound("Product Not Found");
            return Ok(ProductList);
        }

        //
        // GET: api/products/1
        //

        [HttpGet("{id}")]
        public IActionResult GetProductById(int id)
        {
            var product = new Product();
            product = ProductList.Where(b => b.productId == id).SingleOrDefault();
            if (product == null)
                return NotFound("Product Not Found");
            return Ok(product);
        }

        //
        // POST: ProductController
        //

        [HttpPost]
        public IActionResult CreateProduct([FromBody] Product newProduct)
        {
            if (newProduct is null) //if have no data, return bad request
                return BadRequest("No data entered!");

            //check if already product exist the list
            var product = ProductList.SingleOrDefault(b => b.productCode == newProduct.productCode);

            if (product is not null)
                return BadRequest("You already have this product in your list");

            ProductList.Add(newProduct);
            return Created("~api/products", newProduct);
        }

        //
        // PUT: ProductController
        //
 
        [HttpPut("{id}")]
        public IActionResult Update(Product newProduct)
        {

            if (newProduct is null)
                return BadRequest("No data entered!");


            var record = ProductList.SingleOrDefault(g => g.productId == newProduct.productId);
            if (record != null)
            {
                //if the value is not default, user tried to update it.
                record.productId = newProduct.productId != default ? newProduct.productId : record.productId;
                record.productName = newProduct.productName != default ? newProduct.productName : record.productName;
                record.productCode = newProduct.productCode != default ? newProduct.productCode : record.productCode;
                record.description = newProduct.description != default ? newProduct.description : record.description;
                record.productPrice = newProduct.productPrice != default ? newProduct.productPrice : record.productPrice;
                record.isAvailable = newProduct.isAvailable != default ? newProduct.isAvailable : record.isAvailable;
            }
            else
            {
                return NotFound("There is no record to update");
            }

            return Ok(ProductList); //http 200 
        }

        //
        // DELETE: ProductController
        //

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            var record = ProductList.SingleOrDefault(b => b.productId == id);
            if (record is null)
            {
                return BadRequest("There is no record to delete");
            }
            else
            {
                ProductList.Remove(record);
                return NoContent(); //http204
            }
        }

        //
        // PATCH: ProductController
        //

        [HttpPatch("{id}")]
        public IActionResult UpdateAvailability(int id, bool isAvailable)
        {
            var record = ProductList.SingleOrDefault(u => u.productId == id);
            if (record != null)
            {

                ProductList.SingleOrDefault(g => g.productId == id).isAvailable = isAvailable;
            }
            else
            {
                return NotFound("There is no record to update");
            }
            return NoContent(); //http 204

        }
    }
}
