using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ivalia.Entities
{
    public class File
    {
        public int Id { get; set; }
        public int CreatorID { get; set; }
        public int PeriodID { get; set; }
        public string Description { get; set; }
        public string Filename { get; set; }
        public DateTime UploadDate { get; set; }

        public virtual User Creator { get; set; }
        public virtual Period Period { get; set; }
    }
}
