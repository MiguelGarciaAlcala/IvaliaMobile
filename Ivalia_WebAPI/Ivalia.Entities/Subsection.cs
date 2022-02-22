using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ivalia.Entities
{
    public class Subsection
    {
        public int Id { get; set; }
        public int SectionID { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }

        public virtual Section Section { get; set; }
    }
}
