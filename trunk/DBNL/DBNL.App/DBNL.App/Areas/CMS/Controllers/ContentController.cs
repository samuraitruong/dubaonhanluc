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

namespace DBNL.App.Areas.CMS.Controllers
{
    public class ContentController : Controller
    {
        //
        // GET: /Content/
        [HttpPost]
        public ActionResult ToggleActive(int id) {
            ContentService.ToggleActive(id);
            return Json(true);
        }
        [HttpPost]
        public ActionResult ToggleOnHP(int id)
        {
            ContentService.ToggleOnHP(id);
            return Json(true);
        }
        [HttpPost]
        public ActionResult GetList(int page, int rows, string sidx, string sord, int? CategoryId)
        {
            IQueryable<Models.Content> contents ;

            if (!CategoryId.HasValue) contents = ContentService.All();
            else

                contents = ContentService.List(CategoryId.Value);

            bool searchOn = bool.Parse(Request.Form["_search"]);
            string searchExp = "";
            if (searchOn)
            {
                searchExp = string.Format("{0}.ToString().Contains(@0)", getFormValue("searchField"));
                contents = contents.Where(searchExp, new string[] { getFormValue("searchString") });
            }
            var model = from entity in contents.OrderBy(sidx + " " + sord)
                        select new
                        {
                            Id = entity.ContentId,
                            Title = entity.Title,
                            Thumbnail = entity.ThumbnailUrl,
                            Category= entity.ContentCategory.CategoryName,
                            Featured = entity.IsFeatured,
                            IsForcusing = entity.IsFocusing,
                            PostedDate = entity.CreatedDate.ToShortDateString(),
                            Status = entity.Status,
                            Url = this.Url.Action("View",Models.Statics.Controllers.Article.ToString(), new {Area="", id=entity.ContentId})
                        };
            return Json(model.ToJqGridData(page, rows, null, "", new[] { "Title" }), JsonRequestBehavior.AllowGet);
        }
        
            [HttpPost]
        public ActionResult GetOrphanArticles(int page, int rows, string sidx, string sord)
        {
            var contents = ContentService.AllOrhanArticles();
            bool searchOn = bool.Parse(Request.Form["_search"]);
            string searchExp = "";
            if (searchOn)
            {
                searchExp = string.Format("{0}.ToString().Contains(@0)", getFormValue("searchField"));
                contents = contents.Where(searchExp, new string[] { getFormValue("searchString") });
            }
            var model = from entity in contents.OrderBy(sidx + " " + sord)
                        select new
                        {
                            Id = entity.ContentId,
                            Title = entity.Title,
                            Thumbnail = entity.ThumbnailUrl,
                            Status = entity.Status,
                            PostedDate = entity.CreatedDate.ToShortDateString(),
                            Url= this.Url.Action("View",Models.Statics.Controllers.Article.ToString(), new {Area="", id=entity.ContentId})
                        };
            return Json(model.ToJqGridData(page, rows, null, "", new[] { "Title" }), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult List(int page, int rows, string sidx, string sord, int CategoryId)
        {
            var contents = ContentService.List(CategoryId);
            bool searchOn = bool.Parse(Request.Form["_search"]);
            string searchExp = "";
            if (searchOn)
            {
                searchExp = string.Format("{0}.ToString().Contains(@0)", getFormValue("searchField"));
                contents = contents.Where(searchExp, new string[] { getFormValue("searchString") });
            }
            var model = from entity in contents.OrderBy(sidx + " " + sord)
                        select new
                        {
                            Id = entity.ContentId,
                            Title = entity.Title,
                            Thumbnail = entity.ThumbnailUrl,
                            Status = entity.Status,
                            Featured = entity.IsFeatured,
                            IsForcusing = entity.IsFocusing,
                            PostedDate = entity.CreatedDate.ToShortDateString(),
                            Url= this.Url.Action("View",Models.Statics.Controllers.Article.ToString(), new {Area="", id=entity.ContentId})
                        };
            return Json(model.ToJqGridData(page, rows, null, "", new[] { "Title" }), JsonRequestBehavior.AllowGet);
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
        public ActionResult Index()
        {
            ViewData["Categories"] = CustomSelectList.CreateListCategories(false);

            //ViewData.Model = ContentService.GetItems();
            return View();
        }

        //
        // GET: /Content/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Content/Create

        public ActionResult Create()
        {
            ViewData["Categories"] = CustomSelectList.CreateListCategories(false);
            
            return View(new Models.Content());
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult CreateIn (Models.Content content, FormCollection collection)
        {
            try
            {
                HttpPostedFileBase picture = (HttpPostedFileBase)Request.Files["Picture"];
                content.UniqueKey = content.Title.ToUrlKey();
                content.Status = EntityStatuses.Actived.ToString();


                if (!ModelState.IsValid)
                {
                    ViewData["Category"] = CategoryService.GetById(content.CategoryId);
                    return View(content);
                }

                ContentService.Create(content, picture);

                return RedirectToAction("Index", "Content");
            }
            catch
            {
                ViewData["Category"] = CategoryService.GetById(content.CategoryId);
                return View(content);
            }
        }
        public ActionResult CreateIn(int id)
        {
            ViewData["Category"] = CategoryService.GetById(id);
            return View(new Models.Content() {CategoryId =  id});
        } 

        //
        // POST: /Content/Create

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(Models.Content content, FormCollection collection)
        {
            try
            {
                HttpPostedFileBase picture = (HttpPostedFileBase)Request.Files["Picture"];
                // TODO: Add insert logic here
                //Models.Content content = new Models.Content(){
                //    Title = collection["Title"],
                //    Content1 = collection["Content"],
                //    Status = EntityStatuses.Actived.ToString(),
                //    CreatedDate = DateTime.Now,
                //    UpdatedDate = DateTime.Now,
                //    UniqueKey = collection["Title"].ToUrlKey(),
                //    CategoryId = int.Parse(collection["CategoryId"]),
                //    IsFeatured = collection["IsFeatured"].Contains("true"),
                //    Description = collection["Description"],
                //};
                content.UniqueKey = content.Title.ToUrlKey();
                content.Status = EntityStatuses.Actived.ToString();
                

                if (!ModelState.IsValid)
                {
                    return View(content);
                }

                ContentService.Create(content, picture);

                return RedirectToAction("Index");
            }
            catch
            {
                return View( content);
            }
        }

        //
        // GET: /Content/Edit/5
 
        public ActionResult Edit(int id)
        {

            var item = ContentService.GetItem(id);
            if (item == null) return RedirectToAction("Index");
            ViewData["Categories"] = CustomSelectList.CreateListCategories(false).SetSelectedValue(item.CategoryId.ToString());

            return View(item);
        }
        public ActionResult EditContent(int id)
        {

            var item = ContentService.GetItem(id);
            if (item == null) return RedirectToAction("Index");

            return View(item);
        }

        //
        // POST: /Content/Edit/5

        public ActionResult JsonDelete(int id)
        {
            ContentService.Delete(id);
            return Json(true);
        }
        [AcceptVerbs(HttpVerbs.Post)]
        [ValidateInput(false)]
        public ActionResult Edit(int id, Models.Content content, FormCollection collection)
        {
            try
            {
                if (!ModelState.IsValid) {
                    ViewData["Categories"] = CustomSelectList.CreateListCategories(false).SetSelectedValue(content.CategoryId.ToString());
                    return View(content); }
                HttpPostedFileBase picture = (HttpPostedFileBase)Request.Files["Picture"];
                ContentService.Update(content, picture);
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        [AcceptVerbs(HttpVerbs.Post)]
        [ValidateInput(false)]
        public ActionResult EditContent(int id, Models.Content content, FormCollection collection)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return View(content);
                }
                HttpPostedFileBase picture = (HttpPostedFileBase)Request.Files["Picture"];
                ContentService.Update(content, picture);

                return RedirectToAction("Index","Administrations");
            }
            catch
            {
                return View();
            }
        }
    }
}
