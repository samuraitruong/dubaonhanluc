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
                "Category-View-Route",
                "{category}_{page}.aspx",
                new
                {
                    controller = "Article",
                    action = "ViewCategory",
                    page=1
                });

            routes.MapRoute(
                "Content-View-Route",
                "{category}/{contentkey}.aspx",
                new
                {
                    controller = "Article",
                    action = "ViewContent",
                });

            routes.MapRoute(
                "Default",                                              // Route name
                "{controller}.aspx/{action}/{id}",                           // URL with parameters
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
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.Message);
            }
        }
        void Session_Start(object sender, EventArgs e)
        {
            // Code that runs when a new session is started
            FormsAuthentication.SignOut();
            string sessionId = Session.SessionID;
        }
        void Session_End(object sender, EventArgs e)
        {
            // Code that runs when a new session is started
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