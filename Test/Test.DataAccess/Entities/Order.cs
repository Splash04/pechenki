using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.DataAccess.Entities
{
    public class Order
    {
        public int OrderId { get; set; }
        public int Price { get; set; }
        public int TeamId { get; set; }

        public virtual List<Product> Products { get; set; }
        public virtual Team Team { get; set; } 
    }
}
