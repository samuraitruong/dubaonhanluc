using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Caching;
using System.Net;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using DBNL.App.Config;

namespace DBNL.App.Models.CronJob
{
    [Serializable]
    public abstract class CronJobBase : ICloneable
    {
        public string Key { get; set; }
        public Object Data { get; set; }
        public DateTime TimeExpiration { get; set; }
        public string DummyPageUrl  { get; set; }
        public int MinuesToRun { get; set; }

        public CronJobBase()
        {
            Data = Guid.NewGuid();
            Key = Data.ToString();

        }
        public virtual void Excute(CacheItemRemovedReason reason)
        {
            HitPage();
        }
        protected void HitPage()
        {
            try
            {
                WebClient client = new WebClient();
                client.DownloadData(DummyPageUrl);
            }
            catch (Exception ex)
            {
                
            }
        }
        public object Clone()
        {
            MemoryStream ms = new MemoryStream();
            BinaryFormatter bf = new BinaryFormatter();
            // Serialize the object into the stream.
            bf.Serialize(ms, this);
            //Position streem pointer back to first byte.
            ms.Seek(0, SeekOrigin.Begin);
            // Deserialize into another object.
            CronJobBase cloneObject = (CronJobBase)bf.Deserialize(ms);
            // Release memory.
            ms.Close();

            return cloneObject;
            
        }
    }
    public class JobKeys
    {
        public static string Indexing = DBNLConfigurationManager.LuceneElement.IndexingServiceUrl;
    }
}