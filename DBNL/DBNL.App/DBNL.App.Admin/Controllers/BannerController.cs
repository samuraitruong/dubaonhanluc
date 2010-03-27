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
using System.Linq.Dynamic;
using DBNL.App.Models.Helpers;

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
                if (String.IsNullOrEmpty(Request.Files["banimg"].FileName) == false)
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

        protected string getFormValue(string key)
        {
            try
            {
                return Request.Form[key];
            }
            catch
            {
                return "";
            }
        }

        [HttpPost]
        public ActionResult List(int page, int rows, string sidx, string sord)
        {
            var bann = BannerService.List();
            bool searchOn = bool.Parse(Request.Form["_search"]);
            string searchExp = "";
            if (searchOn)
            {
                searchExp = string.Format("{0}.ToString().Contains(@0)", getFormValue("searchField"));
                bann = bann.Where(searchExp, new string[] { getFormValue("searchString") });
            }
            var model = from entity in bann.OrderBy(sidx + " " + sord)
                        select new
                        {
                            EntityId = entity.Id,
                            Name = entity.Name,
                            Url = entity.Url,
                            Image = string.Format("<img alt='Banner image' src='" + entity.BannerImage + "' style='width:100px;height:100px;' />"),
                            Status = entity.Status,
                            Position = entity.BannerPosition
                        };
            return Json(model.ToJqGridData(page, rows, null, "", new[] { "Name", "Url", "Image", "Status", "Position" }), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult EditRow(int? id, int? EntityId, string name, string Url, string image, string status, string position)
        {
            if (EntityId.HasValue)
            {
                BannerService.Edit(EntityId.Value, name, Url, image, status, position);
            }
            else
            {
                BannerService.Add(name, Url, image, position);
            }
            return Content("true");
        }
    }
}
