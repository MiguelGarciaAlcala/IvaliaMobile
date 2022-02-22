using Ivalia.Abstractions.Patterns;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Ivalia.Repository.Repositories
{
    public class GenericRepository<T> : IRepository<T> where T : class
    {
        private DbSet<T> Entities;

        public GenericRepository(DbContext context)
        {
            Entities = context.Set<T>();
        }

        public ICollection<T> GetAll(Expression<Func<T, bool>> expression = null)
        {
            return (expression != null) ? Entities.Where(expression).ToList() : Entities.ToList();
        }

        public T Get(Expression<Func<T, bool>> expression)
        {
            return Entities.Where(expression).FirstOrDefault();
        }

        public T Get(params object[] id)
        {
            return Entities.Find(id);
        }

        public void Save(T entity)
        {
            if(entity != null)
                Entities.Add(entity);
        }

        public void Delete(params object[] id)
        {
            var TargetEntity = Entities.Find(id);

            if (TargetEntity != null)
                Entities.Remove(TargetEntity);
        }
    }
}
