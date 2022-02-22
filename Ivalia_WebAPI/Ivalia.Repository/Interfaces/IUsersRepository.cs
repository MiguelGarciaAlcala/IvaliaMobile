using Ivalia.Abstractions.Patterns;
using Ivalia.DataTransfer.DTO.Request;
using Ivalia.DataTransfer.DTO.Response;
using Ivalia.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ivalia.Repository.Interfaces
{
    public interface IUsersRepository : IRepository<User>
    {
        public string GetProfilePicture(int id);
    }
}
