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
    public class TeamController : ApiController
    {
        public BaseResult Get()
        {
            List<Team> result;
            using (var db = new CookieContext())
            {
                /*db.Teams.Add(new Team {Name = "Name 1"});
                db.SaveChanges();*/
                result = db.Teams.ToList();
            }
            return new TeamResult
            {
                ErrorCode = 0,
                DataType = "teams",
                Teams = result
            };
        }

        public BaseResult Get(int teamId)
        {
            var result = new List<Team>();
            using (var db = new CookieContext())
            {
                var team = db.Teams.FirstOrDefault(x => x.TeamId == teamId);
                if (team != null)
                {
                    result.Add(team);
                }
            }
            return new TeamResult
            {
                ErrorCode = 0,
                DataType = "teams",
                Teams = result
            };
        }

        public BaseResult GetUserTeams(int userId)
        {
            return new TeamResult
            {
                ErrorCode = 0,
                DataType = "teams",
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
