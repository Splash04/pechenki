using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.DataAccess.Entities
{
    public class UserTeam
    {
        public int Id { get; set; }

        public int UserId { get; set; }
        public int TeamId { get; set; }

        public virtual User User { get; set; }
        public virtual Team Team { get; set; }
    }
}
