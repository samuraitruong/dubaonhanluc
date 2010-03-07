using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace DBNL.App.Models.ViewData
{
    public class BannerViewData
    {
        public Banner banner{get;set;}
        public IEnumerable<SelectListItem> BannerPositions { get; set; }
        public IEnumerable<SelectListItem> BannerStatus { get; set; }
    }
}
