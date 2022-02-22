using Ivalia.Application;
using Ivalia.DataTransfer.DTO.Request;
using Ivalia.DataTransfer.DTO.Response;
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
    public class ResourceTypesController : BaseController
    {
        public ResourceTypesController(IWebHostEnvironment environment, IUnitOfWorkIvalia unitOfWork) :
            base(environment, unitOfWork)
        {

        }

        [HttpPost]
        public IActionResult Post([FromBody] CreateResourceTypeRequest resourceTypeDetails)
        {
            var Response = new ApiResponse();

            try
            {
                UnitOfWork.ResourceTypes.Create(resourceTypeDetails);
                UnitOfWork.SaveChanges();

                Response.Type = ApiResponse.Status.SUCCESS;
                Response.Messages = $"El tipo de recurso '{resourceTypeDetails.Name}' se creó exitosamente.";
            }
            catch(Exception ex)
            {
                Response.Type = ApiResponse.Status.ERROR;
                Response.Messages = ex.Message;
            }

            return Ok(Response);
        }
    }
}
