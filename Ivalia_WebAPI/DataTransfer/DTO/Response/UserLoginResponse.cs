using Ivalia.DataTransfer.HATEOAS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ivalia.DataTransfer.DTO.Response
{
    public class UserLoginResponse : Hateoas
    {
        public int Id { get; set; }
        public string Role { get; set; }
        public string Fullname { get; set; }
        public string Token { get; set; }
    }
}
