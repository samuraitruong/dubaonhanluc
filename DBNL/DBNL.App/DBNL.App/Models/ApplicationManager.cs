using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DBNL.App.Models.CronJob;

namespace DBNL.App.Models
{
    public class ApplicationManager
    {
        public static JobScheduler JobScheduler
        {
            get
            {
                HttpApplicationState session = HttpContext.Current.Application;
                JobScheduler scheduler = (JobScheduler)session["JobScheduler"];
                if (scheduler == null) scheduler = new JobScheduler();
                return scheduler;
            }
            set
            {
                HttpApplicationState session = HttpContext.Current.Application;
                session["JobScheduler"] = value;
            }

        }
    }
}