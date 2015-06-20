using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using Test.DataAccess;
using Test.DataAccess.Entities;
using Test.Models;
using Test.Results;

namespace Test.Controllers
{
    public class TopicController : ApiController
    {
        public BaseResult Get()
        {
            return new TopicResult()
            {
                ErrorCode = 0,
                Topics = new List<Topic> 
                {
                    new Topic {Id = 1, Title = "Topic 1"},
                    new Topic {Id = 2, Title = "Topic 4"}
                }
            };
        }

    }
}
