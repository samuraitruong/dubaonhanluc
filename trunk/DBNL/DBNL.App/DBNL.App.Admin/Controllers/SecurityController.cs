using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using DBNL.App.Models.Business;
using System.Web.Security;

namespace DBNL.App.Admin.Controllers
{
    public class SecurityController : Controller
    {
        //
        // GET: /Security/

        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();
           return  RedirectToAction("LogOn", "Security");
            return View();
        }

        public ActionResult LogOn()
        {
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

           return  this.RedirectFromLoginPage(u.Username, ReturnUrl);


        }

    }
}
