using System;
using System.Collections.Generic;
using System.Data.Entity;
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
            Database.SetInitializer<CookieContext>(null);
            SmgService smgService = new SmgService();
            string sessionId = smgService.Authenticate("natalia.govor", "dfcmrf");
            List<SmgEmployeeDetails> employees = smgService.GetAllEmployees(sessionId);

            using (var db = new CookieContext())
            {
                foreach (var smgEmployeeDetailse in employees)
                {
                    var user = new User
                    {
                        FirstName = smgEmployeeDetailse.FirstName,
                        LastName = smgEmployeeDetailse.LastName,
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
