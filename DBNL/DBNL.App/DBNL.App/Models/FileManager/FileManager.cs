using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.Mvc;

namespace DBNL.App.Models.FileManager
{
    public class FileManager
    {
        public string Path { get; set; }
        public string Name { get; set; }
        public FileManagerOperations Operation { get; set; }
        public HttpPostedFileBase File { get; set; }
        public string Upload { get; set; }
        
        public object GetResult()
        {
            switch (this.Operation)
            {
                case FileManagerOperations.addfolder:
                    return CreateFolderResult();
                    break;

                case FileManagerOperations.getfolder:
                    return GetFolderResult();
                    break;

                case FileManagerOperations.add:
                    return GetUploadFileResult();
                    break;
                case FileManagerOperations.getinfo:
                    return GetFileInfoResult();
                    break;
            }
            return null;
        }

        private object GetFileInfoResult()
        {
            string fullPath = HttpContext.Current.Server.MapPath(Path);
            FileInfo fi = new FileInfo(fullPath);
                return new  {
                Path=Path,
                Filename = fi.Name,
                FileType =fi.Extension,
                Preview = string.Format("/CMS/FileManager/Preview?Path={0}&Width={1}&Height={2}", Path, 120,120),
                Properties = new {
                                    Height= 120,
                                    Width =120,
                                    Size= 1234,
                                 },
                Error= "",
                Code =0

            };
        }

        private object GetUploadFileResult()
        {
            string fullPath = HttpContext.Current.Server.MapPath(Path);
            fullPath = System.IO.Path.Combine(fullPath, Name);
            File.SaveAs(fullPath);
            return new {
                Path = Path,
                Name = Name,
                Error="",
                Code =0
            };


        }
        public object GetFolderResult()
        {
            string fullPath = HttpContext.Current.Server.MapPath(Path);
            DirectoryInfo di = new DirectoryInfo(fullPath);
            var query = from p in di.GetFiles()
                        select new { 
                            FileItem= GetFileInfo(p)
                        };

            return query;
        }
        public object GetFileInfo(FileInfo fi)
        {
            return new  {
                Path="",
                Filename = fi.Name,
                FileType =fi.Extension,
                Preview="",
                Properties = new {
                                    Height= 14,
                                    Width =14,
                                    Size= 123,

                                 },
                Error= "",
                Code =0

            };
        }
        public object CreateFolderResult()
        {
            string fullPath = HttpContext.Current.Server.MapPath(Path);
            DirectoryInfo di = new DirectoryInfo(fullPath);
            di.CreateSubdirectory(Name);
            return new
            {
                Parent = Path+"/"+ Name,
                Name = Name,
                Error = "No error",
                Code = 0
            };

        }

    }
}