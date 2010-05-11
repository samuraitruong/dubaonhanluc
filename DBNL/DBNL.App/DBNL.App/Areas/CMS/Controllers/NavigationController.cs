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
using System.Web.Routing;


namespace DBNL.App.Areas.CMS.Controllers
{
    public class NavigationController : Controller
    {
        //
        // GET: /Navigation/

        public ActionResult Index()
        {
            ViewData.Model = new NavigationService().GetItems();
            return View();
        }

        //
        // GET: /Navigation/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }
        [HttpPost]
        public ActionResult Reorder(int Id, string Method)
        {
            new NavigationService().Reorder(Id, Method);
            return Json(true);
        }
        //
        // GET: /Navigation/Create

        public ActionResult Create()
        {
            ViewData["ExtraData"] = new NavigationDataView()
            { 
                Categories = CustomSelectList.CreateListCategories(true),
                NavigationPositions = CustomSelectList.CreateMenuPosition(),
                RootNavigations = CustomSelectList.CreateListNavigations(true),
                SiteModules = CustomSelectList.CreateModuleList(),
                OrphanArticles = CustomSelectList.CreateListOphanArticles(),
            };
            return View(new Models.Navigation());
        }

        [HttpPost]
        public ActionResult List(int page, int rows, string sidx, string sord, int? ParentId, string Position)
        {
            var navigations = new NavigationService().List(ParentId, Position);
            bool searchOn = bool.Parse(Request.Form["_search"]);
            string searchExp = "";

            var model = from entity in navigations.OrderBy(sidx + " " + sord)
                        select new
                        {
                            Id = entity.Id,
                            Name = entity.Name,
                            Component = entity.Component,
                            Url= GetUrl(entity),
                            DisplayOrder = entity.DisplayOrder
                        };
            return Json(model.ToJqGridData(page, rows, null, "", new[] { "Name" }), JsonRequestBehavior.AllowGet);
        }

        private string GetUrl(Navigation entity)
        {
             if(entity.Component == SiteModules.Article.ToString())
                 return Url.Action(entity.Action, entity.Controller, new { Area = "", id = entity.CategoryId });

             if (entity.Component == SiteModules.Post.ToString())
                 return Url.Action(entity.Action, entity.Controller, new { Area = "", id = entity.ContentId });


             if (entity.Component == SiteModules.Url.ToString())
                 return entity.ExternalUrl;
            return Url.Action(entity.Action, entity.Controller, new { Area = ""});
        }

        

        //
        // POST: /Navigation/Create

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(FormCollection collection, Navigation navigation)
        {
            try
            {
                navigation.Status= EntityStatuses.Actived.ToString();

                if (!ModelState.IsValid)
                {
                    ViewData["ExtraData"] = new NavigationDataView()
                    {
                        Categories = CustomSelectList.CreateListCategories(true),
                        NavigationPositions = CustomSelectList.CreateMenuPosition(),
                        RootNavigations = CustomSelectList.CreateListNavigations(true),
                        SiteModules = CustomSelectList.CreateModuleList()
                    };

                    return View(navigation);
                }
                if (collection["Component"] == SiteModules.Post.ToString())
                {
                    if (navigation.ContentId.HasValue)
                    {
                        navigation.Controller = DBNL.App.Models.Statics.Controllers.Article.ToString();
                        navigation.Action = DBNL.App.Models.Statics.Actions.View.ToString();
                        navigation.Area = "";

                    }
                }

                if(collection["Component"] == SiteModules.Article.ToString()) 
                {
                    if (navigation.CategoryId.HasValue)
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
                if (collection["Component"] == SiteModules.Home.ToString())
                {
                    navigation.Controller = DBNL.App.Models.Statics.Controllers.Home.ToString();
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
                
                new NavigationService().Create(navigation);
                return RedirectToAction("Index");
            }
            catch
            {
                throw;
                ViewData.Model = new NavigationDataView()
                {
                    Categories = CustomSelectList.CreateListCategories(true),
                    NavigationPositions = CustomSelectList.CreateMenuPosition(),
                    RootNavigations = CustomSelectList.CreateListNavigations(true),
                    SiteModules = CustomSelectList.CreateModuleList()
                };

                return View();
            }
        }
        //
        // GET: /Navigation/Edit/5
 
        public ActionResult Edit(int id)
        {
            Navigation nav = new NavigationService().GetItem(id);
            ViewData["ExtraData"] = new NavigationDataView()
            {
                Categories = CustomSelectList.CreateListCategories(true, nav.CategoryId),
                NavigationPositions = CustomSelectList.CreateMenuPosition(nav.Position),
                RootNavigations = CustomSelectList.CreateListNavigations(true, nav.ParentId),
                SiteModules = CustomSelectList.CreateModuleList(nav.Component)
            };
            
            return View(nav);
        }
        [HttpPost]
        public ActionResult JsonDelete(int id)
        {
            new NavigationService().Delete(id);
            return Json(true);
        }
        //
        // POST: /Navigation/Edit/5

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(int id, Navigation navigation, FormCollection collection)
        {
            try
            {

                if (!ModelState.IsValid)
                {
                    ViewData["ExtraData"] = new NavigationDataView()
                    {
                        Categories = CustomSelectList.CreateListCategories(true, navigation.CategoryId),
                        NavigationPositions = CustomSelectList.CreateMenuPosition(navigation.Position),
                        RootNavigations = CustomSelectList.CreateListNavigations(true, navigation.ParentId),
                        SiteModules = CustomSelectList.CreateModuleList(navigation.Component)
                    };
                    return View(navigation);
                }
                if (collection["Component"] == SiteModules.Post.ToString())
                {
                    if (navigation.CategoryId.HasValue)
                    {
                        navigation.Controller = DBNL.App.Models.Statics.Controllers.Article.ToString();
                        navigation.Action = DBNL.App.Models.Statics.Actions.View.ToString();
                        navigation.Area = "";

                    }
                }

                if (collection["Component"] == SiteModules.Article.ToString())
                {
                    if (navigation.CategoryId.HasValue)
                    {
                        navigation.Controller = DBNL.App.Models.Statics.Controllers.Article.ToString();
                        navigation.Action = DBNL.App.Models.Statics.Actions.Category.ToString();
                        navigation.Area = "";

                    }
                }
                if (collection["Component"] == SiteModules.Home.ToString())
                {
                    navigation.Controller = DBNL.App.Models.Statics.Controllers.Home.ToString();
                    navigation.Action = DBNL.App.Models.Statics.Actions.Index.ToString();
                    //navigation.Area = "";
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

                

                new NavigationService().UpdateMenuItem(navigation);
 
                return RedirectToAction("Index");
            }
            catch
            {
                ViewData["ExtraData"] = new NavigationDataView()
                {
                    Categories = CustomSelectList.CreateListCategories(true, navigation.CategoryId),
                    NavigationPositions = CustomSelectList.CreateMenuPosition(navigation.Position),
                    RootNavigations = CustomSelectList.CreateListNavigations(true, navigation.ParentId),
                    SiteModules = CustomSelectList.CreateModuleList(navigation.Component)
                };
                return View();
            }
        }

        public string Cotrollers { get; set; }
    }
}
