using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DBNL.App.Models.ViewData;
using DBNL.App.Models.Business;
using System.Text.RegularExpressions;
using System.Text;

namespace DBNL.App.Controllers
{
    [HandleError]
    public class HomeController : FOController
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
            ViewData.Model = new HomePageViewData();
            return View();
        }
    }
}
