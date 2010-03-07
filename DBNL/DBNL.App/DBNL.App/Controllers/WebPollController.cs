using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using DBNL.App.Models.Business;
using DBNL.App.Models.ViewData;

namespace DBNL.App.Controllers
{
    public class WebPollController : FOController
    {
        //
        // GET: /WebPoll/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult View(int? id)
        {
            ViewData.Model = id.HasValue? new PublicPollViewData(id.Value):new PublicPollViewData() ;
            return View();

        }
        [HttpPost]
        public ActionResult DoPoll(int id, FormCollection collection)
        {
            int questionId = int.Parse(collection["QuestionId"]);
            PollQuestionService.Response(questionId, 1);
            return RedirectToAction("View");
        }


        //
        // GET: /WebPoll/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /WebPoll/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /WebPoll/Create

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
        // GET: /WebPoll/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /WebPoll/Edit/5

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
