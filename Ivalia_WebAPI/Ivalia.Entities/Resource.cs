using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ivalia.Entities
{
    public class Resource
    {
        public int Id { get; set; }
        public int CreatorID { get; set; }
        public string Type { get; set; }
        public string Description { get; set; }
        public string FileHyperlink { get; set; }
        public DateTime UploadDate { get; set; }

        public virtual User Creator { get; set; }
        public virtual ResourceType ResourceType { get; set; }
    }
}
