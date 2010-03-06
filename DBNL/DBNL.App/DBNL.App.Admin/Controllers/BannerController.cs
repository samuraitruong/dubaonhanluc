using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DBNL.App.Models.Business;

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
                BannerService.Add(collection["Name"], collection["Url"], collection["BannerImage"], collection["Status"], collection["BannerPosition"]);
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
            ViewData.Model = BannerService.GetItem(id);
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
                BannerService.Edit(id, collection["Name"], collection["Url"], collection["BannerImage"], collection["Status"], collection["BannerPosition"]);
                return RedirectToAction("List");
            }
            catch
            {
                return View();
            }
        }
    }
}
