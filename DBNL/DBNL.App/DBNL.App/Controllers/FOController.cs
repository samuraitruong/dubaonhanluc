using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using DBNL.App.Models.ViewData;
using DBNL.App.Models.Business;

namespace DBNL.App.Controllers
{
    public class FOController : Controller
    {
        //
        // GET: /FO/
        public FOController()
        {
            ViewData["FOMasterViewData"] = new FOMasterViewData()
            {
                Supporters = SupporterService.GetItems()
            };
        }
        public ActionResult Index()
        {
            return View();
        }

    }
}
