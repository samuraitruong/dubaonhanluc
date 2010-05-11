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
    public class ContactController : Controller
    {
        //
        // GET: /Contact/

        public ActionResult Index()
        {
            return RedirectToAction("List");
        }

        //
        // GET: /Contact/Details/5

        public ActionResult Details(int id)
        {
            ViewData.Model = new ContactService().GetItem(id);
            return View();
        }

        //
        // GET: /Contact/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Contact/Create

        [HttpPost]
        public ActionResult Create(Contact contact)
        {
            try
            {
                // TODO: Add insert logic here
                new ContactService().Add(contact.Name, contact.Email, contact.Status);
                return RedirectToAction("List");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult List()
        {
            ViewData.Model = new ContactService().GetAllItems();
            return View();
        }

        //
        // GET: /Contact/Delete/5
 
        public ActionResult Delete(int id)
        {
            ViewData.Model = new ContactService().GetItem(id);
            return View();
        }

        //
        // POST: /Contact/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
                new ContactService().Delete(id);
                return RedirectToAction("List");
            }
            catch
            {
                return View();
            }
        }

        [HttpPost]
        public ActionResult JsonDelete(int id)
        {
            try
            {
                // TODO: Add delete logic here
                new ContactService().Delete(id);
                return Json(true, JsonRequestBehavior.AllowGet);
            }
            catch
            {
                return Json(false, JsonRequestBehavior.AllowGet);
            }
        }

        //
        // GET: /Contact/Edit/5
 
        public ActionResult Edit(int id)
        {
            ViewData.Model = new ContactService().GetItem(id);
            return View();
        }

        //
        // POST: /Contact/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, string name, string email, string status)
        {
            try
            {
                // TODO: Add update logic here
                new ContactService().Edit(id, name, email, status);
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
        public ActionResult List(int page, int rows, string sidx, string sord)
        {
            var contact = new ContactService().List();
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
                            Email = entity.Email,
                            Status = entity.Status
                        };
            return Json(model.ToJqGridData(page, rows, null, "", new[] { "Name", "Email", "Status" }), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult EditRow(int? id, string name, string email, string status)
        {
            if (id.HasValue)
            {
                new ContactService().Edit(id.Value, name, email, status);
            }
            else
            {
                new ContactService().Add(name, email, status);
            }
            return Content("true");
        }

        public ActionResult GetSelectStatus()
        {
            IEnumerable<SelectListItem> list = CustomSelectList.CreateContactStatus();
            return Content(list.ToHtml());
        }
    }
}
