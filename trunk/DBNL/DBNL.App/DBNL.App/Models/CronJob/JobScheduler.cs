using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Caching;

namespace DBNL.App.Models.CronJob
{
    public class JobScheduler
    {
        protected List<CronJobBase> Jobs;
        public JobScheduler()
        {
            Jobs = new List<CronJobBase>();
        }
        public CronJobBase GetCronJobByUrl(string url)
        {
            return this.Jobs.Where(p => p.DummyPageUrl == url).SingleOrDefault();
        }
        public void Update(string Url)
        {
            if(Url.Contains(JobKeys.Indexing)) {
                CronJobBase job = GetCronJobByUrl(JobKeys.Indexing);
                if (job == null) return;

                CronJobBase newjob = (CronJobBase)job.Clone();
                this.Jobs.Remove(job);
                Add(newjob);

            }
        }
        public bool Add(CronJobBase jobScheduler)
        {
            if (null != HttpContext.Current.Cache[jobScheduler.Key]) return false;

            HttpContext.Current.Cache.Add(jobScheduler.Key, jobScheduler.Data, null,
                DateTime.MaxValue, TimeSpan.FromMinutes(jobScheduler.MinuesToRun),
                CacheItemPriority.Normal,
                new CacheItemRemovedCallback(this.CacheItemRemovedCallback));

            this.Jobs.Add(jobScheduler);
            return true;
        }

        public void CacheItemRemovedCallback(string key,
            object value, CacheItemRemovedReason reason)
        {
            CronJobBase job = this[key];
            if (job != null) job.Excute(reason);

        }
        public CronJobBase this[int i]
        {
            get
            {
                return this.Jobs[i];
            }
            set
            {
                this.Jobs[i] = value;
            }
        }
        public CronJobBase this[string key]
        {
            get
            {
                return this.Jobs.AsEnumerable().Where(p=>p.Key == key).SingleOrDefault();
            }
            set
            {
                CronJobBase item = this.Jobs.AsEnumerable().Where(p => p.Key == key).SingleOrDefault();
                item =value;
            }
        }



    }
}