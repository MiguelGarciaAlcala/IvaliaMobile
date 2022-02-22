using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace Ivalia.WebAPI.Common.Tools
{
    public class FileManager
    {
        private static FileManager ManagerInstance = null;
        private static IWebHostEnvironment Environment;

        private FileManager(IWebHostEnvironment environment)
        {
            Environment = environment;
        }

        public static FileManager GetInstance(IWebHostEnvironment environment)
        {
            if (ManagerInstance == null)
                ManagerInstance = new FileManager(environment);

            return ManagerInstance;
        }

        public string ContentPath(string relPath)
        {
            return Path.Combine(Environment.ContentRootPath, relPath);
        }

        public string GetFileType(string filename)
        {
            var FileInfo = filename.Split('.');

            if (FileInfo.Length > 1 && FileInfo[1] != "")
                return $"{FileInfo[1]}".ToLower();

            throw new Exception($"No se pudo obtener el tipo del archivo '{filename}'.");
        }

        public string GetExtension(string filename)
        {
            var FileInfo = filename.Split('.');

            if (FileInfo.Length > 1 && FileInfo[1] != "")
                return $".{FileInfo[1]}".ToLower();

            throw new Exception($"No se pudo obtener la extensión del archivo '{filename}'.");
        }

        public string SaveFile(IFormFile file, string baseDir = "", bool uuid = false)
        {
            if (file.Length > 0)
            {
                var FileName = uuid ?
                    Guid.NewGuid().ToString() + GetExtension(file.FileName) : file.FileName;

                string FullPath = string.IsNullOrEmpty(baseDir) ?
                    ContentPath(FileName) : ContentPath(Path.Combine(baseDir, FileName));

                using (Stream FileStream = new FileStream(FullPath, FileMode.Create))
                {
                    file.CopyTo(FileStream);
                    return FileName;
                }
            }
            else
                throw new Exception($"Error: el archivo '{file.FileName}' está vacío.");
        }

        public async Task<string> SaveFileAsync(IFormFile file, string baseDir = "", bool uuid = false)
        {
            if (file.Length > 0)
            {
                var FileName = uuid ?
                    Guid.NewGuid().ToString() + GetExtension(file.FileName) : file.FileName;

                string FullPath = string.IsNullOrEmpty(baseDir) ?
                    ContentPath(FileName) : ContentPath(Path.Combine(baseDir, FileName));

                using (Stream FileStream = new FileStream(FullPath, FileMode.Create))
                {
                    await file.CopyToAsync(FileStream);
                    return FileName;
                }
            }
            else
                throw new Exception($"Error: el archivo '{file.FileName}' está vacío.");
        }

        public static class Content
        {
            public static string Root = "Content";

            public static class News
            {
                public static string Root = Path.Combine(Content.Root, "News");
                public static string Images = Path.Combine(Root, "Images");
                public static string Attachments = Path.Combine(Root, "Attachments");
            }

            public static class Users
            {
                public static string Root = Path.Combine(Content.Root, "Users");
                public static string ProfilePictures = Path.Combine(Root, "ProfilePictures");
            }

            public static class Resources
            {
                public static string Root = Path.Combine(Content.Root, "Resources");
            }
        }
    }
}
