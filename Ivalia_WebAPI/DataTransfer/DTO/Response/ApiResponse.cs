using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ivalia.DataTransfer.DTO.Response
{
    public class ApiResponse
    {
        public int Type { get; set; }
        public string Messages { get; set; }
        public object Data { get; set; }

        public bool IsSuccessful() => Type == Status.SUCCESS;

        public static class Status
        {
            public static int SUCCESS = 0;
            public static int ERROR = 1;
        }
    }
}
