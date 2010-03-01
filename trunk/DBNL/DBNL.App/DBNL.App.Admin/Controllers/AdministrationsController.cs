using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;

namespace DBNL.App.Admin.Controllers
{
    public class AdministrationsController : Controller
    {
        //
        // GET: /Administrations/

        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /Administrations/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Administrations/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Administrations/Create

        [AcceptVerbs(HttpVerbs.Post)]
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
        // GET: /Administrations/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Administrations/Edit/5

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
