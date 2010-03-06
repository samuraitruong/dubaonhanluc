﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using DBNL.App.Models.Business;

namespace DBNL.App.Controllers
{
    public class WebContactController : FOController
    {
        //
        // GET: /WebContact/

        public ActionResult Index()
        {
            ViewData.Model = ContactService.GetAllItems();
            return View();
        }

        //
        // GET: /WebContact/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /WebContact/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /WebContact/Create

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
        // GET: /WebContact/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /WebContact/Edit/5

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
