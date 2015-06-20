using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.DataAccess.Entities;

namespace Test.Results
{
    public class CategoryResult : BaseResult
    {
        public List<Category> Categories { get; set; } 
    }
}