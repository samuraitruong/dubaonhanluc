using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Linq.Dynamic;
using DBNL.App.Models;
using DBNL.App.Models.Helpers;
using DBNL.App.Models.Extensions;
using DBNL.App.Models.Business;
using DBNL.App.Models.ViewData;
using DBNL.App.Models.Statics;

namespace DBNL.App.Areas.CMS.Controllers
{
    public class CareerController : Controller
    {
        //
        // GET: /Contact/

        [RequiresAuthentication]
        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /Contact/Details/5
        [RequiresAuthentication]
        public ActionResult Details(int id)
        {
            ViewData.Model = new CareerService().GetItem(id);
            return View();
        }

        //
        // GET: /Contact/Create

        [RequiresAuthentication]
        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Contact/Create

       

        [RequiresAuthentication]
        public ActionResult List()
        {
            ViewData.Model = new CareerService().GetAllItems();
            return View();
        }

        //
        // GET: /Contact/Delete/5

        [RequiresAuthentication]
        public ActionResult Delete(int id)
        {
            ViewData.Model = new CareerService().GetItem(id);
            return View();
        }

        //
        // POST: /Contact/Delete/5

        [HttpPost]
        [RequiresAuthentication]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
                new CareerService().Delete(id);
                return RedirectToAction("List");
            }
            catch
            {
                return View();
            }
        }

        [HttpPost]
        [RequiresAuthentication]
        public ActionResult JsonDelete(int id)
        {
            try
            {
                // TODO: Add delete logic here
                new CareerService().Delete(id);
                return Json(true, JsonRequestBehavior.AllowGet);
            }
            catch
            {
                return Json(false, JsonRequestBehavior.AllowGet);
            }
        }

        //
        // GET: /Contact/Edit/5

        [RequiresAuthentication]
        public ActionResult Edit(int id)
        {
            ViewData.Model = new CareerService().GetItem(id);
            return View();
        }

        //
        // POST: /Contact/Edit/5

        [HttpPost]
        [RequiresAuthentication]
        public ActionResult Edit(int id, string Name, string Status)
        {
            try
            {
                // TODO: Add update logic here
                new CareerService().Edit(id, Name,  Status);
                return RedirectToAction("Index");
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
        [RequiresAuthentication]
        public ActionResult List(int page, int rows, string sidx, string sord)
        {
            var contact = new CareerService().List();
            bool searchOn = bool.Parse(Request.Form["_search"]);
            string searchExp = "";
            if (searchOn)
            {
                searchExp = string.Format("{0}.ToString().Contains(@0)", getFormValue("searchField"));
                contact = contact.Where(searchExp, new string[] { getFormValue("searchString") });
            }
            var model = from entity in contact.OrderBy(sidx + " " + sord)
                        select new
                        {
                            Id = entity.Id,
                            Name = entity.Name,
                            Status = entity.Status
                        };
            return Json(model.ToJqGridData(page, rows, null, "", new[] { "Name", "Status" }), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        [RequiresAuthentication]
        public ActionResult EditRow(int? id, string Name, string Status)
        {
            if (id.HasValue)
            {
                new CareerService().Edit(id.Value, Name, Status);
            }
            else
            {
                new CareerService().Add(Name, Status);
            }
            return Content("true");
        }

        [RequiresAuthentication]
        public ActionResult GetSelectStatus()
        {
            IEnumerable<SelectListItem> list = CustomSelectList.CreateContactStatus();
            return Content(list.ToHtml());
        }
    }
}
