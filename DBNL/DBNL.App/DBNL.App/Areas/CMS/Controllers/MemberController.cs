using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Web;
using System.Web.Mvc;
using System.Linq.Dynamic;
using DBNL.App.Models.Business;
using DBNL.App.Models.ViewData;
using DBNL.App.Models.Statics;
using DBNL.App.Models;
using DBNL.App.Config;
using DBNL.App.Models.Helpers;
using DBNL.App.Models.Extensions;

namespace DBNL.App.Areas.CMS.Controllers
{
    public class MemberController : Controller
    {
        //
        // GET: /Banner/
        [RequiresAuthentication]
        public ActionResult Index()
        {
            return View();
        }
        
       

        //
        // GET: /Banner/Create
        [RequiresAuthentication]
        public ActionResult Create()
        {
            ViewData["Extra"]= new BannerViewData() 
            {
                banner = new Banner(),
                BannerPositions = CustomSelectList.CreateBannerPosition()
            };
            return View(new Banner());
        }
        public ActionResult CreateIn(string id)
        {
            return View(new Banner() {BannerPosition = id });
        }
        
        //
        // POST: /Banner/Create


        //
        // GET: /Banner/Delete/5
        [RequiresAuthentication]
        public ActionResult Delete(int id)
        {
            ViewData.Model = new AccountService().GetItem(id);
            return View();
        }

       
        

        [HttpPost]
        [RequiresAuthentication]
        public ActionResult JsonDelete(int id)
        {
            try
            {
                // TODO: Add delete logic here
                new AccountService().Delete(id);
                return Json(true);
            }
            catch
            {
                return Json(false);
            }
        }

        
        [RequiresAuthentication]
        public ActionResult GetSelectStatus()
        {
            IEnumerable<SelectListItem> list = CustomSelectList.CreateBannerStatus();
            return Content(list.ToHtml());
        }
        
        [RequiresAuthentication]
        public ActionResult GetSelectPosition()
        {
            IEnumerable<SelectListItem> list = CustomSelectList.CreateBannerPosition();
            return Content(list.ToHtml());
        }

        [RequiresAuthentication]
        protected string getFormValue(string key)
        {
            try
            {
                return Request.Form[key];
            }
            catch
            {
                return "";
            }
        }

       

        [HttpPost]
        [RequiresAuthentication]
        public ActionResult List(int page, int rows, string sidx, string sord, string Position)
        {
            var bann = new AccountService().List();
            bool searchOn = bool.Parse(Request.Form["_search"]);
            string searchExp = "";
            if (searchOn)
            {
                searchExp = string.Format("{0}.ToString().Contains(@0)", getFormValue("searchField"));
                bann = bann.Where(searchExp, new string[] { getFormValue("searchString") });
            }
            var model = from entity in bann.OrderBy(sidx + " " + sord)
                        select new
                        {
                            Id = entity.Id,
                            Name = entity.Name,
                            CreatedDate = entity.CreatedDate.ToShortDateString(),
                            Login = entity.Login,
                            Address = entity.Address,
                            Career = entity.Career.Name,
                            Sex = entity.IsMale?"Nam": "Nữ",
                            Birthday = entity.Birthday.Value.ToShortDateString(),
                            Status = entity.Status,
                            Email = entity.Email
                        };
            return Json(model.ToJqGridData(page, rows, null, "", new[] { "Name", "Login", "Address", "Status", "Career" }), JsonRequestBehavior.AllowGet);
        }

       
    }
}
