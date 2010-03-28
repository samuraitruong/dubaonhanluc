using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DBNL.App.Models.Business;
using System.Linq.Dynamic;
using DBNL.App.Models.Helpers;
using DBNL.App.Models.Statics;
using DBNL.App.Models.Extensions;

namespace DBNL.App.Admin.Controllers
{
    public class CategoriesController : Controller
    {
        //
        // GET: /Categories/

        public ActionResult Index()
        {
            return RedirectToAction("List");
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
        public ActionResult List(int page, int rows, string sidx, string sord, int? ParentId)
        {
            var categories = CategoryService.List(ParentId);
            bool searchOn = bool.Parse(Request.Form["_search"]);
            string searchExp = "";
            
            var model = from entity in categories.OrderBy(sidx + " " + sord)
                        select new
                        {
                            Id = entity.ID,
                            Name = entity.CategoryName
                        };
            return Json(model.ToJqGridData(page, rows, null, "", new[] { "Name"}), JsonRequestBehavior.AllowGet);
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
            ViewData["Categories"] = CustomSelectList.CreateListCategories(true);
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
