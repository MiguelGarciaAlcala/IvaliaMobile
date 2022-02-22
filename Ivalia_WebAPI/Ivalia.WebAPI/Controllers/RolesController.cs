using Ivalia.DataTransfer.DTO.Request;
using Ivalia.DataTransfer.DTO.View;
using Ivalia.Application;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Routing;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Ivalia.DataTransfer.DTO.Response;

namespace Ivalia.WebAPI.Controllers
{
    [Route("api/[controller]")]
    public class RolesController : BaseController
    {
        public RolesController(IWebHostEnvironment webHostEnvironment, IUnitOfWorkIvalia unitOfWork) :
            base(webHostEnvironment, unitOfWork)
        {

        }

        [HttpPost]
        public IActionResult Post(CreateRoleRequest roleDetails)
        {
            var Response = new ApiResponse();

            try
            {
                UnitOfWork.Roles.Create(roleDetails);
                UnitOfWork.SaveChanges();

                Response.Type = ApiResponse.Status.SUCCESS;
                Response.Messages = "Se agregó el rol exitosamente.";
            }
            catch (Exception ex)
            {
                Response.Type = ApiResponse.Status.ERROR;
                Response.Messages = ex.Message;
            }

            return Ok(Response);
        }

        [HttpGet]
        public ICollection<RoleItemView> Get()
        {
            return UnitOfWork.Roles.List();
        }
    }
}
