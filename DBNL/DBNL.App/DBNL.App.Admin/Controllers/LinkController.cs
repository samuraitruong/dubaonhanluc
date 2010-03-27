using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Linq.Dynamic;
using System.Web.Mvc;
using DBNL.App.Models.ViewData;
using DBNL.App.Models.Business;
using DBNL.App.Models.Helpers;
using DBNL.App.Models;

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
        [HttpPost]
        public ActionResult EditRow(int? id, int? EntityId, string Title, string Url)
        {

            if (EntityId.HasValue)
            {
                LinkService.Update(EntityId.Value, Title, Url);
            }
            else
            {
                LinkService.Add(Title, Url);
            }
            return Content("true");
           
        }


        [HttpPost]
        public ActionResult List(int page, int rows, string sidx, string sord)
        {

            var links = LinkService.List();
            
            bool searchOn = bool.Parse(Request.Form["_search"]);
            string searchExp = "";
            if (searchOn)
            {
                searchExp = string.Format("{0}.ToString().Contains(@0)", getFormValue("searchField"));
                links = links.Where(searchExp, new string[] { getFormValue("searchString") });
            }
            

            var model = from entity in links.OrderBy(sidx + " " + sord)
                        select new
                        {
                            EntityId = entity.Id,
                            Title = entity.Title,
                            Url = entity.Url,
                        };


                

            return Json(model.ToJqGridData(page, rows, null, "", new[] { "Title", "Url" }), JsonRequestBehavior.AllowGet);
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
        }        //
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
