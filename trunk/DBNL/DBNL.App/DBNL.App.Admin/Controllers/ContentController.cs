using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using DBNL.App.Models.Statics;
using DBNL.App.Models.Business;
using DBNL.App.Models.Extensions;

namespace DBNL.App.Admin.Controllers
{
    public class ContentController : Controller
    {
        //
        // GET: /Content/

        public ActionResult Index()
        {
            ViewData.Model = ContentService.GetItems();
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
                    Description = collection["Description"]
                };

                
                ContentService.Create(content);

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
