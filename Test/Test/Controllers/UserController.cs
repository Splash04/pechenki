using System;
using System.Collections.Generic;
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
    public class UserController : ApiController
    {
        public BaseResult Get()
        {
            return new UserResult
            {
                ErrorCode = 0,
                DataType = "users",
                Users = new List<User>
                {
                    new User
                    {
                        UserId = 1,
                        FirstName = "Name1",
                        LastName = "Name1",
                        Phone = "1234",
                        Email = "1@1.com"
                    },
                    new User
                    {
                        UserId = 1,
                        FirstName = "Name2",
                        LastName = "Name2",
                        Phone = "1234",
                        Email = "2@2.com"
                    }
                }
            };
        }


        public BaseResult Join(JoinModel model)
        {
            try
            {
                using (var db = new CookieContext())
                {
                    db.UserTeams.Add(new UserTeam
                    {
                        UserId = model.UserId,
                        TeamId = model.TeamId
                    });
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
