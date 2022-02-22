using Ivalia.DataAccess;
using Ivalia.DataTransfer.DTO.Request;
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
    public class RolesRepository : GenericRepository<Role>, IRolesRepository
    {
        public RolesRepository(IvaliaContext context) : base(context)
        {

        }

        public void Create(CreateRoleRequest roleDetails)
        {
            Save(new Role
            {
                Id = roleDetails.Id,
                Name = roleDetails.Name
            });
        }

        public ICollection<RoleItemView> List()
        {
            return GetAll().Select(s => new RoleItemView
            {
                Id = s.Id,
                Name = s.Name
            }).ToList();
        }
    }
}
