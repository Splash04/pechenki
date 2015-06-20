using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.DataAccess.Entities;

namespace Test.Results
{
    public class LoginResult : BaseResult
    {
        public string SessionId { get; set; }
        public User User { get; set; }
    }
}