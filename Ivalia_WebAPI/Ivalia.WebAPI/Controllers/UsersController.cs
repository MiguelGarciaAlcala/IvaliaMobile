using Ivalia.Application;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Routing;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Ivalia.DataTransfer.DTO.Request;
using Ivalia.DataTransfer.DTO.Response;
using System.IO;
using Ivalia.Repository.Repositories;
using Ivalia.DataTransfer.HATEOAS;
using Ivalia.WebAPI.Common.Tools;

namespace Ivalia.WebAPI.Controllers
{
    [Route("api/[controller]")]
    public class UsersController : BaseController
    {
        public FileManager FileManager { get; set; }
        public LinkGenerator LinkGenerator { get; set; }
        public EmailManager EmailManager { get; set; }

        public UsersController(IWebHostEnvironment environment, IUnitOfWorkIvalia unitOfWork, LinkGenerator linkGenerator, EmailManager emailManager) :
            base(environment, unitOfWork)
        {
            FileManager = FileManager.GetInstance(environment);
            LinkGenerator = linkGenerator;
            EmailManager = emailManager;
        }

        [HttpPost]
        public async Task<IActionResult> Post([FromForm] CreateUserRequest userDetails, [FromForm] IFormFile picture)
        {
            var Response = new ApiResponse();
            string PicturePath = null;

            try
            {
                if (picture != null)
                    PicturePath = await FileManager.SaveFileAsync(picture, FileManager.Content.Users.ProfilePictures, true);

                UnitOfWork.Users.Save(new Entities.User
                {
                    RoleID = userDetails.RoleID,
                    Fullname = userDetails.Fullname,
                    Username = userDetails.Username,
                    Password = userDetails.Password,
                    Email = userDetails.Email,
                    ProfilePicture = PicturePath,
                    Status = UsersRepository.Status.Active
                });

                UnitOfWork.SaveChanges();

                Response.Type = ApiResponse.Status.SUCCESS;
                Response.Messages = "El usuario se registró correctamente.";
            }
            catch (Exception ex)
            {
                Response.Type = ApiResponse.Status.ERROR;
                Response.Messages = ex.Message;
            }

            return Ok(Response);
        }

        [HttpPost]
        [Route("Login")]
        public IActionResult Login([FromBody] UserLoginRequest loginRequest)
        {
            var Response = new ApiResponse();
            var LoggedUser = UnitOfWork.Users
                .Get(s => s.Username == loginRequest.Username && s.Password == loginRequest.HashedPassword);

            if(LoggedUser != null)
            {
                Response.Type = ApiResponse.Status.SUCCESS;
                Response.Data = new UserLoginResponse
                {
                    Id = LoggedUser.Id,
                    Role = LoggedUser.RoleID,
                    Fullname = LoggedUser.Fullname,
                    Token = "",
                    Links = new List<Link>
                    {
                        new Link
                        {
                            Rel = "picture",
                            Href = LinkGenerator.GetUriByAction(HttpContext, action: nameof(ProfilePicture), values: new { LoggedUser.Id }),
                            Method = "GET"
                        }
                    }
                };
            } 
            else
            {
                Response.Type = ApiResponse.Status.ERROR;
                Response.Messages = "El usuario no existe: verifique sus datos de acceso.";
            }

            return Ok(Response);
        }

        [HttpPost]
        [Route("Recovery")]
        public IActionResult Recovery([FromBody] PasswordRecoveryRequest recoveryRequest)
        {
            var Response = new ApiResponse();

            try
            {
                var TargetUser = UnitOfWork.Users.
                    Get(s => s.Username == recoveryRequest.Username && s.Email == recoveryRequest.Email);

                if (TargetUser != null)
                {
                    var NewPassword = KeyManager.RandomPassword();
                    var HashedPassword = KeyManager.Hash(NewPassword);

                    TargetUser.Password = HashedPassword;
                    UnitOfWork.SaveChanges();

                    EmailManager.SendAsync(new Email
                    {
                        To = new List<string> { TargetUser.Email },
                        Subject = "Recuperación de Contraseña",
                        Body = "<h1 align=\"center\"><b>Contraseña Reestablecida</b></h1>" +
                               $"<p align=\"center\">Estimado <b>{TargetUser.Fullname}</b>, se reestableció su contraseña. " +
                               "Utilice la siguiente clave para acceder a la aplicación:</p>" +
                               $"<h3 align=\"center\"><b>{NewPassword}</b></h3>" +
                               "<p align=\"center\">Se recomienda actualizar la contraseña al iniciar sesión.</p>" +
                               $"<p align=\"center\"><a href=\"http://ivalia.com.mx/\">Ivalia &reg;</a> | {DateTime.Now.Year}</p>"
                    });
                }

                Response.Type = ApiResponse.Status.SUCCESS;
                Response.Messages = "Si el usuario existe, se enviarán los datos de acceso por correo electrónico.";
            }
            catch (Exception ex)
            {
                Response.Type = ApiResponse.Status.ERROR;
                Response.Messages = ex.Message;
            }

            return Ok(Response);
        }

        [HttpGet]
        [Route("{id}/ProfilePicture")]
        public IActionResult ProfilePicture(int id)
        {
            var ProfilePicture = UnitOfWork.Users.GetProfilePicture(id);

            if(ProfilePicture != null)
            {
                var PicturePath = Path.Combine(FileManager.Content.Users.ProfilePictures, ProfilePicture);
                var ContentType = FileManager.GetFileType(PicturePath);

                return PhysicalFile(FileManager.ContentPath(PicturePath), $"image/{ContentType}");
            }

            return NoContent();
        }
    }
}
