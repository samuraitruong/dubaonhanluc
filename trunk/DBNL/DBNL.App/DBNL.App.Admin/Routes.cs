using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DBNL.App.Admin
{
    public class Routes : AreaRegistration
    {
        public override string AreaName
        {
            get { return "DBNL.App.Admin"; }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "Admin_Default",
                "CMS/{controller}/{action}/{id}",
                new { controller = "Administrations", action = "Index", id = "" }
                //new string[] { "DBNL.App.Admin.Controllers" }
            );
        }
    }
}