using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ivalia.Entities
{
    public class New
    {
        public int Id { get; set; }
        public int CreatorID { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public string Image { get; set; }
        public string Attachment { get; set; }
        public string Hyperlink { get; set; }
        public DateTime UploadDate { get; set; }
        public string Status { get; set; }

        public virtual User Creator { get; set; }
    }
}
