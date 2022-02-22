using Ivalia.Abstractions.Patterns;
using Ivalia.DataTransfer.DTO.Request;
using Ivalia.DataTransfer.DTO.View;
using Ivalia.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ivalia.Repository.Interfaces
{
    public interface ISubsectionsRepository : IRepository<Subsection>
    {
        public void Create(CreateSubsectionRequest subsectionDetails);
        public bool Exists(int section, string title);
    }
}
