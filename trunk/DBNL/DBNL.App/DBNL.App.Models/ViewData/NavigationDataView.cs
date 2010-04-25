using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using DBNL.App.Models.Statics;

namespace DBNL.App.Models.ViewData
{
    public class NavigationDataView
    {
        public Navigation Navigation { get; set; }
        public IEnumerable<SelectListItem> RootNavigations { get; set; }
        public IEnumerable<SelectListItem>  NavigationPositions { get; set; }
        public IEnumerable<SelectListItem>  Categories { get; set; }
        public IEnumerable<SelectListItem> SiteModules { get; set; }
        public IEnumerable<SelectListItem> OrphanArticles { get; set; }
    }
}
