using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Test.DataAccess.Entities;

namespace Test.Results
{
    public class TeamResult : BaseResult
    {
        public List<Team> Teams { get; set; }
        public Team Team { get; set; } 
    }
}