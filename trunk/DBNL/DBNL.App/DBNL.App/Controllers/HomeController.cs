using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DBNL.App.Models.ViewData;
using DBNL.App.Models.Business;
using DBNL.App.Models.Helpers;
using System.Text.RegularExpressions;
using System.Text;

namespace DBNL.App.Controllers
{
    [HandleError]
    public class HomeController : FOController
    {
        public ActionResult Admin()
        {
            ViewData["Message"] = "Welcome to ASP.NET MVC!";
            
            return View();
        }


        public ActionResult About()
        {
            return View();
        }
        public ActionResult Index()
        {
            ViewData.Model = new HomePageViewData();
            return View();
        }
        public ActionResult List(int page, int rows, string sidx, string sord)
        {

            var questions = PollQuestionService.GetAllItems().ToList();
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
