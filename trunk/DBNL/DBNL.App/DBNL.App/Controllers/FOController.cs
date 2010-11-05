using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using DBNL.App.Models.ViewData;
using DBNL.App.Models.Business;
using DBNL.App.Models.Statics;
using DBNL.App.Models;

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
                Supporters = new SupporterService().GetItems(EntityStatuses.Actived),
                MainNavigationItems = new NavigationService().GetItems(NavigationPositions.Main, true),
                TopNavigationItems = new NavigationService().GetItems(NavigationPositions.Top, true),
                LeftNavigationItems = new NavigationService().GetItems(NavigationPositions.Left, true),
                BottomBanners =  new BannerService().GetItems(BannerPositions.Bottom),
                LeftBanners =  new BannerService().GetItems(BannerPositions.Left),
                RightBanners =  new BannerService().GetItems(BannerPositions.Right),
                TopBanners =  new BannerService().GetItems(BannerPositions.Top),
                SlideShowBanners =  new BannerService().GetItems(BannerPositions.Main),
                HotNews = new ContentService().GetHostNewsList(DBNL.App.Config.DBNLConfigurationManager.WebUI.MarqueeItemCount)
                
            };
            ViewData["Configuration"] = new SiteConfigurations();
        }
        
    }
}
