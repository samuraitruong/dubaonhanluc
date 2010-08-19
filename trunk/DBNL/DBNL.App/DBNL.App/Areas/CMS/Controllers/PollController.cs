﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Linq.Dynamic;
using DBNL.App.Models.Business;
using DBNL.App.Models.Helpers;
using DBNL.App.Models.Statics;
using DBNL.App.Models.Extensions;
using DBNL.App.Models;


namespace DBNL.App.Areas.CMS.Controllers
{
    [RequiresAuthentication]
    public class PollController : Controller
    {
        //
        // GET: /Poll/

        public ActionResult Index()
        {
            return RedirectToAction("List");
        }
        [HttpPost]
        public ActionResult Public(int id)
        {
            new PollService().Public(id);
            return Json(true);
        }
        public ActionResult List()
        {
            ViewData.Model = new PollService().GetAllItems();
            return View();
        }

        //
        // GET: /Poll/Details/5

        public ActionResult Details(int id)
        {
            ViewData.Model = new PollService().GetItem(id);
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
                new PollService().Add(collection["PollName"], collection["Status"]);
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
            ViewData.Model = new PollService().GetItem(id);
            return View();
        }
        [HttpPost]
        public ActionResult JsonDelete(int id)
        {
            new PollService().Delete(id);
            return Json(true);
        }
        //
        // POST: /Poll/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
                new PollService().Delete(id);
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
            ViewData.Model = new PollService().GetItem(id);
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
                new PollService().Edit(id, collection["PollName"], collection["Status"]);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult GetSelectStatus()
        {
            IEnumerable<SelectListItem> list = CustomSelectList.CreatePollStatus();
            return Content(list.ToHtml());
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
        }

        [HttpPost]
        public ActionResult List(int page, int rows, string sidx, string sord)
        {
            var poll = new PollService().List();
            bool searchOn = bool.Parse(Request.Form["_search"]);
            string searchExp = "";
            if (searchOn)
            {
                searchExp = string.Format("{0}.ToString().Contains(@0)", getFormValue("searchField"));
                poll = poll.Where(searchExp, new string[] { getFormValue("searchString") });
            }
            var model = from entity in poll.OrderBy(sidx + " " + sord)
                        select new
                        {
                            Id = entity.Id,
                            PollName = entity.PollName,
                            Status = entity.Status
                        };
            return Json(model.ToJqGridData(page, rows, null, "", new[] { "PollName", "Status" }), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult EditRow(int? id, string PollName, string Status, string oper)
        {
            
            if (id.HasValue)
            {
                if (oper == JqGridOperations.del.ToString())
                {
                    new PollService().Delete(id.Value);
                }
                new PollService().Edit(id.Value, PollName, Status);
            }
            else
            {
                new PollService().Add(PollName, Status);
            }
            return Content("true");
        }
    }
}
