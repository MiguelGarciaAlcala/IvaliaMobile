using Ivalia.Abstractions.Common;
using Ivalia.Abstractions.Patterns;
using Ivalia.DataAccess;
using Ivalia.Repository.Interfaces;
using Ivalia.Repository.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ivalia.Application
{
    public class UnitOfWorkIvalia : IUnitOfWorkIvalia
    {
        public IvaliaContext Context { get; set; }

        public INewsRepository News { get; }
        public IUsersRepository Users { get; }
        public IRolesRepository Roles { get; }
        public ISectionsRepository Sections { get; }
        public ISubsectionsRepository Subsections { get; }
        public IResourcesRepository Resources { get; }
        public IResourceTypesRepository ResourceTypes { get; }

        public UnitOfWorkIvalia(IvaliaContext context)
        {
            Context = context;
            News = new NewsRepository(Context);
            Users = new UsersRepository(Context);
            Roles = new RolesRepository(Context);
            Sections = new SectionsRepository(Context);
            Subsections = new SubsectionsRepository(Context);
            Resources = new ResourcesRepository(Context);
            ResourceTypes = new ResourceTypesRepository(Context);
        }

        public void SaveChanges()
        {
            Context.SaveChanges();
        }
    }
}
