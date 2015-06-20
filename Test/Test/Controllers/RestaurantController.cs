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
    public class RestaurantController : ApiController
    {
        public BaseResult Get()
        {
            List<Restaurant> result, result2;
            using (var db = new CookieContext())
            {
                result = db.Restaurants.ToList();

                result2 = result.Select(restaurant => new Restaurant
                {
                    RestaurantId = restaurant.RestaurantId,
                    Name = restaurant.Name,
                    Email = restaurant.Email,
                    Phone = restaurant.Phone,
                    ResAddress = restaurant.ResAddress
                }).ToList();
            }
            return new RestaurantResult
            {
                ErrorCode = 0,
                DataType = "restaurants",
                Restaurants = result2
            };
        }

    }
}
