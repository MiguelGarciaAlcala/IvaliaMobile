using Ivalia.DataTransfer.HATEOAS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ivalia.DataTransfer.DTO.View
{
    public class NewItemView : Hateoas
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public string Hyperlink { get; set; }
        public bool HasAttachment { get; set; }
        public string UploadDate { get; set; }
    }
}
