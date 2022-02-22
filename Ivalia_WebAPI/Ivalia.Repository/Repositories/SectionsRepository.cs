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
    public class SectionsRepository : GenericRepository<Section>, ISectionsRepository
    {
        private IvaliaContext _context { get; set; }

        public SectionsRepository(IvaliaContext context) : base(context)
        {
            _context = context;
        }

        public ICollection<SectionItemView> Public()
        {
            return GetAll().Select(s => new SectionItemView
            {
                Id = s.Id,
                Title = s.Title,
                Content = s.Content,
                Subsections = _context.Subsections.Where(t => t.SectionID == s.Id).Select(t => new SubsectionItemView
                {
                    Id = t.Id,
                    Title = t.Title,
                    Content = t.Content
                }).ToList()
            }).ToList();
        }

        public bool Exists(string title)
        {
            return Get(s => s.Title == title) != null;
        }

        public void Create(CreateSectionRequest sectionDetails)
        {
            if (string.IsNullOrEmpty(sectionDetails.Title))
                throw new Exception("El título de la sección no es válido.");

            if(Exists(sectionDetails.Title))
                throw new Exception($"La sección '{sectionDetails.Title}' ya existe.");

            Save(new Section
            {
                Title = sectionDetails.Title,
                Content = sectionDetails.Content
            });
        }
    }
}
