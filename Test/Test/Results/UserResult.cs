﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.DataAccess.Entities;

namespace Test.Results
{
    public class UserResult : BaseResult
    {
        public List<User> Users { get; set; } 
    }
}