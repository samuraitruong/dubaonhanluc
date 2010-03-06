using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DBNL.App.Models;
using DBNL.App.Models.Business;

namespace DBNL.App.Admin.Controllers
{
    public class LinkController : Controller
    {
        //
        // GET: /Link/

        public ActionResult Index()
        {

            return RedirectToAction("List");
        }

        //
        // GET: /Link/Details/5

        public ActionResult Details(int id)
        {
            ViewData.Model = LinkService.GetItem(id);
            return View();
        }

        //
        // GET: /Link/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Link/Create

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(Link link)
        {
            try
            {
                // TODO: Add insert logic here
                LinkService.Add(link.Title, link.Url);

                return RedirectToAction("List");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult List()
        {
            ViewData.Model = LinkService.GetAllItems();
            return View();
        }

        //
        // GET: /Link/Delete/5
 
        public ActionResult Delete(int id)
        {
            ViewData.Model = LinkService.GetItem(id);
            return View();
        }

        //
        // POST: /Link/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
                LinkService.Delete(id);
                return RedirectToAction("List");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Link/Edit/5
 
        public ActionResult Edit(int id)
        {
            ViewData.Model = LinkService.GetItem(id);
            return View();
        }

        //
        // POST: /Link/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, string title, string url)
        {
            try
            {
                // TODO: Add update logic here
                LinkService.Edit(id, title, url);
                return RedirectToAction("List");
            }
            catch
            {
                return View();
            }
        }
    }
}
