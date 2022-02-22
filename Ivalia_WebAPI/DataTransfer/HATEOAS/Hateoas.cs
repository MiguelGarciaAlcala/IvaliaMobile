using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ivalia.DataTransfer.HATEOAS
{
    public class Hateoas
    {
        public ICollection<Link> Links { get; set; }
    }
}
