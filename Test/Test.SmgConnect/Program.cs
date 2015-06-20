using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Test.DataAccess;
using Test.DataAccess.Entities;
using Test.SmgConnect.Entities;

namespace Test.SmgConnect
{
    class Program
    {
        static void Main(string[] args)
        {
            SmgService smgService = new SmgService();
            string sessionId = smgService.Authenticate("natalia.govor", "dfcmrf");
            List<SmgEmployeeDetails> employees = smgService.GetAllEmployees(sessionId);

            using (var db = new CookieContext())
            {
                foreach (var smgEmployeeDetailse in employees)
                {
                    var user = new User
                    {
                        FirstName = smgEmployeeDetailse.FirstNameEng,
                        LastName = smgEmployeeDetailse.LastNameEng,
                        Phone = smgEmployeeDetailse.Phone,
                        Email = smgEmployeeDetailse.Email
                    };
                    db.Users.Add(user);
                }
                db.SaveChanges();
            }
        }
    }
}
