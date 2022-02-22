using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ivalia.Entities
{
    public class Client
    {
        public int Id { get; set; }
        public string RFC { get; set; }
        public string Fullname { get; set; }
        public string Logo { get; set; }
        public string Status { get; set; }

        public virtual ICollection<ClientUser> ClientUsers { get; set; }
        public virtual ICollection<Period> Periods { get; set; }
    }
}
