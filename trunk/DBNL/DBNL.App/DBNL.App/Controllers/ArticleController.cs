﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using DBNL.App.Models.Business;
using DBNL.App.Models.ViewData;

namespace DBNL.App.Controllers
{
    public class ArticleController : FOController
    {
        //
        // GET: /Content/


       

        public ActionResult Category(int id)
        {
            ViewData.Model = new CategoryViewData() {
                Category = CategoryService.GetById(id),
                Articles = ContentService.GetContentByCategoryId(id)
            
            };
            return View();
        }

        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /Content/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        public ActionResult View(int id)
        {
            ViewData.Model = ContentService.GetContentById(id);
            return View();
        }

        //
        // GET: /Content/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Content/Create

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
        // GET: /Content/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Content/Edit/5

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
