using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ivalia.DataTransfer.DTO.Request
{
    public class CreateResourceRequest
    {
        public int UserID { get; set; }
        public string Type { get; set; }
        public string Description { get; set; }
        public string Hyperlink { get; set; }
    }
}
