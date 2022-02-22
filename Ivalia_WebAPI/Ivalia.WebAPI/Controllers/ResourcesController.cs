using Ivalia.Application;
using Ivalia.DataTransfer.DTO.Request;
using Ivalia.DataTransfer.DTO.Response;
using Ivalia.DataTransfer.DTO.View;
using Ivalia.Entities;
using Ivalia.WebAPI.Common.Tools;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Routing;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace Ivalia.WebAPI.Controllers
{
    [Route("api/[controller]")]
    public class ResourcesController : BaseController
    {
        public FileManager FileManager { get; set; }
        public LinkGenerator LinkGenerator { get; set; }

        public ResourcesController(IWebHostEnvironment environment, IUnitOfWorkIvalia unitOfWork, LinkGenerator linkGenerator) :
            base(environment, unitOfWork)
        {
            FileManager = FileManager.GetInstance(environment);
            LinkGenerator = linkGenerator;
        }

        [HttpPost]
        public async Task<IActionResult> Post([FromForm] CreateResourceRequest resourceDetails, [FromForm] IFormFile file)
        {
            var Response = new ApiResponse();

            try
            {
                var Res = new Resource
                {
                    CreatorID = resourceDetails.UserID,
                    Type = resourceDetails.Type,
                    Description = resourceDetails.Description,
                    UploadDate = DateTime.Now
                };

                if (file != null)
                    Res.FileHyperlink = await FileManager.SaveFileAsync(file, FileManager.Content.Resources.Root, true);
                else
                    Res.FileHyperlink = resourceDetails.Hyperlink;

                UnitOfWork.Resources.Save(Res);
                UnitOfWork.SaveChanges();

                Response.Type = ApiResponse.Status.SUCCESS;
                Response.Messages = "El recurso se agregó exitosamente.";
            }
            catch (Exception ex)
            {
                Response.Type = ApiResponse.Status.ERROR;
                Response.Messages = ex.Message;
            }

            return Ok(Response);
        }

        [HttpGet]
        [Route("Files")]
        public ICollection<FileResourceItemView> Files()
        {
            return UnitOfWork.Resources
                .Files()
                .Select(s => new FileResourceItemView
                {
                    Id = s.Id,
                    Description = s.Description,
                    Filename = s.FileHyperlink,
                    Resource = LinkGenerator.GetUriByAction(HttpContext, action: nameof(File), values: new { s.Id })
                })
                .ToList();
        }

        [HttpGet]
        [Route("Hyperlinks")]
        public ICollection<LinkResourceItemView> Hyperlinks()
        {
            return UnitOfWork.Resources
                .Hyperlinks()
                .Select(s => new LinkResourceItemView
                {
                    Id = s.Id,
                    Description = s.Description,
                    Hyperlink = s.FileHyperlink
                })
                .ToList();
        }

        [HttpGet]
        [Route("{id}/File")]
        public IActionResult File(int id)
        {
            var Attachment = UnitOfWork.Resources.GetFile(id);

            if(Attachment != null)
            {
                var RelPath = Path.Combine(FileManager.Content.Resources.Root, Attachment);
                return PhysicalFile(FileManager.ContentPath(RelPath), "*/*");
            }

            return NoContent();
        }
    }
}
