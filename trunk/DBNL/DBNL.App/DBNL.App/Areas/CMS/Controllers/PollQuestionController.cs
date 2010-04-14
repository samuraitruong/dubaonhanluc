using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DBNL.App.Models.Business;
using System.Linq.Dynamic;
using DBNL.App.Models.Helpers;
using DBNL.App.Models.Statics;
using DBNL.App.Models.Extensions;

namespace DBNL.App.Areas.CMS.Controllers
{
    public class PollQuestionController : Controller
    {
        //
        // GET: /PollQuestion/
        [HttpPost]
        public ActionResult EditRow(int? id, string Question, int? PollId, string Status)
        {
            if (id.HasValue)
            {
                PollQuestionService.Edit(id.Value, Question, Status);
            }
            else
            {
                PollQuestionService.Add( Question, PollId.Value, EntityStatuses.Actived.ToString()                   );
            }
            return Content("true");
        }

        public ActionResult Index()
        {
            return RedirectToAction("List");
        }

        public ActionResult List()
        {
            ViewData.Model = PollQuestionService.GetAllItems();
            return View();
        }


        public ActionResult GetQuestions(int page, int rows, string sidx, string sord, int? PollId)
        {

            var polls = PollQuestionService.List(PollId.Value);
            
            var model = from entity in polls.OrderBy(sidx + " " + sord)
                        select new
                        {
                            Id = entity.Id,
                            Question = entity.Question,
                            Responses = entity.Responses,
                            PollId = entity.PollId
                        };
            return Json(model.ToJqGridData(page, rows, null, "", new[] { "Question", "Responses" }), JsonRequestBehavior.AllowGet);

        }
        //
        // GET: /PollQuestion/Details/5

        public ActionResult Details(int id)
        {
            ViewData.Model = PollQuestionService.GetItem(id);
            return View();
        }

        //
        // GET: /PollQuestion/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /PollQuestion/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here
                PollQuestionService.Add(collection["Question"], Int32.Parse(collection["PollId"]), collection["Status"], Int32.Parse(collection["Responses"]));
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /PollQuestion/Delete/5
 
        public ActionResult Delete(int id)
        {
            ViewData.Model = PollQuestionService.GetItem(id);
            return View();
        }

        //
        // POST: /PollQuestion/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
                PollQuestionService.Delete(id);
                return RedirectToAction("List");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /PollQuestion/Edit/5
 
        public ActionResult Edit(int id)
        {
            ViewData.Model = PollQuestionService.GetItem(id);
            return View();
        }

        //
        // POST: /PollQuestion/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
                PollQuestionService.Edit(id, collection["Question"], Int32.Parse(collection["PollId"]), collection["Status"], Int32.Parse(collection["Responses"]));
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
