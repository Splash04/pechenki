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
    public class TeamController : ApiController
    {
        public BaseResult Get()
        {
            return new TeamResult
            {
                ErrorCode = 0,
                DataType = "team",
                Teams = new List<Team>()
                {
                    new Team
                    {
                        TeamId = 1,
                        Name = "Team 1",
                        Info = "Info 1",
                        Tag = "#tag1"
                    },
                    new Team
                    {
                        TeamId = 2,
                        Name = "Team 2",
                        Info = "Info 2",
                        Tag = "#tag2"
                    }
                }
            };
        }

        public BaseResult Get(int teamId)
        {
            return new TeamResult
            {
                ErrorCode = 0,
                DataType = "team",
                Teams = new List<Team>()
            };
        }

        public BaseResult GetUserTeams(int userId)
        {
            return new TeamResult
            {
                ErrorCode = 0,
                DataType = "team",
                Teams = new List<Team>()
            };
        }

        public BaseResult Post(Team model)
        {
            return new BaseResult
            {
                ErrorCode = model.TeamId
            };
        }
    }
}
