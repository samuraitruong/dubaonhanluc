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
                            Status = entity.Status,
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
                            Title = entity.Title
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
            return View();
        } 

        //
        // POST: /Content/Create

        [AcceptVerbs(HttpVerbs.Post)]
        [ValidateInput(false)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                HttpPostedFileBase picture = (HttpPostedFileBase)Request.Files["Picture"];
                // TODO: Add insert logic here
                Models.Content content = new Models.Content(){
                    Title = collection["Title"],
                    Content1 = collection["Content"],
                    Status = EntityStatuses.Actived.ToString(),
                    CreatedDate = DateTime.Now,
                    UpdatedDate = DateTime.Now,
                    UniqueKey = collection["Title"].ToUrlKey(),
                    CategoryId = int.Parse(collection["CategoryId"]),
                    IsFeatured = collection["IsFeatured"].Contains("true"),
                    Description = collection["Description"],
                };

                
                ContentService.Create(content, picture);

                return RedirectToAction("Index");
            }
            catch
            {
                throw;
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
