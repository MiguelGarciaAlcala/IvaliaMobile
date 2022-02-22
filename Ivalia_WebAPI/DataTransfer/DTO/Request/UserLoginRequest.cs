using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ivalia.DataTransfer.DTO.Request
{
    public class UserLoginRequest
    {
        public string Username { get; set; }
        public string HashedPassword { get; set; }
    }
}
