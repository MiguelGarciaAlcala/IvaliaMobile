using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ivalia.Entities
{
    public class Period
    {
        public int Id { get; set; }
        public int ClientID { get; set; }
        public int YearID { get; set; }
        public string Name { get; set; }
        public string Status { get; set; }

        public virtual Client Client { get; set; }
        public virtual Year Year { get; set; }

        public virtual ICollection<File> Files { get; set; }
        public virtual ICollection<Plot> Plots { get; set; }
    }
}
