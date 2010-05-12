using System.Web.Mvc;
using DBNL.App.Config;

namespace DBNL.App.Areas.CMS
{
    public class CMSAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "CMS";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "CMS_default",
                "CMS/{controller}" + DBNLConfigurationManager.WebUI.Extension+"/{action}/{id}",
                new { action = "Index", controller="Administrations" ,id = UrlParameter.Optional }
            );
        }
    }
}
