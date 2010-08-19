using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DBNL.App.Models.Business;

namespace DBNL.App.Areas.CMS.Controllers
{
    public class DepartmentController : Controller
    {
        //
        // GET: /CMS/Department/

        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /CMS/Department/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /CMS/Department/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /CMS/Department/Create

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
        // GET: /CMS/Department/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /CMS/Department/Edit/5

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
        // GET: /CMS/Department/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /CMS/Department/Delete/5

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

        public ContentResult GetList() {
            string sb = "";
            foreach (var item in new DepartmentService().GetAllItems())
            {
                sb += string.Format("{0}:{1};", item.Id, item.Name);
            }
            return Content(sb.TrimEnd(new char[] {';'}));
        }
            
    }
}
