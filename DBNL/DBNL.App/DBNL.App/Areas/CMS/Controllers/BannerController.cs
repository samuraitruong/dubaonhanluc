using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Web;
using System.Web.Mvc;
using System.Linq.Dynamic;
using DBNL.App.Models.Business;
using DBNL.App.Models.ViewData;
using DBNL.App.Models.Statics;
using DBNL.App.Models;
using DBNL.App.Config;
using DBNL.App.Models.Helpers;
using DBNL.App.Models.Extensions;

namespace DBNL.App.Areas.CMS.Controllers
{
    public class BannerController : Controller
    {
        //
        // GET: /Banner/
        [RequiresAuthentication]
        public ActionResult Index()
        {
            return RedirectToAction("List");
        }
        [RequiresAuthentication]
        public ActionResult List()
        {
            ViewData.Model = new BannerService().GetAllItems();
            return View();
        }

        //
        // GET: /Banner/Details/5
        [RequiresAuthentication]
        public ActionResult Details(int id)
        {
            ViewData.Model = new BannerService().GetItem(id);
            return View();
        }

        //
        // GET: /Banner/Create
        [RequiresAuthentication]
        public ActionResult Create()
        {
            ViewData["Extra"]= new BannerViewData() 
            {
                banner = new Banner(),
                BannerPositions = CustomSelectList.CreateBannerPosition()
            };
            return View(new Banner());
        }
        public ActionResult CreateIn(string id)
        {
            return View(new Banner() {BannerPosition = id });
        }
        [HttpPost]
        [RequiresAuthentication]
        public ActionResult CreateIn(FormCollection collection, Banner banner)
        {
            try
            {
                // TODO: Add insert logic here

                if (!ModelState.IsValid || Request.Files[0].ContentLength == 0)
                {
                    if (Request.Files[0].ContentLength == 0) ViewData.ModelState.AddModelError("Image", "Phải chọn hình");
                    return View(banner);
                }


                string fileName = "No files";
                fileName = Request.Files[0].FileName;
                Request.Files[0].SaveAs(Path.Combine(DBNLConfigurationManager.FileResponsity.BannerFolder, fileName));
                banner.Status = EntityStatuses.Actived.ToString();
                banner.BannerImage = fileName;
                banner.CreatedDate = DateTime.Now;
                banner.UpdatedDate = DateTime.Now;

                new BannerService().Add(banner);
                return RedirectToAction("List");
            }
            catch (Exception ex)
            {
                throw ex;
                //return View();
            }
        }

        //
        // POST: /Banner/Create

        [HttpPost]
        [RequiresAuthentication]
        public ActionResult Create(FormCollection collection, Banner banner)
        {
            try
            {
                // TODO: Add insert logic here

                if (!ModelState.IsValid || Request.Files[0].ContentLength==0)
                {
                    if (Request.Files[0].ContentLength == 0) ViewData.ModelState.AddModelError("Image","Phải chọn hình");
                    ViewData["Extra"] = new BannerViewData()
                    {
                        banner = new Banner(),
                        BannerPositions = CustomSelectList.CreateBannerPosition()
                    };
                    return View(banner);
                }
                

                string fileName = "No files";
                fileName = Request.Files[0].FileName;
                Request.Files[0].SaveAs(Path.Combine( DBNLConfigurationManager.FileResponsity.BannerFolder, fileName));
                banner.Status = EntityStatuses.Actived.ToString();
                banner.BannerImage = fileName;
                banner.CreatedDate = DateTime.Now;
                banner.UpdatedDate = DateTime.Now;

                new BannerService().Add(banner);
                return RedirectToAction("List");
            }
            catch (Exception ex)
            {
                throw ex;
                return View();
            }
        }

        //
        // GET: /Banner/Delete/5
        [RequiresAuthentication]
        public ActionResult Delete(int id)
        {
            ViewData.Model = new BannerService().GetItem(id);
            return View();
        }

        //
        // POST: /Banner/Delete/5
        

        [HttpPost]
        [RequiresAuthentication]
        public ActionResult JsonDelete(int id)
        {
            try
            {
                // TODO: Add delete logic here
                new BannerService().Delete(id);
                return Json(true);
            }
            catch
            {
                return Json(false);
            }
        }

        [HttpPost]
        [RequiresAuthentication]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
                new BannerService().Delete(id);
                return RedirectToAction("List");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Banner/Edit/5
        [RequiresAuthentication]

        public ActionResult Edit(int id)
        {
            ViewData.Model = new BannerViewData()
            {
                banner = new BannerService().GetItem(id),
                BannerPositions = CustomSelectList.CreateBannerPosition(),
                BannerStatus = CustomSelectList.CreateBannerStatus()
            };
            return View();
        }

        //
        // POST: /Banner/Edit/5

        [HttpPost]
        [RequiresAuthentication]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
                ViewData.Model = new BannerViewData()
                {
                    banner = new BannerService().GetItem(id),
                    BannerPositions = CustomSelectList.CreateBannerPosition(),
                    BannerStatus = CustomSelectList.CreateBannerStatus()
                };
                string fileName = new BannerService().GetItem(id).BannerImage;
                if (String.IsNullOrEmpty(Request.Files["banimg"].FileName) == false)
                {
                    fileName = Request.Files[0].FileName;
                    Request.Files[0].SaveAs(Path.Combine(DBNLConfigurationManager.FileResponsity.BannerFolder, fileName));
                }
                new BannerService().Edit(id, collection["banner.Name"], collection["banner.Url"], fileName, collection["BannerStatus"], collection["BannerPosition"]);
                return RedirectToAction("List");
            }
            catch
            {
                return View();
            }
        }

        [RequiresAuthentication]
        public ActionResult GetSelectStatus()
        {
            IEnumerable<SelectListItem> list = CustomSelectList.CreateBannerStatus();
            return Content(list.ToHtml());
        }
        
        [RequiresAuthentication]
        public ActionResult GetSelectPosition()
        {
            IEnumerable<SelectListItem> list = CustomSelectList.CreateBannerPosition();
            return Content(list.ToHtml());
        }

        [RequiresAuthentication]
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

        [RequiresAuthentication]
        public ActionResult Public(int id)
        {
            new BannerService().Public(id);
            return Json(true);
        }

        [HttpPost]
        [RequiresAuthentication]
        public ActionResult List(int page, int rows, string sidx, string sord, string Position)
        {
            var bann = new BannerService().List(Position);
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
                            Id = entity.Id,
                            Name = entity.Name,
                            Url = entity.Url,
                            
                            Image = DBNLConfigurationManager.FileResponsity.BannerRelativeUrl+ "/" + entity.BannerImage,
                            Status = entity.Status,
                            Position = entity.BannerPosition
                        };
            return Json(model.ToJqGridData(page, rows, null, "", new[] { "Name", "Url", "Image", "Status", "Position" }), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        [RequiresAuthentication]
        public ActionResult EditRow(int? id, string name, string Url, string image, string status, string position)
        {
            if (id.HasValue)
            {
                new BannerService().Edit(id.Value, name, Url, image, status, position);
            }
            else
            {
                new BannerService().Add(name, Url, image, position);
            }
            return Content("true");
        }
    }
}
