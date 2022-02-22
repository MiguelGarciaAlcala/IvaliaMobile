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
    public interface IResourcesRepository : IRepository<Resource>
    {
        public List<Resource> Files();
        public List<Resource> Hyperlinks();
        public string GetFile(int id);
    }
}
