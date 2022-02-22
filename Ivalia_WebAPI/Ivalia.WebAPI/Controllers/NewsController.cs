using Ivalia.DataTransfer.DTO.Request;
using Ivalia.DataTransfer.DTO.View;
using Ivalia.DataTransfer.DTO.Response;
using Ivalia.DataTransfer.HATEOAS;
using Ivalia.Abstractions.Patterns;
using Ivalia.Application;
using Ivalia.DataAccess;
using Ivalia.Entities;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Routing;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Ivalia.Repository.Repositories;
using Ivalia.WebAPI.Common.Tools;

namespace Ivalia.WebAPI.Controllers
{
    [Route("api/[controller]")]
    public class NewsController : BaseController
    {
        public LinkGenerator LinkGenerator { get; set; }
        public FileManager FileManager { get; set; }

        public NewsController(IWebHostEnvironment environment, IUnitOfWorkIvalia unitOfWork, LinkGenerator linkGenerator) 
            : base(environment, unitOfWork)
        {
            FileManager = FileManager.GetInstance(environment);
            LinkGenerator = linkGenerator;
        }

        [HttpPost]
        public async Task<IActionResult> Post([FromForm] CreateNewRequest newDetails, [FromForm] IList<IFormFile> files)
        {
            var Response = new ApiResponse();
            string AttachmentPath = null;

            try
            {
                var AttachmentFile = (files.Count > 1) ? files.ElementAt(1) : null;
                var ImageFile = (files.Count > 0) ? files.ElementAt(0) : null;
                
                if (ImageFile == null)
                    throw new Exception("Agregue la imagen a mostrar en la seción de noticias.");

                if (AttachmentFile != null)
                    AttachmentPath = await FileManager.SaveFileAsync(AttachmentFile, FileManager.Content.News.Attachments, true);

                var ImagePath = await FileManager.SaveFileAsync(ImageFile, FileManager.Content.News.Images, true);

                UnitOfWork.News.Save(new New
                {
                    CreatorID = newDetails.CreatorID,
                    Title = newDetails.Title,
                    Content = newDetails.Content,
                    Image = ImagePath,
                    Attachment = AttachmentPath,
                    Hyperlink = newDetails.Hyperlink,
                    UploadDate = DateTime.Now,
                    Status = NewsRepository.Status.Active
                });

                UnitOfWork.SaveChanges();

                Response.Type = ApiResponse.Status.SUCCESS;
                Response.Messages = "La noticia se agregó exitosamente.";
            }
            catch(Exception ex)
            {
                Response.Type = ApiResponse.Status.ERROR;
                Response.Messages = ex.Message;
            }

            return Ok(Response);
        }

        [HttpGet]
        [Route("Public")]
        public ICollection<NewItemView> Public()
        {
            var PublicNews = UnitOfWork.News.Public()
                .Select(s => new NewItemView
                {
                    Id = s.Id,
                    Title = s.Title,
                    Content = s.Content,
                    Hyperlink = s.Hyperlink,
                    HasAttachment = s.Attachment != null,
                    UploadDate = s.UploadDate.ToString("dd/MM/yyyy hh:mm tt"),
                    Links = new List<DataTransfer.HATEOAS.Link>()
                    {
                        new DataTransfer.HATEOAS.Link()
                        {
                            Rel = "image",
                            Href = LinkGenerator.GetUriByAction(HttpContext, action: nameof(Image), values: new { s.Id }),
                            Method = "GET"
                        },
                        new DataTransfer.HATEOAS.Link()
                        {
                            Rel = "attachment",
                            Href = LinkGenerator.GetUriByAction(HttpContext, action: nameof(Attachment), values: new { s.Id }),
                            Method = "GET"
                        }
                    }
                })
                .ToList();

            return PublicNews;
        }

        [HttpGet]
        [Route("{id}/Image")]
        public IActionResult Image(int id)
        {
            var Image = UnitOfWork.News.GetImage(id);

            if (Image != null)
            {
                string ImagePath = Path.Combine(FileManager.Content.News.Images, Image);
                var ContentType = FileManager.GetFileType(ImagePath);

                return PhysicalFile(FileManager.ContentPath(ImagePath), $"image/{ContentType}");
            }

            return NoContent();
        }

        [HttpGet]
        [Route("{id}/Attachment")]
        public IActionResult Attachment(int id)
        {
            var Attachment = UnitOfWork.News.GetAttachment(id);

            if (Attachment != null)
            {
                string AttachmentPath = Path.Combine(FileManager.Content.News.Attachments, Attachment);
                return PhysicalFile(FileManager.ContentPath(AttachmentPath), "*/*");
            }

            return NoContent();
        }
    }
}
