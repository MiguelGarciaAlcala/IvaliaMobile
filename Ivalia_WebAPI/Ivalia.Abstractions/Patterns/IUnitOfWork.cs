using Ivalia.Abstractions.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ivalia.Abstractions.Patterns
{
    public interface IUnitOfWork<T>
    {
        public T Context { get; set; }
        public void SaveChanges();
    }
}
