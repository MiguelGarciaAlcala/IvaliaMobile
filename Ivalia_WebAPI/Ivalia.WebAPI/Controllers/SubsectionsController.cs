using Ivalia.Application;
using Ivalia.DataTransfer.DTO.Request;
using Ivalia.DataTransfer.DTO.Response;
using Ivalia.DataTransfer.DTO.View;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ivalia.WebAPI.Controllers
{
    [Route("api/[controller]")]
    public class SubsectionsController : BaseController
    {
        public SubsectionsController(IWebHostEnvironment environment, IUnitOfWorkIvalia unitOfWork)
            : base(environment, unitOfWork)
        {

        }

        [HttpPost]
        public IActionResult Post([FromBody] CreateSubsectionRequest subsectionDetails)
        {
            var Response = new ApiResponse();

            try
            {
                UnitOfWork.Subsections.Create(subsectionDetails);
                UnitOfWork.SaveChanges();

                Response.Type = ApiResponse.Status.SUCCESS;
                Response.Messages = $"La subsección '{subsectionDetails.Title}' se creó exitosamente.";
            }
            catch (Exception ex)
            {
                Response.Type = ApiResponse.Status.ERROR;
                Response.Messages = ex.Message;
            }

            return Ok(Response);
        }
    }
}
