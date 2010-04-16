using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using DBNL.App.Models.Business;
using System.Web.Security;
using DBNL.App.Models;

namespace DBNL.App.Areas.CMS.Controllers
{
    public class SecurityController : Controller
    {
        //
        // GET: /Security/

        public ActionResult LogOff()
        {
            SessionManager.Profile = null;
            FormsAuthentication.SignOut();
           return  RedirectToAction("LogOn", "Security");
            return View();
        }

        public ActionResult LogOn()
        {
            SessionManager.Profile = null;
            //throw new Exception(FormsAuthentication.HashPasswordForStoringInConfigFile("spadmin", "MD5"));
            return View();
        }
        private ActionResult RedirectFromLoginPage(string userName, string ReturnUrl)
        {
            FormsAuthentication.SetAuthCookie(userName, false);

            if (!string.IsNullOrEmpty(ReturnUrl))
                return Redirect(ReturnUrl);
            else
                return RedirectToAction("Index", "Administrations");
        }
        [HttpPost]
        public ActionResult LogOn(string Username, string Password, string ReturnUrl)
        {
            Models.User u = UserService.GetValidateUser(Username, FormsAuthentication.HashPasswordForStoringInConfigFile(Password, "MD5"));
            if (u == null)
            {
                ViewData.ModelState.AddModelError("Username", "Incorect username or password");
                return View();
            }

            SessionManager.Profile = new Profile() { 
                Id = u.Id,
                Role = u.MixRole,
                Name = u.Name,
                User = u
            };

           return  this.RedirectFromLoginPage(u.Name, ReturnUrl);


        }

    }
}
