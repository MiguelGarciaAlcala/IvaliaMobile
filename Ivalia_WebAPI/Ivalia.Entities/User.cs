using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ivalia.Entities
{
    public class User
    {
        public int Id { get; set; }
        public string RoleID { get; set; }
        public string Fullname { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public string ProfilePicture { get; set; }
        public string Status { get; set; }

        public virtual Role Role { get; set; }

        public virtual ICollection<New> News { get; set; }
        public virtual ICollection<Link> Links { get; set; }
        public virtual ICollection<Resource> Resources { get; set; }
        public virtual ICollection<Task> TasksBy { get; set; }
        public virtual ICollection<Task> TasksTo { get; set; }
        public virtual ICollection<File> Files { get; set; }
        public virtual ICollection<ClientUser> ClientUsers { get; set; }
    }
}
