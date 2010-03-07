using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Web;
using System.Web.Mvc;
using DBNL.App.Models.Business;
using DBNL.App.Models.ViewData;
using DBNL.App.Models.Statics;
using DBNL.App.Models;
using DBNL.App.Config;

namespace DBNL.App.Admin.Controllers
{
    public class BannerController : Controller
    {
        //
        // GET: /Banner/

        public ActionResult Index()
        {
            return RedirectToAction("List");
        }

        public ActionResult List()
        {
            ViewData.Model = BannerService.GetAllItems();
            return View();
        }

        //
        // GET: /Banner/Details/5

        public ActionResult Details(int id)
        {
            ViewData.Model = BannerService.GetItem(id);
            return View();
        }

        //
        // GET: /Banner/Create

        public ActionResult Create()
        {
            ViewData.Model = new BannerViewData() 
            {
                banner = new Banner(),
                BannerPositions = CustomSelectList.CreateBannerPosition()
            };
            return View();
        } 

        //
        // POST: /Banner/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
                ViewData.Model = new BannerViewData()
                {
                    banner = new Banner(),
                    BannerPositions = CustomSelectList.CreateBannerPosition()
                };
                string fileName = "No files";
                fileName = Request.Files[0].FileName;
                Request.Files[0].SaveAs(Path.Combine( DBNLConfigurationManager.FileResponsity.BannerFolder, fileName));
                BannerService.Add(collection["banner.Name"], collection["banner.Url"], fileName, collection["BannerPosition"]);
                return RedirectToAction("List");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Banner/Delete/5
 
        public ActionResult Delete(int id)
        {
            ViewData.Model = BannerService.GetItem(id);
            return View();
        }

        //
        // POST: /Banner/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
                BannerService.Delete(id);
                return RedirectToAction("List");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Banner/Edit/5
 
        public ActionResult Edit(int id)
        {
            ViewData.Model = new BannerViewData()
            {
                banner = BannerService.GetItem(id),
                BannerPositions = CustomSelectList.CreateBannerPosition(),
                BannerStatus = CustomSelectList.CreateBannerStatus()
            };
            return View();
        }

        //
        // POST: /Banner/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
                ViewData.Model = new BannerViewData()
                {
                    banner = BannerService.GetItem(id),
                    BannerPositions = CustomSelectList.CreateBannerPosition(),
                    BannerStatus = CustomSelectList.CreateBannerStatus()
                };
                string fileName = BannerService.GetItem(id).BannerImage;
                if (Request.Files.Count > 0)
                {
                    fileName = Request.Files[0].FileName;
                    Request.Files[0].SaveAs(Path.Combine(DBNLConfigurationManager.FileResponsity.BannerFolder, fileName));
                }
                BannerService.Edit(id, collection["banner.Name"], collection["banner.Url"], fileName, collection["BannerStatus"], collection["BannerPosition"]);
                return RedirectToAction("List");
            }
            catch
            {
                return View();
            }
        }
    }
}
