using Ivalia.DataAccess;
using Ivalia.DataTransfer.DTO.Request;
using Ivalia.DataTransfer.DTO.Response;
using Ivalia.Entities;
using Ivalia.Repository.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ivalia.Repository.Repositories
{
    public class UsersRepository : GenericRepository<User>, IUsersRepository
    {
        public IvaliaContext _context { get; set; }

        public UsersRepository(IvaliaContext context) : base(context)
        {
            _context = context;
        }

        public string GetProfilePicture(int id)
        {
            var TargetUser = Get(id);
            return TargetUser?.ProfilePicture;
        }

        public static class Role
        {
            public static string Admin = "A";
            public static string Client = "C";
        }

        public static class Status
        {
            public static string Active = "A";
        }
    }
}
