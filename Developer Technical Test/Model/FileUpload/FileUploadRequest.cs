using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BookPortalAPI.Models.FileUpload
{
    public class FileUploadRequest
    {
        public long Length { get; set; }

        public string Name { get; set; }
    }
}
