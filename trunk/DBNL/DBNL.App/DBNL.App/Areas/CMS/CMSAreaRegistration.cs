using System.Web.Mvc;

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
                "CMS/{controller}.aspx/{action}/{id}",
                new { action = "Index", controller="Administrations" ,id = UrlParameter.Optional }
            );
        }
    }
}
