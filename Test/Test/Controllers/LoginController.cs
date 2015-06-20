using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using Test.DataAccess.Entities;
using Test.Results;

namespace Test.Controllers
{
    public class LoginController : ApiController
    {
        public BaseResult Get()
        {
            return new ErrorResult
            {
                ErrorCode = 0,
                DataType = "error",
                ErrorMessage = "Invalid username of password"
            };
        }
    }
}
