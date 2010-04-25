using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DBNL.App.Models.FileManager;
using System.Web.Script.Serialization;
using DBNL.App.Models.Extensions;
using DBNL.App.Models.ViewResults;

namespace DBNL.App.Areas.CMS.Controllers
{
    public class FileManagerController : Controller
    {
        //
        // GET: /FileManager/
        [HttpPost]
        public ActionResult Action(string mode, string currentpath, string upload, FormCollection form)
        {
            HttpPostedFileBase newfile = (HttpPostedFileBase)Request.Files["newfile"];

            FileManager mgr = new FileManager()
            {
                Name = newfile.FileName,
                Path = currentpath,
                File = newfile,

                Operation = (FileManagerOperations)Enum.Parse(typeof(FileManagerOperations), mode)
            };
            JavaScriptSerializer sr = new JavaScriptSerializer();
            return Content(sr.Serialize(mgr.GetResult()));
            return Json(mgr.GetResult(), JsonRequestBehavior.AllowGet);     
        }
        public ActionResult Action(string mode, string path, string name, bool?showThumbs)
        {
            FileManager mgr = new FileManager()
            {
                Name = name,
                Path = path,
                Operation = (FileManagerOperations)Enum.Parse(typeof(FileManagerOperations), mode),
                PreviewPath = Url.Action("Preview", "FileManager")
            };
            if (mgr.Operation == FileManagerOperations.download)
            {
                return this.Image(System.Web.HttpContext.Current.Server.MapPath(path));
            }
            return Json(mgr.GetResult(), JsonRequestBehavior.AllowGet);

            var obj = new {
                Path="/Resources/Galleries/CIMG0422.JPG",
                FileName = "abc.jpg",
                FileType="jpg",
                Preview="/Resources/Galleries/CIMG0422.JPG",
                Properties = new {
                Height= 14,
                Width= 14,
                Size=300
                },
                Error="",
                Code=0

            };

            return Json(obj, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Preview(string Path, int Height, int Width)
        {
            return this.Image(System.Web.HttpContext.Current.Server.MapPath(Path), Width, Height);
        }
        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /FileManager/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /FileManager/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /FileManager/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        
        //
        // GET: /FileManager/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /FileManager/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /FileManager/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /FileManager/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
