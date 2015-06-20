using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using Test.DataAccess;
using Test.DataAccess.Entities;
using Test.Results;

namespace Test.Controllers
{
    public class ProductController : ApiController
    {
        public BaseResult GetByCategory(int categoryId)
        {
            List<Product> result, result2;
            using (var db = new CookieContext())
            {
                result = db.Products.Where(x => x.CategoryId == categoryId).ToList();

                result2 = result.Select(product => new Product
                {
                    ProductId = product.ProductId,
                    Name = product.Name,
                    CategoryId = product.CategoryId,
                    ImageUrl = product.ImageUrl,
                    Price = product.Price,
                    ProductWeight = product.ProductWeight,
                    RestaurantId = product.RestaurantId
                }).ToList();
            }
            return new ProductResult
            {
                ErrorCode = 0,
                DataType = "products",
                Products = result2
            };
        }

    }
}
