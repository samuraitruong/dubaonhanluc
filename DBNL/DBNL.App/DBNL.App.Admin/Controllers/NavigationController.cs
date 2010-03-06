using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using DBNL.App.Models.Business;
using DBNL.App.Models;
using DBNL.App.Models.Statics;

namespace DBNL.App.Admin.Controllers
{
    public class NavigationController : Controller
    {
        //
        // GET: /Navigation/

        public ActionResult Index()
        {
            ViewData.Model = NavigationService.GetItems();
            return View();
        }

        //
        // GET: /Navigation/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Navigation/Create

        public ActionResult Create()
        {
            ViewData["Categories"] = new SelectList(CategoryService.GetAllCategories(), "ID", "CategoryName");
            return View();
        } 

        //
        // POST: /Navigation/Create

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {

                Navigation navigation = new Navigation()
                {
                    Name = collection["Name"],
                    Possition = collection["Possition"],
                    ContentId = int.Parse(collection["ContentId"]),
                    Status= EntityStatuses.Actived.ToString()
                };
                NavigationService.Create(navigation);
                return RedirectToAction("Index");
            }
            catch
            {
                throw;
                ViewData["Categories"] = new SelectList(CategoryService.GetAllCategories(), "ID", "CategoryName");
                return View();
            }
        }

        //
        // GET: /Navigation/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Navigation/Edit/5

        [AcceptVerbs(HttpVerbs.Post)]
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
    }
}
