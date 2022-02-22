using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ivalia.Entities
{
    public class Link
    {
        public int Id { get; set; }
        public int CreatorID { get; set; }
        public string Description { get; set; }
        public string Hyperlink { get; set; }
        public DateTime UploadDate { get; set; }

        public virtual User Creator { get; set; }
    }
}
