using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.DataAccess.Entities
{
    public class Team
    {
        public int TeamId { get; set; }
        public string Name { get; set; }
        public string Info { get; set; }
        public string ImageUrl { get; set; }
        public string Tag { get; set; }
    }
}
