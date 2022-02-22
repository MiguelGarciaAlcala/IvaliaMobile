using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Ivalia.Abstractions.Common
{
    public interface ICrud<T> where T : class
    {        
        public ICollection<T> GetAll(Expression<Func<T, bool>> expression = null);

        public T Get(Expression<Func<T, bool>> expression);

        public T Get(params object[] id);

        public void Save(T entity);

        public void Delete(params object[] id);
    }
}
