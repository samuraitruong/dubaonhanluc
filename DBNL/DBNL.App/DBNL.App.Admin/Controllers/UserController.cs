using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DBNL.App.Models.Business;
using DBNL.App.Models;

namespace DBNL.App.Admin.Controllers
{
    public class UserController : Controller
    {
        //
        // GET: /User/

        public ActionResult Index()
        {
            return RedirectToAction("List");
        }

        //
        // GET: /User/Details/5

        public ActionResult Details(int id)
        {
            ViewData.Model = UserService.GetItem(id);
            return View();
        }

        //
        // GET: /User/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /User/Create

        [HttpPost]
        public ActionResult Create(User user)
        {
            try
            {
                // TODO: Add insert logic here
                UserService.Add(user.Username, user.Name, user.Password, user.Status);
                return RedirectToAction("List");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult List()
        {
            ViewData.Model = UserService.GetAllItems();
            return View();
        }

        //
        // GET: /User/Delete/5
 
        public ActionResult Delete(int id)
        {
            ViewData.Model = UserService.GetItem(id);
            return View();
        }

        //
        // POST: /User/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
                UserService.Delete(id);
                return RedirectToAction("List");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /User/Edit/5
 
        public ActionResult Edit(int id)
        {
            ViewData.Model = UserService.GetItem(id);
            return View();
        }

        //
        // POST: /User/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, string username, string name, string password, string status)
        {
            try
            {
                // TODO: Add update logic here
                UserService.Edit(id, username, name, password, status);
                return RedirectToAction("List");
            }
            catch
            {
                return View();
            }
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
        /*
        [HttpPost]
        public ActionResult List(int page, int rows, string sidx, string sord)
        {
            var user = UserService.List();
            bool searchOn = bool.Parse(Request.Form["_search"]);
            string searchExp = "";
            if (searchOn)
            {
                searchExp = string.Format("{0}.ToString().Contains(@0)", getFormValue("searchField"));
                user = user.Where(searchExp, new string[] { getFormValue("searchString") });
            }
            var model = from entity in user.OrderBy(sidx + " " + sord)
                        select new
                        {
                            EntityId = entity.Id,
                            Username = entity.Username,
                            Name = entity.Name,
                            Status = entity.Status
                        };
            return Json(model.ToJqGridData(page, rows, null, "", new[] { "Username", "Name", "Status" }), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult EditRow(int? id, string Username, string Name, string Status)
        {
            if (id.HasValue)
            {
                //UserService.Edit(id.Value, 
            }
            else
            {
                PollService.Add(PollName, Status);
            }
            return Content("true");
        }*/
    }
}
