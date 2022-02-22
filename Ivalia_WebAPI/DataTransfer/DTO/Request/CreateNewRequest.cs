using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ivalia.DataTransfer.DTO.Request
{
    public class CreateNewRequest
    {
        public int CreatorID { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public string Hyperlink { get; set; }
    }
}
