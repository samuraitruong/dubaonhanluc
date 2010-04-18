using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Linq.Dynamic;
using System.Web.Mvc;
using DBNL.App.Models.ViewData;
using DBNL.App.Models.Business;
using DBNL.App.Models.Helpers;
using DBNL.App.Models;
using DBNL.App.Models.Statics;


namespace DBNL.App.Areas.CMS.Controllers
{
    public class SupporterController : Controller
    {
        //
        // GET: /Supporter/

        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult EditRow(int? id, string Name, string Type, string NickName, string oper)
        {

            if (oper == JqGridOperations.add.ToString())
            {
                Supporter sp = new Supporter() {
                    Name = Name,
                    NickName = NickName,
                    Status = EntityStatuses.Actived.ToString(),
                    Type = string.IsNullOrEmpty(Type)? SupportTypes.Yahoo.ToString() : Type,
                    };
                SupporterService.Add(sp);
                return Content("true");
            }
            if (oper == JqGridOperations.edit.ToString())
            {
                SupporterService.Edit(id.Value, NickName, Name);
            }

            if(oper == JqGridOperations.del.ToString()){
                SupporterService.Delete(id.Value);
            }

            return Content("true");
        }

        //
        // GET: /Supporter/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }
        
        public ActionResult Create()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(Supporter supporter)
        {
            SupporterService.Create(supporter);
            return RedirectToAction("Index");
        }
        //
       
        //
        // GET: /Supporter/Edit/5

        public ActionResult Public(int id)
        {
            SupporterService.Public(id);
            return Json(true);
        }

        public ActionResult Edit(int id)
        {
            return View();
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
        }        //
        [HttpPost]
        public ActionResult List(int page, int rows, string sidx, string sord)
        {

            var links = SupporterService.List();

            bool searchOn = bool.Parse(Request.Form["_search"]);
            string searchExp = "";
            if (searchOn)
            {
                searchExp = string.Format("{0}.ToString().Contains(@0)", getFormValue("searchField"));
                links = links.Where(searchExp, new string[] { getFormValue("searchString") });
            }


            var model = from entity in links.OrderBy(sidx + " " + sord)
                        select new
                        {
                            Id = entity.Id,
                            Name= entity.Name,
                            NickName = entity.NickName ,
                            Type = entity.Type,
                            Status = entity.Status
                        };




            return Json(model.ToJqGridData(page, rows, null, "", new[] { "Name", "NickName" }), JsonRequestBehavior.AllowGet);
        }

        //
        // POST: /Supporter/Edit/5

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
