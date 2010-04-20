using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBNL.App.Models.ViewData
{
    public class FOMasterViewData
    {
        public IEnumerable<Supporter> Supporters { get; set; }
        public IEnumerable<Navigation> MainNavigationItems { get; set; }
        public IEnumerable<Navigation> TopNavigationItems { get; set; }
        public IEnumerable<Navigation> LeftNavigationItems { get; set; }
        public IEnumerable<Banner> BottomBanners { get; set; }
        public IEnumerable<Banner> TopBanners { get; set; }
        public IEnumerable<Banner> LeftBanners { get; set; }
        public IEnumerable<Banner> RightBanners { get; set; }
        public IEnumerable<Content> HotNews { get; set; }
    }
}
