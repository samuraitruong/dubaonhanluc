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
                UserService.Add(user.username, user.Name, user.Password, user.Status);
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
    }
}
