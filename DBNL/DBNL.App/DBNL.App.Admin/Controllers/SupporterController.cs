using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using DBNL.App.Models;
using DBNL.App.Models.Business;

namespace DBNL.App.Admin.Controllers
{
    public class SupporterController : Controller
    {
        //
        // GET: /Supporter/

        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /Supporter/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }
        
        public ActionResult Create()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(Supporter supporter)
        {
            SupporterService.Create(supporter);
            return RedirectToAction("Index");
        }
        //
       
        //
        // GET: /Supporter/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Supporter/Edit/5

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
