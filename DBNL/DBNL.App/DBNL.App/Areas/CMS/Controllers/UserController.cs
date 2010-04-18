using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Linq.Dynamic;
using DBNL.App.Models.Business;
using DBNL.App.Models.Helpers;
using DBNL.App.Models.Statics;
using DBNL.App.Models.Extensions;
using System.Web.Security;


namespace DBNL.App.Areas.CMS.Controllers
{
    public class UserController : Controller
    {
        //
        // GET: /User/

        public ActionResult Index()
        {
            return RedirectToAction("List");
        }

        //
        // GET: /User/Details/5

        public ActionResult Details(int id)
        {
            ViewData.Model = UserService.GetItem(id);
            return View();
        }

        //
        // GET: /User/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /User/Create

        [HttpPost]
        public ActionResult Create(FormCollection forms)
        {
            try
            {
                // TODO: Add insert logic here
                List<int> Roles = new List<int>();
                Models.User user = new Models.User() {
                    CreatedDate= DateTime.Now,
                    Name = forms["Name"],
                    Password = FormsAuthentication.HashPasswordForStoringInConfigFile(forms["Password"], "MD5"),
                    Status= EntityStatuses.Actived.ToString(),
                    UpdatedDate = DateTime.Now,
                    Username = forms["Username"]
                };

                foreach (string key in forms.AllKeys)
                {
                    if (key.StartsWith("roleid") && forms[key] == "on")
                    {
                        string id = key.Split('_')[1];
                        Roles.Add(int.Parse(id));
                    }
                }

                UserService.Add(user, Roles);
                return RedirectToAction("List");
            }
            catch
            {
                return View();
            }
        }

        public ActionResult List()
        {
            ViewData.Model = UserService.GetAllItems();
            return View();
        }

        //
        // GET: /User/Delete/5
        [HttpPost]
        public ActionResult JsonDelete(int id)
        {
             UserService.Delete(id);
            return Json(true);
        }

        [HttpPost]
        public ActionResult Active(int id)
        {
            UserService.Active(id);
            return Json(true);
        }

        public ActionResult Delete(int id)
        {
            ViewData.Model = UserService.GetItem(id);
            return View();
        }

        //
        // POST: /User/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
                UserService.Delete(id);
                return RedirectToAction("List");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /User/Edit/5
        
        public ActionResult Edit(int? id)
        {

            Models.User user =  UserService.GetItem(id);
            if (user == null) return RedirectToAction("List");
            ViewData["RoleIds"] = (from u in user.UserInRoles select u.RoleId).ToList();
            ViewData.Model = user;
            return View();
        }

        //
        // POST: /User/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, Models.User user, FormCollection forms)
        {
            try
            {
                foreach (string key in forms.AllKeys)
                {
                    if (key.StartsWith("roleid") && forms[key] == "on")
                    {
                        string sid = key.Split('_')[1];
                        user.UserInRoles.Add(new Models.UserInRole() { RoleId = int.Parse(sid), UserId = id });
                    }
                }

                if (!ModelState.IsValid)
                {
                    ViewData["RoleIds"] = (from u in user.UserInRoles select u.RoleId).ToList();

                    return View(user);
                }
                user.UpdatedDate = DateTime.Now;
                if (user.Password != null)
                    user.Password = FormsAuthentication.HashPasswordForStoringInConfigFile(user.Password.Trim(), "MD5");


                
                UserService.UpdateUser(user);

                return RedirectToAction("List");
            }
            catch
            {
                return View();
            }
        }

        [HttpPost]
        public ActionResult List(int page, int rows, string sidx, string sord)
        {
            var users = UserService.List();
            bool searchOn = bool.Parse(Request.Form["_search"]);
            string searchExp = "";
            if (searchOn)
            {
                searchExp = string.Format("{0}.ToString().Contains(@0)", getFormValue("searchField"));
                users = users.Where(searchExp, new string[] { getFormValue("searchString") });
            }
            var model = from entity in users.OrderBy(sidx + " " + sord)
                        select new
                        {
                            Id = entity.Id,
                            Name = entity.Name,
                            Username = entity.Username,
                            Status = entity.Status,
                            Password = "",
                            Roles= entity.GetRoles()
                        };
            return Json(model.ToJqGridData(page, rows, null, "", new[] { "Name", "Username","Status" }), JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public ActionResult ListByRole(int page, int rows, string sidx, string sord, int RoleId)
        {
            var users = UserService.List(RoleId);
            bool searchOn = bool.Parse(Request.Form["_search"]);
            string searchExp = "";
            if (searchOn)
            {
                searchExp = string.Format("{0}.ToString().Contains(@0)", getFormValue("searchField"));
                users = users.Where(searchExp, new string[] { getFormValue("searchString") });
            }
            var model = from entity in users.OrderBy(sidx + " " + sord)
                        select new
                        {
                            Id = entity.Id,
                            Name = entity.Name,
                            Username = entity.Username,
                            Status = entity.Status,
                            Password = "",
                        };
            return Json(model.ToJqGridData(page, rows, null, "", new[] { "Name", "Username", "Status" }), JsonRequestBehavior.AllowGet);
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
        /*
        [HttpPost]
        public ActionResult List(int page, int rows, string sidx, string sord)
        {
            var user = UserService.List();
            bool searchOn = bool.Parse(Request.Form["_search"]);
            string searchExp = "";
            if (searchOn)
            {
                searchExp = string.Format("{0}.ToString().Contains(@0)", getFormValue("searchField"));
                user = user.Where(searchExp, new string[] { getFormValue("searchString") });
            }
            var model = from entity in user.OrderBy(sidx + " " + sord)
                        select new
                        {
                            EntityId = entity.Id,
                            Username = entity.Username,
                            Name = entity.Name,
                            Status = entity.Status
                        };
            return Json(model.ToJqGridData(page, rows, null, "", new[] { "Username", "Name", "Status" }), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult EditRow(int? id, string Username, string Name, string Status)
        {
            if (id.HasValue)
            {
                //UserService.Edit(id.Value, 
            }
            else
            {
                PollService.Add(PollName, Status);
            }
            return Content("true");
        }*/
    }
}
