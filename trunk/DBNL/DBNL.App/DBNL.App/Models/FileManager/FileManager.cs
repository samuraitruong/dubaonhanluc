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
        public string PreviewPath { get; set; }
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
                case FileManagerOperations.rename:
                    return GetFileRenameResult();
                    break;
                case FileManagerOperations.delete:
                    return GetFileDeleteResult();
                    break;   
                 
            }
            return null;
        }

        private object GetFileDeleteResult()
        {
            string fullPath = HttpContext.Current.Server.MapPath(Path);
            System.IO.File.Delete(fullPath);
            return new
            {
                Error = "",
                Code = 0,
                Path = Path

            };
        }

        private object GetFileRenameResult()
        {
            string fullPath = HttpContext.Current.Server.MapPath(Path);
            //FileInfo fi = new FileInfo(fullPath);
            string fpath = System.IO.Path.GetDirectoryName(fullPath);
            string oldName = System.IO.Path.GetFileName(fullPath);

            string newFullPath = System.IO.Path.Combine(fpath, Name); ;
            System.IO.File.Move(fullPath, newFullPath);
            return new {
                Error="",
                Code=0,
                Path= Path.Replace(oldName, Name),
                Name=Name
            };
        }

        private object GetFileInfoResult()
        {
            
            string fullPath = HttpContext.Current.Server.MapPath(Path);
            FileInfo fi = new FileInfo(fullPath);
                return new  {
                Path=Path,
                Filename = fi.Name,
                FileType =fi.Extension,

                Preview = string.Format("{3}?Path={0}&Width={1}&Height={2}", Path, 120,120, PreviewPath),
                Properties = new {
                                    Height= 120,
                                    Width =120,
                                    Size= fi.Length,
                                 },
                Error= "",
                Code =0

            };
        }

        private object GetUploadFileResult()
        {
            string fullPath = HttpContext.Current.Server.MapPath(Path);
            fullPath = System.IO.Path.Combine(fullPath, Name);
            if (CheckFileType(Name))
            {

                File.SaveAs(fullPath);
                string rest = string.Format("{{"+
                                                
                                               "Path: \"{0}\","+
                                                "Name: \"{1}\"," +
                                                "Error: \"Successful\"," +
                                                "Code: 0"+
                                                "}}", Path, Name);



                //return rest;
                return new
                {
                    Path = Path,
                    Name = Name,
                    Error = "",
                    Code = 0
                };
            }
            //return string.Format("{" +

            //                                   "Path : '{0}'," +
            //                                    "Name : '{1}'," +
            //                                    "Error : '{2}'," +
            //                                    "Code :-1" +
            //                                    "}", Path, Name,"Bạn chỉ được upload các file hình (.gif, .jpg, .bmp, .png, .jpeg)");

            return new
                {
                    Path = Path,
                    Name = Name,
                    Error = "Bạn chỉ được upload các file hình (.gif, .jpg, .bmp, .png, .jpeg)",
                    Code = -1
                };
        }

        bool CheckFileType(string fileName)
        {
            string ext = System.IO.Path.GetExtension(fileName);
            switch (ext.ToLower())
            {
                case ".gif":
                    return true;
                case ".png":
                    return true;
                case ".jpg":
                    return true;
                case ".jpeg":
                    return true;
                case ".bmp":
                    return true;
                default:
                    return false;
            }
        }
        public object GetFolderResult()
        {
            string fullPath = HttpContext.Current.Server.MapPath(Path);
            DirectoryInfo di = new DirectoryInfo(fullPath);
            var query = from p in di.GetFiles()
                        select GetFileInfo(p);

            return query;
        }
        public object GetFileInfo(FileInfo fi)
        {
            string FilePath = Path + "/" + fi.Name;
            string previewPath = string.Format("{3}?Path={0}&Width={1}&Height={2}", FilePath, 120, 120, PreviewPath);

            return new  {
                Path = FilePath,
                Filename = fi.Name,
                FileType =fi.Extension,
                Preview=previewPath,
                Properties = new {
                                    Height= 120,
                                    Width =120,
                                    Size = fi.Length,

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