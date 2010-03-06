using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DBNL.App.Models.Business;

namespace DBNL.App.Admin.Controllers
{
    public class PollController : Controller
    {
        //
        // GET: /Poll/

        public ActionResult Index()
        {
            return RedirectToAction("List");
        }

        public ActionResult List()
        {
            ViewData.Model = PollService.GetAllItems();
            return View();
        }

        //
        // GET: /Poll/Details/5

        public ActionResult Details(int id)
        {
            ViewData.Model = PollService.GetItem(id);
            return View();
        }

        //
        // GET: /Poll/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Poll/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
                PollService.Add(collection["PollName"], collection["Status"]);
                return RedirectToAction("List");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Poll/Delete/5
 
        public ActionResult Delete(int id)
        {
            ViewData.Model = PollService.GetItem(id);
            return View();
        }

        //
        // POST: /Poll/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
                PollService.Delete(id);
                return RedirectToAction("List");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Poll/Edit/5
 
        public ActionResult Edit(int id)
        {
            ViewData.Model = PollService.GetItem(id);
            return View();
        }

        //
        // POST: /Poll/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
                PollService.Edit(id, collection["PollName"], collection["Status"]);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
