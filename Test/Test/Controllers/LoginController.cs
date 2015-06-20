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
using Test.SmgConnect;

namespace Test.Controllers
{
    public class LoginController : ApiController
    {
        public BaseResult Post(LoginModel loginModel)
        {
            SmgService smgService = new SmgService();
            string sessionId = smgService.Authenticate(loginModel.UserName, loginModel.Password);

            if (sessionId != "0")
            {
                User user = null;
                using (var db = new CookieContext())
                {
                    user = db.Users.FirstOrDefault(x => x.UserName == loginModel.UserName);
                }

                if (user == null)
                {
                    return new ErrorResult
                    {
                        ErrorCode = 2,
                        DataType = "error",
                        ErrorMessage = "Очень жаль, но наша база не содержит пока Вас :("
                    };
                }


                return new UserResult
                {
                    ErrorCode = 0,
                    DataType = "user",
                    User = user
                };
            }
            else
            {
                return new ErrorResult
                {
                    ErrorCode = 1,
                    DataType = "error",
                    ErrorMessage = "Неправильный логин или пароль"
                };
            }
        }
    }
}
