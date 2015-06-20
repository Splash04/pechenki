using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;
using Test.SmgConnect.Entities;

namespace Test.SmgConnect
{
    public class SmgService
    {
        private const string ServiceUri = "https://smg.itechart-group.com/MobileServiceNew/MobileService.svc";
        private readonly WebClient proxy = new WebClient();
        private readonly JavaScriptSerializer serializer = new JavaScriptSerializer();

        public string Authenticate(string username, string password)
        {
            var url = new Uri(String.Format("{0}/Authenticate?username={1}&password={2}", ServiceUri, username, password));
            var request = WebRequest.Create(url);
            request.ContentType = "application/json; charset=utf-8";
            var response = (HttpWebResponse)request.GetResponse();

            DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(AuthenticateResponce));
            AuthenticateResponce responce = (AuthenticateResponce)serializer.ReadObject(response.GetResponseStream());

            return responce.SessionId;
        }

        public SmgEmployeeDetails GetEmployeeDetails(string sessionId, int profileId)
        {
            var url = new Uri(String.Format("{0}/GetEmployeeDetails?sessionId={1}&profileId={2}", ServiceUri, sessionId, profileId));
            var request = WebRequest.Create(url);
            request.ContentType = "application/json; charset=utf-8";
            var response = (HttpWebResponse)request.GetResponse();

            var serializer = new JavaScriptSerializer();
            var sr = new StreamReader(response.GetResponseStream());
            string res = sr.ReadToEnd();
            if (res != null)
            {
                SmgEmployeeDetailsResponse responce = serializer.Deserialize<SmgEmployeeDetailsResponse>(res);
                return responce.Profile;
            }
            return null;
        }

        public List<SmgEmployeeDetails> GetAllEmployees(string sessionId)
        {
            var url = new Uri(String.Format("{0}/GetAllEmployees?sessionId={1}", ServiceUri, sessionId));
            var request = WebRequest.Create(url);
            request.ContentType = "application/json; charset=utf-8";
            var response = (HttpWebResponse)request.GetResponse();

            var serializer = new JavaScriptSerializer();
            var sr = new StreamReader(response.GetResponseStream());
            string res = sr.ReadToEnd();
            if (res != null)
            {
                SmgEmployeeResponce responce = serializer.Deserialize<SmgEmployeeResponce>(res);
                List<SmgEmployeeDetails> employeeDetailses = new List<SmgEmployeeDetails>();
                if (responce.Profiles != null)
                {
                    for (int i = 0; i < responce.Profiles.Count; i++)
                    {
                        if (responce.Profiles[i].DeptId == 10)
                        {
                            SmgEmployeeDetails details = GetEmployeeDetails(sessionId, responce.Profiles[i].ProfileId);
                            if (details != null)
                            {
                                //if (responce.Profiles[i].DeptId != 15)
                                //{
                                employeeDetailses.Add(new SmgEmployeeDetails
                                {
                                    Email = details.Email,
                                    FirstName = details.FirstName,
                                    LastName = details.LastName,
                                    Image = details.Image,
                                    Phone = details.Phone,
                                    ProfileId = details.ProfileId
                                });
                                //}
                            }
                        }
                    }
                    return employeeDetailses;
                }
            }
            return null;
        }
    }
}
