using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Linq.Dynamic;
using DBNL.App.Models;
using DBNL.App.Config;
using DBNL.App.Models.Business;
using DBNL.App.Models.ViewData;
using DBNL.App.Models.Statics;
using DBNL.App.Models.Helpers;
using DBNL.App.Models.Extensions;

namespace DBNL.App.Areas.CMS.Controllers
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
                            Name = entity.CategoryName,
                            ParentCateId = entity.ParentCategoryId,
                            IsFeatured = entity.IsFeatured,
                            ShowOnHP = entity.ShowOnHP
                        };
            return Json(model.ToJqGridData(page, rows, null, "", new[] { "Name", "ParentCateId", "IsFeatured", "ShowOnHP" }), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult FullList(int page, int rows, string sidx, string sord)
        {
            var categories = CategoryService.List();
            bool searchOn = bool.Parse(Request.Form["_search"]);
            string searchExp = "";

            var model = from entity in categories.OrderBy(sidx + " " + sord)
                        select new
                        {
                            Id = entity.ID,
                            Name = entity.CategoryName,
                            Permission="category_" + entity.ID.ToString()
                        };
            return Json(model.ToJqGridData(page, rows, null, "", new[] { "Name", "ParentCateId", "IsFeatured", "ShowOnHP" }), JsonRequestBehavior.AllowGet);
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

        [HttpPost]
        public ActionResult EditRow(FormCollection collection)
        {
            int? pCate = null;
            if (String.IsNullOrEmpty(collection["ParentCateId"]) == false)
            {
                pCate = Convert.ToInt32(collection["ParentCateId"]);
            }
            if (IsNumeric(collection["Id"]))
            {
                CategoryService.Edit(Convert.ToInt32(collection["Id"]), collection["Name"], pCate, Convert.ToBoolean(collection["IsFeatured"]), Convert.ToBoolean(collection["ShowOnHP"]));
            }
            else
            {
                CategoryService.AddCategory(collection["Name"], pCate);
            }
            return Content("true");
        }

        public ActionResult GetSelectParentId()
        {
            IEnumerable<SelectListItem> list = CustomSelectList.CreateListCategories(true);
            return Content(list.ToHtml());
        }

        public static bool IsNumeric (Object Expression)
        {
            if(Expression == null || Expression is DateTime)
                return false;

            if(Expression is Int16 || Expression is Int32 || Expression is Int64 || Expression is Decimal || Expression is Single || Expression is Double || Expression is Boolean)
                return true;
          
            try
            {
                if (Expression is string)
                    Double.Parse(Expression.ToString());
                else
                {
                    Double.Parse(Expression.ToString());
                    return true;
                }
             } catch {}
                return false;
         }
    }
}
