using Ivalia.Abstractions.Patterns;
using Ivalia.DataAccess;
using Ivalia.Repository.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ivalia.Application
{
    public interface IUnitOfWorkIvalia : IUnitOfWork<IvaliaContext>
    {
        public INewsRepository News { get; }
        public IUsersRepository Users { get; }
        public IRolesRepository Roles { get; }
        public ISectionsRepository Sections { get; }
        public ISubsectionsRepository Subsections { get; }
        public IResourcesRepository Resources { get; }
        public IResourceTypesRepository ResourceTypes { get; }
    }
}
