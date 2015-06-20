using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.SmgConnect.Entities
{
    public class AuthenticateResponce
    {
        public string ErrorCode { get; set; }
        public string Permission { get; set; }
        public string SessionId { get; set; }
    }
}
