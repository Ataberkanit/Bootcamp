using AtaberkAnit.HomeWork.RestfulApi.DbOperations;
using AtaberkAnit.HomeWork.RestfulApi.Entities;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;

namespace AtaberkAnit.HomeWork.RestfulApi.Controllers
{
    [ApiController]
    [Route("api/[controller]s")]
    public class CategoryController : ControllerBase
    {
        public static List<Category> categoriesList = Demo.categories;


        //
        //GET: CategoryController
        //

        [HttpGet]

        public IActionResult GetCategories()
        {
            if (categoriesList.Count == 0)
                return NotFound("Category Not Found");
            return Ok(categoriesList);
        }

        //
        // GET: api/categories/1
        //

        [HttpGet("{id}")]
        public IActionResult GetCategoryId(int id)
        {
            var category = new Category();
            category = categoriesList.Where(b => b.categoryId == id).SingleOrDefault();
            if (category == null)
                return NotFound("Category Not Found");
            return Ok(category);
        }

        //
        // POST: ProductController
        //

        [HttpPost]
        public IActionResult CreateCategory([FromBody] Category newcategory)
        {
            if (newcategory is null) //if have no data, return bad request
                return BadRequest("No data entered!");

            //check if already product exist the list
            var product = categoriesList.SingleOrDefault(b => b.categoryCode == newcategory.categoryCode);

            if (product is not null)
                return BadRequest("You already have this category in your list");

            categoriesList.Add(newcategory);
            return Created("~api/products", newcategory);
        }

        //
        // PUT: ProductController
        //

        [HttpPut("{id}")]
        public IActionResult Update(Category newCategory)
        {

            if (newCategory is null)
                return BadRequest("No data entered!");


            var record = categoriesList.SingleOrDefault(g => g.categoryId == newCategory.categoryId);
            if (record != null)
            {
                //if the value is not default, user tried to update it.
                record.categoryId = newCategory.categoryId != default ? newCategory.categoryId : record.categoryId;
                record.categoryName = newCategory.categoryName != default ? newCategory.categoryName : record.categoryName;
            }
            else
            {
                return NotFound("There is no record to update");
            }

            return Ok(categoriesList); //http 200 
        }

        //
        // DELETE: ProductController
        //

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            var record = categoriesList.SingleOrDefault(b => b.categoryId == id);
            if (record is null)
            {
                return BadRequest("There is no record to delete");
            }
            else
            {
                categoriesList.Remove(record);
                return NoContent(); //http204
            }
        }

        //
        // PATCH: ProductController
        //

        [HttpPatch("{id}")]
        public IActionResult UpdateName(int id, string name)
        {
            var record = categoriesList.SingleOrDefault(u => u.categoryId == id);
            if (record != null)
            {

                categoriesList.SingleOrDefault(g => g.categoryId == id).categoryName = "Patch CategoryName";
            }
            else
            {
                return NotFound("There is no record to update");
            }
            return NoContent(); //http 204

        }

    }
}
