using Ivalia.DataAccess;
using Ivalia.DataTransfer.DTO.Request;
using Ivalia.Entities;
using Ivalia.Repository.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ivalia.Repository.Repositories
{
    public class ResourceTypesRepository : GenericRepository<ResourceType>, IResourceTypesRepository
    {
        public ResourceTypesRepository(IvaliaContext context) : base(context)
        {

        }

        public void Create(CreateResourceTypeRequest resourceTypeDetails)
        {
            var TargetType = Get(s => s.Id == resourceTypeDetails.Id || s.Name == resourceTypeDetails.Name);

            if (TargetType != null)
                throw new Exception("Ya existe un tipo de recurso con el código o el nombre proporcionados.");

            Save(new ResourceType
            {
                Id = resourceTypeDetails.Id,
                Name = resourceTypeDetails.Name,
            });
        }

        public static class Type
        {
            public static string File = "F";
            public static string Hyperlink = "H";
        }
    }
}
