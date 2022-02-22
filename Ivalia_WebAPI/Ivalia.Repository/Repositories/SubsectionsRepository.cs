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
    public class SubsectionsRepository : GenericRepository<Subsection>, ISubsectionsRepository
    {
        public SubsectionsRepository(IvaliaContext context) : base(context)
        {

        }

        public void Create(CreateSubsectionRequest subsectionDetails)
        {
            if (string.IsNullOrEmpty(subsectionDetails.Title))
                throw new Exception("El título de la subsección no es válido.");

            if (Exists(subsectionDetails.SectionID, subsectionDetails.Title))
                throw new Exception($"La subsección '{subsectionDetails.Title}' ya existe.");

            Save(new Subsection
            {
                SectionID = subsectionDetails.SectionID,
                Title = subsectionDetails.Title,
                Content = subsectionDetails.Content
            });
        }

        public bool Exists(int section, string title)
        {
            return Get(s => s.SectionID == section && s.Title == title) != null;
        }
    }
}
