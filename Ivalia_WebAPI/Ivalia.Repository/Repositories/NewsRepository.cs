using Ivalia.DataAccess;
using Ivalia.DataTransfer.DTO.View;
using Ivalia.Entities;
using Ivalia.Repository.Interfaces;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ivalia.Repository.Repositories
{
    public class NewsRepository : GenericRepository<New>, INewsRepository
    {
        public NewsRepository(IvaliaContext context) : base(context)
        {

        }

        public ICollection<New> Public()
        {
            return GetAll(s => s.Status == Status.Active)
                .OrderByDescending(s => s.UploadDate)
                .ToList();
        }

        public string GetAttachment(int id)
        {
            var NewItem = Get(id);
            return NewItem?.Attachment;
        }

        public string GetImage(int id)
        {
            var NewItem = Get(id);
            return NewItem?.Image;
        }

        public static class Status
        {
            public static string Active = "A";
        }
    }
}
