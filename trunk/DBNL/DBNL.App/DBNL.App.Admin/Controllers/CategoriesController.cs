using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using DBNL.App.Models.Business;

namespace DBNL.App.Admin.Controllers
{
    public class CategoriesController : Controller
    {
        //
        // GET: /Categories/

        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /Categories/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Categories/Create
        public ActionResult List()
        {
            ViewData.Model = CategoryService.GetAllCategories();
            return View();
        }
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                string name = collection["CategoryName"];
                int? pid = null;
                if(!string.IsNullOrEmpty(collection["ParentCategoryId"]))
                {
                    pid = int.Parse(collection["ParentCategoryId"]);
                }
                CategoryService.AddCategory(name, pid);
                return RedirectToAction("List");
            }
            catch(Exception ex){
            }
            return View();
        }
        public ActionResult Create()
        {
            ViewData["Categories"] = new SelectList(CategoryService.GetAllCategories(), "ID", "CategoryName");
            return View();
        }
        //
        // POST: /Categories/Create

        //
        // GET: /Categories/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Categories/Edit/5

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
