﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using DBNL.App.Models.ViewData;
using DBNL.App.Models.Business;
using DBNL.App.Models.Statics;

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
                Supporters = SupporterService.GetItems(EntityStatuses.Actived),
                MainNavigationItems = NavigationService.GetItems(NavigationPositions.Main, true),
                TopNavigationItems = NavigationService.GetItems(NavigationPositions.Top, true),
                LeftNavigationItems = NavigationService.GetItems(NavigationPositions.Left, true),
                BottomBanners = BannerService.GetItems(BannerPositions.Bottom),
                LeftBanners = BannerService.GetItems(BannerPositions.Left),
                RightBanners = BannerService.GetItems(BannerPositions.Right),
                TopBanners = BannerService.GetItems(BannerPositions.Top)
                
            };
        }
        
    }
}
