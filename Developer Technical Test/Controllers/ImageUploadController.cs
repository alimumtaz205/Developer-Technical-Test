
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace BookPortalAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ImageUploadController : ControllerBase
    {

        private string Code;
        private bool IsSuccess;
        private string Message;

        private IWebHostEnvironment _environment;

        private IHttpContextAccessor _httpContextAccessor;

        public ImageUploadController(IWebHostEnvironment environment, IHttpContextAccessor httpContextAccessor)
        {
            _environment = environment;
            _httpContextAccessor = httpContextAccessor;
        }

        [Produces("application/json")]
        [HttpPost("upload")]
        public IActionResult Upload(IFormFile file)
         {
            string baseURL = "";
            try
            {
                
                var path = Path.Combine(_environment.WebRootPath, "images", file.FileName);
                using (var stream = new FileStream(path, FileMode.Create))
                {
                    file.CopyTo(stream);
                }
                    baseURL = _httpContextAccessor.HttpContext.Request.Scheme + "://" +
                    _httpContextAccessor.HttpContext.Request.Host +
                    _httpContextAccessor.HttpContext.Request.PathBase;

                return Ok(new
                { fileName = Path.Combine(baseURL, "images", file.FileName), IsSuccess = true, 
                    Code = "100" });
            }
            catch
            {
                return BadRequest();
            }
        }
    }
}

