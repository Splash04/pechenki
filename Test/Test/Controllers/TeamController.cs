using System;
using System.Collections.Generic;
using System.Data;
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

        public BaseResult GetById(int teamId)
        {
            Team result;
            using (var db = new CookieContext())
            {
                result = db.Teams.FirstOrDefault(x => x.TeamId == teamId);
            }
            return new TeamResult
            {
                ErrorCode = 0,
                DataType = "team",
                Team = result
            };
        }

        public BaseResult GetUserTeams(int userId)
        {
            List<Team> result = new List<Team>();
            using (var db = new CookieContext())
            {
                var userTeams = db.UserTeams.Where(x => x.UserId == userId);
                result.AddRange(userTeams.Select(userTeam => db.Teams.FirstOrDefault(x => x.TeamId == userTeam.TeamId)));
            }
            return new TeamResult
            {
                ErrorCode = 0,
                DataType = "teams",
                Teams = result
            };
        }

        public BaseResult Create(Team model)
        {
            try
            {
                using (var db = new CookieContext())
                {
                    db.Teams.Add(model);
                    db.SaveChanges();
                }
                return new BaseResult
                {
                    ErrorCode = 0
                };
            }
            catch (Exception)
            {
                return new ErrorResult
                {
                    ErrorCode = 2,
                    ErrorMessage = "Упс! Что-то пошло не так с нашей базой данных."
                };
            }
        }
    }
}
