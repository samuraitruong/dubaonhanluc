using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using DBNL.App.Models.Business;
using DBNL.App.Models.ViewData;
using DBNL.App.Models.Helpers;
using DBNL.App.Config;
using DBNL.App.Models;
namespace DBNL.App.Controllers
{
    public class ArticleController : FOController
    {
        //
        // GET: /Content/


        [CompressFilter]
        [CacheFilter]
        public ActionResult ViewCategoryByDate(string category, int? page, int day, int month, int year)
        {
            Models.ContentCategory Cat = CategoryService.GetByKey(category);

            if (Cat == null) return RedirectToAction("Index", "Http404");

            DateTime filterDate = DateTime.Now;
            try
            {
                filterDate = new DateTime(year, month, day);
            }
            catch (Exception ex)
            {
                return RedirectToAction("Index", "Http404");
            }

            var data = new CategoryViewData()
            {
                FilterDate = filterDate,
                Category = Cat,
                Articles = ContentService.GetContentByCategoryId(Cat.ID),
                FeaturedArticles = ContentService.GetFeaturedArtileByCategoryId(Cat.ID),
                ArticlesPagedList = ContentService.All(Cat.ID)
                                                    .Where(p => p.UpdatedDate.Year == year)
                                                    .Where(p => p.UpdatedDate.Month == month)
                                                    .Where(p => p.UpdatedDate.Day == day)
                                                    .ToPagedList(page.HasValue ? page.Value - 1 : 0, DBNLConfigurationManager.WebUI.ArticlePagingItem)

            };
            if (page.HasValue && data.ArticlesPagedList.PageCount >0 && page.Value > data.ArticlesPagedList.PageCount)
            {
                return RedirectToAction("ViewCategoryByDate", new { category = category, day = day, month = month, year = year });
            }
            return View("~/Views/Article/CategoryByDate.aspx", data);

        }

        [CompressFilter]
        [CacheFilter]
        public ActionResult ViewCategoryByMonth(string category, int? page,  int month, int year)
        {
            Models.ContentCategory Cat = CategoryService.GetByKey(category);

            if (Cat == null) return RedirectToAction("Index", "Http404");

            DateTime filterDate = DateTime.Now;
            try
            {
                filterDate = new DateTime(year, month, 1);
            }
            catch (Exception ex)
            {
                return RedirectToAction("Index", "Http404");
            }

            var data = new CategoryViewData()
            {
                FilterDate = filterDate,
                Category = Cat,
                Articles = ContentService.GetContentByCategoryId(Cat.ID),
                FeaturedArticles = ContentService.GetFeaturedArtileByCategoryId(Cat.ID),
                ArticlesPagedList = ContentService.All(Cat.ID)
                                                    .Where(p => p.UpdatedDate.Year == year)
                                                    .Where(p => p.UpdatedDate.Month == month)
                                                    
                                                    .ToPagedList(page.HasValue ? page.Value - 1 : 0, DBNLConfigurationManager.WebUI.ArticlePagingItem)

            };
            if (page.HasValue && data.ArticlesPagedList.PageCount > 0 && page.Value > data.ArticlesPagedList.PageCount)
            {
                return RedirectToAction("ViewCategoryByMonth", new { category = category, month = month, year = year });
            }
            return View("~/Views/Article/CategoryByMonth.aspx", data);

        }

        [CompressFilter]
        [CacheFilter]
        public ActionResult Category(int id, int? page)
        {
            Models.ContentCategory Cat = CategoryService.GetById(id);
            if (Cat == null) return RedirectToAction("Index", "Http404");

            ViewData.Model = new CategoryViewData() {
                Category = CategoryService.GetById(id),
                Articles = ContentService.GetContentByCategoryId(id),
                FeaturedArticles = ContentService.GetFeaturedArtileByCategoryId(id),
                ArticlesPagedList = ContentService.All(id).ToPagedList(page.HasValue?page.Value-1:0, DBNLConfigurationManager.WebUI.ArticlePagingItem)
            
            };
            return View();
        }

        [CompressFilter]
        [CacheFilter]
        public ActionResult ViewCategory(string category, int? page)
        {
            int id = 1;
            //return RedirectToAction("Category", new { id = 1, page = page });
            Models.ContentCategory Cat = CategoryService.GetByKey(category);

            if (Cat == null) return RedirectToAction("Index", "Http404");
            ViewData.Model = new CategoryViewData()
            {
                Category = Cat,
                Articles = ContentService.GetContentByCategoryId(Cat.ID),
                FeaturedArticles = ContentService.GetFeaturedArtileByCategoryId(Cat.ID),
                ArticlesPagedList = ContentService.All(Cat.ID).ToPagedList(page.HasValue ? page.Value - 1 : 0, DBNLConfigurationManager.WebUI.ArticlePagingItem)

            };
            return View("~/Views/Article/Category.aspx");
        }

        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /Content/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }
        [CompressFilter]
        [CacheFilter]
        public ActionResult ViewContent(string contentkey)
        {
            DBNL.App.Models.Content content = ContentService.GetContentByKey(contentkey);
            if (content == null) return RedirectToAction("Index", "Http404");
            ViewData.Model = new ViewContentDataView()
            {
                Content = content,
                FeaturedContents = ContentService.GetFeaturedArtileByCategoryId(content.CategoryId),
                OtherNewses = ContentService.GetOlderNews(content)
            };
            return View("~/Views/Article/View.aspx");
        }
        [CompressFilter]
        [CacheFilter]
        public ActionResult View(int id)
        {
            DBNL.App.Models.Content content = ContentService.GetContentById(id);
            if (content == null) return RedirectToAction("Index", "Http404");
            ViewData.Model = new ViewContentDataView() { Content = content,
            FeaturedContents = ContentService.GetFeaturedArtileByCategoryId(content.CategoryId),
            OtherNewses = ContentService.GetOlderNews(content)
            };
            return View();
        }

        //
        // GET: /Content/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Content/Create

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Content/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Content/Edit/5

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
