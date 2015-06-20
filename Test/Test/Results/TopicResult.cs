using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Test.Models;

namespace Test.Results
{
    public class TopicResult : BaseResult
    {
        public IEnumerable<Topic> Topics { get; set; } 
    }
}