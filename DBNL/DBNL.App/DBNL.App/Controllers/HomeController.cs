using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DBNL.App.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        public ActionResult Admin()
        {
            ViewData["Message"] = "Welcome to ASP.NET MVC!";
            
            return View();
        }

        public ActionResult About()
        {
            return View();
        }
        public ActionResult Index()
        {
            return View();
        }
    }
}
