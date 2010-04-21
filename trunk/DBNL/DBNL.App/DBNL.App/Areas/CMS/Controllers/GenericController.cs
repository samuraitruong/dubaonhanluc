using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DBNL.App.Models.Statics;
using DBNL.App.Models.Extensions;
using System.Threading;
using System.Globalization;
using DBNL.App.Models;

namespace DBNL.App.Areas.CMS.Controllers
{
    public class GenericController : Controller
    {
        //
        // GET: /CMS/Generic/
        public ActionResult Lang(string Language, string ReturnUrl)
        {
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Language);
            Thread.CurrentThread.CurrentUICulture = Thread.CurrentThread.CurrentCulture;
            SessionManager.CurentCulture = new CultureInfo(Language);
            return Redirect(ReturnUrl);
        }
        public ActionResult GetEntityStatus()
        {
            List<SelectListItem> list = new List<SelectListItem>();
            list.Add(new SelectListItem() { Text = "Kích hoạt", Value = EntityStatuses.Actived.ToString() });
            list.Add(new SelectListItem() { Text = "Không kích hoạt", Value = EntityStatuses.Inactive.ToString() });
            return Content(list.ToHtml());
        }

    }
}
