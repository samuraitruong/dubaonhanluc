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
    public class JobController : Controller
    {
        //
        // GET: /CMS/Job/

        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /CMS/Job/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /CMS/Job/Create

        public ActionResult Create()
        {
            
            return View(new Job());
        }
        [HttpPost]
        public ActionResult Public(int id)
        {
            new JobService().Public(id);
            return Json(true);
        }
        //
        // POST: /CMS/Job/Create

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(Job job)
        {
            try
            {
                if (!ModelState.IsValid) return View(job);
                new JobService().Add(job);
                return RedirectToAction("Index");
            }
            catch
            {
                return View(job);
            }
        }
        
        //
        // GET: /CMS/Job/Edit/5
        [HttpPost]
        public ActionResult EditRow(int id, string Company, DateTime Deadline, string Status, string Title, string oper)
        {
            JqGridOperations Oper = (JqGridOperations)Enum.Parse(typeof(JqGridOperations),oper);

            if (Oper == JqGridOperations.edit)
            {
                var item = new JobService().EditItem(id, Title, Company, Deadline, Status);
                
            }
            return Json(true);
        }
        public ActionResult Edit(int id)
        {
            var item = new JobService().GetItem(id);
            if (item == null) return RedirectToAction("Index");
            return View(item);
        }

        //
        // POST: /CMS/Job/Edit/5

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(int id, Job job)
        {
            try
            {
                new JobService().Update(id, job);
                // TODO: Add update logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /CMS/Job/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /CMS/Job/Delete/5

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
        public ActionResult List(int page, int rows, string sidx, string sord, string Position)
        {
            var jobs = new JobService().List();
            bool searchOn = bool.Parse(Request.Form["_search"]);
            string searchExp = "";
            if (searchOn)
            {
                searchExp = string.Format("{0}.ToString().Contains(@0)", getFormValue("searchField"));
                jobs = jobs.Where(searchExp, new string[] { getFormValue("searchString") });
            }
            var model = from entity in jobs.OrderBy(sidx + " " + sord)
                        select new
                        {
                            Id = entity.Id,
                            Title = entity.Title,
                            Company= entity.Company,
                            Deadline = entity.Deadline.ToShortDateString(),
                            Status = entity.Status
                        };
            return Json(model.ToJqGridData(page, rows, null, "", new[] { "Title", "Company", "Deadline","Status"}), JsonRequestBehavior.AllowGet);
        }

    }
}
