using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.DataAccess.Entities;

namespace Test.Results
{
    public class RestaurantResult : BaseResult
    {
        public List<Restaurant> Restaurants { get; set; } 
    }
}