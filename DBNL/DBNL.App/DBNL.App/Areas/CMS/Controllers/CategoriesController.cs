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
        public ActionResult JsonDelete(int id)
        {
            CategoryService.Delete(id);
            return Json(true);
        }
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
                            ShowOnHP = entity.ShowOnHP,
                            Articles = entity.CountArticles(true),
                            Url = Url.Action(Actions.Category.ToString(), SiteModules.Article.ToString(), new {id = entity.ID, Area=""})
                        };
            return Json(model.ToJqGridData(page, rows, null, "", new[] { "Name", "ParentCateId", "IsFeatured", "ShowOnHP" }), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult TreeNode(int? Node, FormCollection collection)
        {
            IEnumerable<ContentCategory> categories =null;
            if (Node == null)
            {
                categories = CategoryService.GetItems(new Nullable<int>());
            }
            else
            {
                categories = CategoryService.GetItems(Node.Value);
            }
            var query = from p in categories
                        select new {
                            text=p.CategoryName,
                            hasChildren = p.ContentCategories.Count>0,
                            id=p.ID.ToString(),
                            classes ="Clickable"
                        };

            return Json(query);
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
        public ActionResult Create(ContentCategory category, FormCollection collection)
        {
            try
            {
                if (!ModelState.IsValid) {
                    ViewData["Categories"] = CustomSelectList.CreateListCategories(true);
                    return View(category);
                }

                CategoryService.Create(category);

               
                return RedirectToAction("List");
            }
            catch(Exception ex){
                ModelState.AddModelError("Exception", ex);
            }
            ViewData["Categories"] = CustomSelectList.CreateListCategories(true);
            return View(category);
        }
        public ActionResult Create()
        {
            ViewData["Categories"] = CustomSelectList.CreateListCategories(true);
            ViewData["Articles"] = CustomSelectList.CreateListOphanArticles();
            return View();
        }
        //
        // POST: /Categories/Create

        //
        // GET: /Categories/Edit/5
 
        public ActionResult Edit(int id)
        {var item = CategoryService.GetItem(id);
            ViewData["Categories"] = CustomSelectList.CreateListCategories(false);
            ViewData["Status"] = CustomSelectList.CreateEntityStatus().SetSelectedValue(item.Status);
            
            return View(item);
        }

        //
        // POST: /Categories/Edit/5

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(int id, ContentCategory category, FormCollection collection)
        {
            try
            {
                if (!ModelState.IsValid){ 
                    ViewData["Categories"] = CustomSelectList.CreateListCategories(true);
                    ViewData["Status"] = CustomSelectList.CreateEntityStatus();
                    return View(category);

                };
                // TODO: Add update logic here
                CategoryService.Update(id, category);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        [HttpPost]
        public ActionResult EditRow(int? id, string oper, bool IsFeatured, string Name, int? ParentCateId, bool ShowOnHP)
        {
            if (oper == JqGridOperations.edit.ToString())
            {
                CategoryService.Edit(id.Value, Name, ParentCateId, IsFeatured, ShowOnHP);
            }
            if (oper == JqGridOperations.add.ToString())
            {
                CategoryService.AddCategory(Name, ParentCateId);
            }
            //int? pCate = null;
            //if (String.IsNullOrEmpty(collection["ParentCateId"]) == false)
            //{
            //    pCate = Convert.ToInt32(collection["ParentCateId"]);
            //}
            //if (IsNumeric(collection["Id"]))
            //{
            //    CategoryService.Edit(Convert.ToInt32(collection["Id"]), collection["Name"], pCate, Convert.ToBoolean(collection["IsFeatured"]), Convert.ToBoolean(collection["ShowOnHP"]));
            //}
            //else
            //{
            //    CategoryService.AddCategory(collection["Name"], pCate);
            //}
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
