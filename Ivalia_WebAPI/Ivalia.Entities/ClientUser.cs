using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ivalia.Entities
{
    public class ClientUser
    {
        public int ClientID { get; set; }
        public int UserID { get; set; }

        public virtual Client Client { get; set; }
        public virtual User User { get; set; }
    }
}
