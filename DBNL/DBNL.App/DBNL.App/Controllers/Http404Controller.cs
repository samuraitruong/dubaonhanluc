using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DBNL.App.Controllers
{
    public class Http404Controller : Controller
    {
        

        public ActionResult Index()
        {
            return View("~/Views/HttpError/404.aspx");
        }

    }
}
