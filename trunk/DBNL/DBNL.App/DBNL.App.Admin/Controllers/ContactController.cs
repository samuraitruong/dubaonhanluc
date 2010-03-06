using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DBNL.App.Models.Business;
using DBNL.App.Models;

namespace DBNL.App.Admin.Controllers
{
    public class ContactController : Controller
    {
        //
        // GET: /Contact/

        public ActionResult Index()
        {
            return RedirectToAction("List");
        }

        //
        // GET: /Contact/Details/5

        public ActionResult Details(int id)
        {
            ViewData.Model = ContactService.GetItem(id);
            return View();
        }

        //
        // GET: /Contact/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Contact/Create

        [HttpPost]
        public ActionResult Create(Contact contact)
        {
            try
            {
                // TODO: Add insert logic here
                ContactService.Add(contact.Name, contact.Email, contact.Status);
                return RedirectToAction("List");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult List()
        {
            ViewData.Model = ContactService.GetAllItems();
            return View();
        }

        //
        // GET: /Contact/Delete/5
 
        public ActionResult Delete(int id)
        {
            ViewData.Model = ContactService.GetItem(id);
            return View();
        }

        //
        // POST: /Contact/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
                ContactService.Delete(id);
                return RedirectToAction("List");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Contact/Edit/5
 
        public ActionResult Edit(int id)
        {
            ViewData.Model = ContactService.GetItem(id);
            return View();
        }

        //
        // POST: /Contact/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, string name, string email, string status)
        {
            try
            {
                // TODO: Add update logic here
                ContactService.Edit(id, name, email, status);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
