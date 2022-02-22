using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ivalia.Entities
{
    public class Year
    {
        public int Id { get; set; }
        public int Name { get; set; }
        public string Status { get; set; }

        public virtual ICollection<Period> Periods { get; set; }
    }
}
