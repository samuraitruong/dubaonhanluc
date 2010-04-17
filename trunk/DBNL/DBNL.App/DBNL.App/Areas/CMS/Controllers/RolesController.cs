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
    public class RolesController : Controller
    {
        //
        // GET: /Roles/

        public ActionResult Index()
        {
            ViewData.Model = RoleService.GetRoles();
            return View();
        }

        //
        // GET: /Roles/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Roles/Create

        public ActionResult Create()
        {
            return View(new Role());
        }

        [HttpPost]
        public ActionResult FullList(int page, int rows, string sidx, string sord)
        {
            var roles = RoleService.List();
            bool searchOn = bool.Parse(Request.Form["_search"]);
            string searchExp = "";

            var model = from entity in roles.OrderBy(sidx + " " + sord)
                        select new
                        {
                            Id = entity.Id,
                            Name = entity.RoleName,
                            Permission = "roleid_" + entity.Id.ToString()
                        };
            return Json(model.ToJqGridData(page, rows, null, "", new[] { "Name"}), JsonRequestBehavior.AllowGet);
        }

        //
        // POST: /Roles/Create

        [HttpPost]
        public ActionResult List(int page, int rows, string sidx, string sord)
        {
            var roles = RoleService.List();
            bool searchOn = bool.Parse(Request.Form["_search"]);
            string searchExp = "";
            if (searchOn)
            {
                searchExp = string.Format("{0}.ToString().Contains(@0)", getFormValue("searchField"));
                roles = roles.Where(searchExp, new string[] { getFormValue("searchString") });
            }
            var model = from entity in roles.OrderBy(sidx + " " + sord)
                        select new
                        {
                            Id = entity.Id,
                            RoleName = entity.RoleName,
                            IsFullPermission = entity.IsFullPermission,
                            AllowManageContent = entity.AllowManageAllContent,
                            AllowManageUser = entity.AllowManageUser,

                            AllowManageBanner = entity.AllowManageBanner,
                            AllowManageContact = entity.AllowManageContact,
                            AllowManageLink = entity.AllowManageLink,
                            AllowManageMenu = entity.AllowManageMenu,
                            AllowManageOnlineSupporter = entity.AllowManageOnlineSupporter,
                            AllowManagePoll = entity.AllowManagePoll,
                            AllowManageRole = entity.AllowManageRole,
                        };
            return Json(model.ToJqGridData(page, rows, null, "", new[] { "RoleName" }), JsonRequestBehavior.AllowGet);
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

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(FormCollection collection, Role role)
        {
            try
            {
                // TODO: Add insert logic here

                //var roll = new Role() { };
                
                //roll.RoleName = collection["RoleName"];
                if (!ModelState.IsValid) return View(role);


                foreach (string key in collection.AllKeys)
                {
                    if (key.StartsWith("category_") && collection[key] == "on")
                    {
                        string id = key.Split('_')[1];
                        role.ContentPermission += (id + ",");//(string.IsNullOrEmpty(roll.ContentPermission) ? string.Empty : "," + key.Split('_')[1]);
                        //roll.ContentPermission +=  key.Split('_')[1];
                    }
                }
                
                if (string.IsNullOrEmpty(role.RoleName)) {
                    throw new Exception(""); }

                role.IsFullPermission = !string.IsNullOrEmpty(collection["FullControl"]) && collection["FullControl"] == "on";
                role.AllowManageRole = !string.IsNullOrEmpty(collection["Role"]) && collection["Role"] == "on";
                role.AllowManageUser = !string.IsNullOrEmpty(collection["User"]) && collection["User"] == "on";
                role.AllowManageMenu = !string.IsNullOrEmpty(collection["Menu"]) && collection["Menu"] == "on";
                role.AllowManageAllContent = !string.IsNullOrEmpty(collection["AllContent"]) && collection["AllContent"] == "on";
                role.AllowManageLink = !string.IsNullOrEmpty(collection["Link"]) && collection["Link"] == "on";
                role.AllowManageOnlineSupporter = !string.IsNullOrEmpty(collection["OnlineSupport"]) && collection["OnlineSupport"] == "on";
                role.AllowManageContact = !string.IsNullOrEmpty(collection["Contact"]) && collection["Contact"] == "on";
                role.AllowManagePoll = !string.IsNullOrEmpty(collection["Poll"]) && collection["Poll"] == "on";
                role.AllowManageBanner = !string.IsNullOrEmpty(collection["Banner"]) && collection["Banner"] == "on";

                RoleService.AddRole(role);
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Roles/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Roles/Edit/5

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
