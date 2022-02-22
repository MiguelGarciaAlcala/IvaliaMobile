using Ivalia.Abstractions.Common;
using Ivalia.Abstractions.Patterns;
using Ivalia.Application;
using Ivalia.DataAccess;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Routing;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace Ivalia.WebAPI.Controllers
{
    [ApiController]
    public abstract class BaseController : ControllerBase
    {
        public IWebHostEnvironment Environment { get; set; }
        public IUnitOfWorkIvalia UnitOfWork { get; set; }

        public BaseController(IWebHostEnvironment environment, IUnitOfWorkIvalia unitOfWork)
        {
            Environment = environment;
            UnitOfWork = unitOfWork;
        }
    }
}
