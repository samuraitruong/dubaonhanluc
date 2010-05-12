using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using System.Globalization;
using System.Threading;
using DBNL.App.Models;
using DBNL.App.Models.CronJob;
using System.Diagnostics;
using DBNL.App.Config;

namespace DBNL.App
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.IgnoreRoute("elmah.axd");
            AreaRegistration.RegisterAllAreas();
            routes.MapRoute(
                "Category-View-Route-By-Month",
                "{month}/{year}/{category}_{page}" + DBNLConfigurationManager.WebUI.Extension,
                new
                {
                    controller = "Article",
                    action = "ViewCategoryByMonth",
                    page = 1,
                    month = DateTime.Today.Month,
                    year = DateTime.Today.Year
                });

            routes.MapRoute(
                "Category-View-Route-By-Date",
                "{day}/{month}/{year}/{category}_{page}" + DBNLConfigurationManager.WebUI.Extension,
                new
                {
                    controller = "Article",
                    action = "ViewCategoryByDate",
                    page = 1,
                    day = DateTime.Today.Day,
                    month = DateTime.Today.Month,
                    year = DateTime.Today.Year
                });

            routes.MapRoute(
                "Category-View-Route",
                "{category}_{page}" + DBNLConfigurationManager.WebUI.Extension,
                new
                {
                    controller = "Article",
                    action = "ViewCategory",
                    page=1
                });

            routes.MapRoute(
                "Content-View-Route",
                "{category}/{contentkey}" + DBNLConfigurationManager.WebUI.Extension,
                new
                {
                    controller = "Article",
                    action = "ViewContent",
                });

            routes.MapRoute(
                "Default",                                              // Route name
                "{controller}"+ DBNLConfigurationManager.WebUI.Extension+"/{action}/{id}",                           // URL with parameters
                new { controller = "Home", action = "Index", id = "" }  // Parameter defaults
                //new string[] { "DBNL.App.Controllers" }
            );
        }

        protected void Application_Start()
        {
            RegisterRoutes(RouteTable.Routes);
            try
            {
                JobScheduler jobScheduler = ApplicationManager.JobScheduler;
                jobScheduler.Add(new IndexingJob(JobKeys.Indexing) { MinuesToRun = DBNLConfigurationManager.LuceneElement.Interval});
                ApplicationManager.JobScheduler = jobScheduler;
                ApplicationManager.Counter.Reset();
                //ApplicationManager.Counter = Counter.Load();
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.Message);
            }
        }
        void Session_Start(object sender, EventArgs e)
        {
            // Code that runs when a new session is started
            SessionManager.TimeStamp = DateTime.Now;
            FormsAuthentication.SignOut();
            string sessionId = Session.SessionID;

            ApplicationManager.Counter.Visit();
        }
        void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a new session is started
            Counter counter = (Counter)this.Application["Counter"];
            counter.Leave();
            FormsAuthentication.SignOut();
        }

        protected void Application_BeginRequest(Object sender, EventArgs e)
        {
            JobScheduler jobScheduler = ApplicationManager.JobScheduler;
            jobScheduler.Update(HttpContext.Current.Request.Url.ToString());
        }

        protected void Application_AcquireRequestState(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session != null)
            {
                Thread.CurrentThread.CurrentUICulture = SessionManager.CurentCulture;

                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(SessionManager.CurentCulture.Name);
            }
        }
    }
}