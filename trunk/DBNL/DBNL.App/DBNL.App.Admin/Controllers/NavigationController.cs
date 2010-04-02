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
using DBNL.App.Models.ViewData;
using DBNL.App.Models;


namespace DBNL.App.Admin.Controllers
{
    public class NavigationController : Controller
    {
        //
        // GET: /Navigation/

        public ActionResult Index()
        {
            ViewData.Model = NavigationService.GetItems();
            return View();
        }

        //
        // GET: /Navigation/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Navigation/Create

        public ActionResult Create()
        {
            //ViewData["Categories"] = new SelectList(CategoryService.GetAllCategories(), "ID", "CategoryName");
            ViewData.Model = new NavigationDataView() { 
                Categories = CustomSelectList.CreateListCategories(true),
                NavigationPositions = CustomSelectList.CreateMenuPosition(),
                RootNavigations = CustomSelectList.CreateListNavigations(true)
            };
            return View();
        }

        [HttpPost]
        public ActionResult List(int page, int rows, string sidx, string sord, int? ParentId, string Position)
        {
            var navigations = NavigationService.List(ParentId, Position);
            bool searchOn = bool.Parse(Request.Form["_search"]);
            string searchExp = "";

            var model = from entity in navigations.OrderBy(sidx + " " + sord)
                        select new
                        {
                            Id = entity.Id,
                            Name = entity.Name
                        };
            return Json(model.ToJqGridData(page, rows, null, "", new[] { "Name" }), JsonRequestBehavior.AllowGet);
        }

        //
        // POST: /Navigation/Create

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {

                Navigation navigation = new Navigation()
                {
                    Name = collection["Name"],
                    Position = collection["Possition"],
                    ContentId = string.IsNullOrEmpty(collection["ContentId"]) ? new Nullable<int>() : int.Parse(collection["ContentId"]),
                    ParentId = string.IsNullOrEmpty(collection["ParentId"]) ? new Nullable<int>() : int.Parse(collection["ParentId"]),
                    Status= EntityStatuses.Actived.ToString(),
                    Component = collection["Component"]
                };
                if(collection["Component"] == SiteModules.Article.ToString()) 
                {
                    if (navigation.ContentId.HasValue)
                    {
                        navigation.Controller = DBNL.App.Models.Statics.Controllers.Article.ToString();
                        navigation.Action = DBNL.App.Models.Statics.Actions.Category.ToString();
                        navigation.Area = "";

                    }
                }

                if (collection["Component"] == SiteModules.WebLink.ToString())
                {
                        navigation.Controller = DBNL.App.Models.Statics.Controllers.WebLink.ToString();
                        navigation.Action = DBNL.App.Models.Statics.Actions.Index.ToString();
                        //navigation.Area = "";
                }


                if (collection["Component"] == SiteModules.WebContact.ToString())
                {
                    navigation.Controller = DBNL.App.Models.Statics.Controllers.WebContact.ToString();
                    navigation.Action = DBNL.App.Models.Statics.Actions.Index.ToString();
                    //navigation.Area = "";
                }

                if (collection["Component"] == SiteModules.Url.ToString())
                {
                    //navigation.Controller = DBNL.App.Models.Statics.Controllers.WebContact.ToString();
                    //navigation.Action = DBNL.App.Models.Statics.Actions.Index.ToString();
                    //navigation.Area = "";
                    navigation.ExternalUrl = collection["ExternalUrl"];
                }
                
                NavigationService.Create(navigation);
                return RedirectToAction("Index");
            }
            catch
            {
                throw;
                ViewData.Model = new NavigationDataView()
                {
                    Categories = CustomSelectList.CreateListCategories(true),
                    NavigationPositions = CustomSelectList.CreateMenuPosition(),
                    RootNavigations = CustomSelectList.CreateListNavigations(true)
                };

                return View();
            }
        }

        //
        // GET: /Navigation/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Navigation/Edit/5

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

        public string Cotrollers { get; set; }
    }
}
