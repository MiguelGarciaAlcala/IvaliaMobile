using Ivalia.DataAccess;
using Ivalia.DataTransfer.DTO.View;
using Ivalia.Entities;
using Ivalia.Repository.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ivalia.Repository.Repositories
{
    public class ResourcesRepository : GenericRepository<Resource>, IResourcesRepository
    {
        public ResourcesRepository(IvaliaContext context) : base(context)
        {

        }

        public List<Resource> Files()
        {
            return GetAll(s => s.Type == ResourceTypesRepository.Type.File).ToList();
        }

        public string GetFile(int id)
        {
            var TargetResource = Get(id);
            return (TargetResource?.Type == ResourceTypesRepository.Type.File) ? TargetResource?.FileHyperlink : null;
        }

        public List<Resource> Hyperlinks()
        {
            return GetAll(s => s.Type == ResourceTypesRepository.Type.Hyperlink).ToList();
        }
    }
}
