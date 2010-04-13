using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using DBNL.App.Models;
using DBNL.App.Models.Business;
using DBNL.App.Models.Statics;

namespace DBNL.App.Admin.Controllers
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
            return View();
        } 

        //
        // POST: /Roles/Create

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                var roll = new Role() { };
                
                roll.RoleName = collection["RoleName"];
                foreach (string key in collection.AllKeys)
                {
                    if (key.StartsWith("category_") && collection[key] == "on")
                    {
                        string id = key.Split('_')[1];
                        roll.ContentPermission += (id + ",");//(string.IsNullOrEmpty(roll.ContentPermission) ? string.Empty : "," + key.Split('_')[1]);
                        //roll.ContentPermission +=  key.Split('_')[1];
                    }
                }
                
                if (string.IsNullOrEmpty(roll.RoleName)) {
                    throw new Exception(""); }

                roll.IsFullPermission           = !string.IsNullOrEmpty(collection["FullControl"]) && collection["FullControl"] == "on";
                roll.AllowManageRole            = !string.IsNullOrEmpty(collection["Role"]) && collection["Role"] == "on";
                roll.AllowManageUser            = !string.IsNullOrEmpty(collection["User"]) && collection["User"] == "on";
                roll.AllowManageMenu            = !string.IsNullOrEmpty(collection["Menu"]) && collection["Menu"] == "on";
                roll.AllowManageAllContent      = !string.IsNullOrEmpty(collection["AllContent"]) && collection["AllContent"] == "on";
                roll.AllowManageLink            = !string.IsNullOrEmpty(collection["Link"]) && collection["Link"] == "on";
                roll.AllowManageOnlineSupporter = !string.IsNullOrEmpty(collection["OnlineSupport"]) && collection["OnlineSupport"] == "on";
                roll.AllowManageContact         = !string.IsNullOrEmpty(collection["Contact"]) && collection["Contact"] == "on";
                roll.AllowManagePoll            = !string.IsNullOrEmpty(collection["Poll"]) && collection["Poll"] == "on";
                roll.AllowManageBanner          = !string.IsNullOrEmpty(collection["Banner"]) && collection["Banner"] == "on";

                RoleService.AddRole(roll);
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
