using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DBNL.App.Models.Business;

namespace DBNL.App.Controllers
{
    public class WebJobController : FOController
    {
        //
        // GET: /WebJob/

        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /WebJob/Details/5

        public ActionResult Details(int id)
        {
            var item = new JobService().GetItem(id);
            if (item == null) return Redirect("Index");
            return View(item);
        }

        //
        // GET: /WebJob/Create

        public ActionResult Create()
        {

            return View();
        } 

        //
        // POST: /WebJob/Create

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
        // GET: /WebJob/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /WebJob/Edit/5

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
        // GET: /WebJob/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /WebJob/Delete/5

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
