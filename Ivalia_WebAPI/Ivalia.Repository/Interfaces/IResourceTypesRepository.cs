using Ivalia.Abstractions.Patterns;
using Ivalia.DataTransfer.DTO.Request;
using Ivalia.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ivalia.Repository.Interfaces
{
    public interface IResourceTypesRepository : IRepository<ResourceType>
    {
        public void Create(CreateResourceTypeRequest resourceTypeDetails);
    }
}
