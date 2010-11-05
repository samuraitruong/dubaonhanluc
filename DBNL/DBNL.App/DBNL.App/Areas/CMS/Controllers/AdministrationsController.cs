using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using DBNL.App.Models.ViewData;
using DBNL.App.Models.Business;
using DBNL.App.Models;

namespace DBNL.App.Areas.CMS.Controllers
{
    public class AdministrationsController : Controller
    {
        [RequiresAuthentication]
        public ActionResult Configuration()
        {
           
            return View(new SiteConfigurations());
        }

        [RequiresAuthentication]
        [HttpPost]
        public ActionResult Configuration(SiteConfigurations cf)
        {
            return RedirectToAction("Index");
        }


        //
        // GET: /Administrations/
        [RequiresAuthentication]
        public ActionResult Index()
        {
            ViewData.Model = new BOHomeViewData()
            {
                CommonCategory = new CategoryService().GetInvisibleCategory()
            };
            return View();
        }

        //
        [RequiresAuthentication]
        public ActionResult Sample() {
            return View(new Models.Sample());
        }
        [HttpPost]
        [RequiresAuthentication]
        public ActionResult Sample(Models.Sample sample)
        {
            return View(sample);
        }
        [RequiresAuthentication]
        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Administrations/Create
        [RequiresAuthentication]
        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Administrations/Create
        [RequiresAuthentication]
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
        [RequiresAuthentication]
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Administrations/Edit/5
        [RequiresAuthentication]
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
