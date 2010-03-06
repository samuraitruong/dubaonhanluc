using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using DBNL.App.Models.Business;
using DBNL.App.Models;
using DBNL.App.Models.Statics;
using DBNL.App.Models.ViewData;

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
                    Possition = collection["Possition"],
                    ContentId = string.IsNullOrEmpty(collection["ContentId"]) ? new Nullable<int>() : int.Parse(collection["ContentId"]),
                    ParentId = string.IsNullOrEmpty(collection["ParentId"]) ? new Nullable<int>() : int.Parse(collection["ParentId"]),
                    Status= EntityStatuses.Actived.ToString()
                };

                if(navigation.ContentId.HasValue){
                   navigation.Controller = DBNL.App.Models.Statics.Controllers.Article.ToString() ;
                   navigation.Action= DBNL.App.Models.Statics.Actions.View.ToString();
                   navigation.Area = "";
                    
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
