using Ivalia.Abstractions.Patterns;
using Ivalia.DataTransfer.DTO.View;
using Ivalia.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ivalia.Repository.Interfaces
{
    public interface INewsRepository : IRepository<New>
    {
        public ICollection<New> Public();
        public string GetAttachment(int id);
        public string GetImage(int id);
    }
}
