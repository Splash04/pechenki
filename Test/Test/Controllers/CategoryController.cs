using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using Test.DataAccess;
using Test.DataAccess.Entities;
using Test.Results;

namespace Test.Controllers
{
    public class CategoryController : ApiController
    {
        public BaseResult GetByRestaurant(int restaurantId)
        {
            var result = new List<Category>();
            using (var db = new CookieContext())
            {
                var products = db.Products.Where(x => x.RestaurantId == restaurantId);
                foreach (var product in products)
                {
                    result.Add(new Category
                    {
                        CategoryId = product.CategoryId,
                        Name = product.Category.Name
                    });
                }
            }
            return new CategoryResult
            {
                ErrorCode = 0,
                DataType = "categories",
                Categories = result
            };
        }

    }
}
