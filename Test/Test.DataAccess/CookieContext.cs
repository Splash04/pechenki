using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Test.DataAccess.Entities;

namespace Test.DataAccess
{
    public class CookieContext : DbContext
    {
        public DbSet<User> Users { get; set; }
        public DbSet<Category> Categories { get; set; } 
        public DbSet<Product> Products { get; set; } 
    }
}
