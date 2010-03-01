using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DBNL.App.Areas.Articles
{
    public class ArticleRoutes : AreaRegistration
    {
        public override string AreaName
        {
            get { return "Articles"; }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "Articles_Default",
                "Articles/{controller}/{action}/{id}",
                new { controller = "Articles", action = "Index", id = "" }
            );
        }
    }
}