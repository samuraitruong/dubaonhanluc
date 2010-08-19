using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace DBNL.App.Models
{
    public class RequiresAuthenticationAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {

            ////redirect if not authenticated
            //if (!filterContext.HttpContext.User.Identity.IsAuthenticated)
            //{

            //    //use the current url for the redirect
            //    string redirectOnSuccess = filterContext.HttpContext.Request.Url.AbsolutePath;

            //    //send them off to the login page
            //    string redirectUrl = string.Format("?ReturnUrl={0}", redirectOnSuccess);
            //    string loginUrl = FormsAuthentication.LoginUrl + redirectUrl;
            //    filterContext.HttpContext.Response.Redirect(loginUrl, true);

            //}

        }
    }
}