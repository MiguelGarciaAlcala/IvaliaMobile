using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ivalia.Entities
{
    public class ResourceType
    {
        public string Id { get; set; }
        public string Name { get; set; }

        public virtual ICollection<Resource> Resources { get; set; }
    }
}
