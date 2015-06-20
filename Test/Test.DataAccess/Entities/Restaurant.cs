using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.DataAccess.Entities
{
    public class Restaurant
    {
        public int RestaurantId { get; set; }
        public string Name { get; set; }
        public string Phone { get; set; }
        public string ResAddress { get; set; }
        public string Email { get; set; }

        public virtual List<Product> Products { get; set; } 
    }
}
