﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DBNL.App.Models.ViewData;
using DBNL.App.Models.Business;
using DBNL.App.Models.Helpers;
using System.Text.RegularExpressions;
using System.Text;
using DBNL.App.Models;

namespace DBNL.App.Controllers
{
    [HandleError]
    public class HomeController : FOController
    {
        public ActionResult Search(string q, int? page)
        {
            //string query = LuceneHelper.Query("content:" +q);
            int totals = 0;
            int cpage = page.HasValue ? page.Value : 1;
            var items = new LuceneHelper().Search(q.Trim().ToLower(), cpage, DBNL.App.Config.DBNLConfigurationManager.WebUI.ArticlePagingItem, out totals);
            IPagedList<Content> pagedList = items.ToPagedListEx(cpage, DBNL.App.Config.DBNLConfigurationManager.WebUI.ArticlePagingItem, totals);
            
            ViewData["keyword"] = q;
            return View("~/Views/Home/Query.aspx", pagedList);
        }

        public ActionResult Query(string q, int page)
        {
            //string query = LuceneHelper.Query("content:" +q);
            int totals = 0;
            ViewData.Model= new LuceneHelper().Search(q, page, 10, out totals);
            ViewData["keyword"] = q;
            return View();
        }
        public ActionResult Admin()
        {
            ViewData["Message"] = "Welcome to ASP.NET MVC!";
            
            return View();
        }
        [CompressFilter]
        [CacheFilter]
        
        public ActionResult Sponsor()
        {

            ViewData.Model = new BannerService().GetItems(Models.Statics.BannerPositions.Sponsor);
            return View();
        }

        public ActionResult Http404(string url)
        {
            return View();
        }
        public ActionResult Http501(string url)
        {
            return View();
        }

        public ActionResult About()
        {
            return View();
        }
        public ActionResult ContactUs()
        {
            return View();
        }
        public ActionResult Thanks()
        {
            return View();
        }
        public ActionResult Sample()
        {
            return View();
        }
        [CompressFilter]
        [CacheFilter]
        public ActionResult Index()
        {
            ViewData.Model = new HomePageViewData();
            return View();
        }

        public ActionResult DoIndex()
        {
            new LuceneHelper().BuildingIndex();
            return Content(DateTime.Now.ToString() + new ContentService().All().Count().ToString());
        }
        public ActionResult List(int page, int rows, string sidx, string sord)
        {

            var questions = new PollQuestionService().GetAllItems().ToList();
            var model = from entity in questions.AsQueryable()
                        select new
                        {
                            ProductID = 1,
                            ProductName = entity.Question,
                            UnitPrice = 10,
                            Discontinued = ""
                        };
            return Json(model.ToJqGridData(page, rows, null, "", new[] { "ProductName", "UnitPrice" }), JsonRequestBehavior.AllowGet);
        }

    }
}
