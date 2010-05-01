using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DBNL.App.Models.CronJob
{
    [Serializable]
    public class IndexingJob : CronJobBase
    {
        public IndexingJob(string dumpUrl): base()
        {
            DummyPageUrl = dumpUrl;
            
        }
        public override void Excute(System.Web.Caching.CacheItemRemovedReason reason)
        {
            LuceneHelper.IndexingAfterComplete += new AfterIndexingCoplete(HitPage);
            LuceneHelper.BuildingIndex();
            //base.Excute(reason);
        }
    }
}