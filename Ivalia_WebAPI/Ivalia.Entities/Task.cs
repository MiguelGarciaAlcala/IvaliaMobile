using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ivalia.Entities
{
    public class Task
    {
        public int Id { get; set; }
        public int ByID { get; set; }
        public int ToID { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? GoalDate { get; set; }
        public string Status { get; set; }

        public virtual User UserBy { get; set; }
        public virtual User UserTo { get; set; }
    }
}
