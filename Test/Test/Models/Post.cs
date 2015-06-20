using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Test.Models
{
    public class Post
    {
        public int PostId { get; set; }
        public string Title { get; set; }

        public int BlogId { get; set; }
        public virtual Blog Blog { get; set; }
    }
}