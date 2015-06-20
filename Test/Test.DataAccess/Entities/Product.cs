using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.DataAccess.Entities
{
    public class Product
    {
        public int ProductId { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }

        public int CategoryId { get; set; }
        public virtual Category Category { get; set; }
    }
}
