using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.IO;
using System.Web;

namespace DBNL.App.Config
{
   public class LuceneElement : ConfigurationElement
    {
       public string GetFullPath(string path)
       {
           if(Path.IsPathRooted(path)) return path;
           return HttpContext.Current.Server.MapPath(path);
       }
        [ConfigurationProperty("indexingFolder")]
       public string IndexingFolder
        {
            get { return GetFullPath((string)this["indexingFolder"]); }
        }

           [ConfigurationProperty("interval")]
        public int Interval
        {
            get { return ((int)this["interval"]); }
        }

        [ConfigurationProperty("indexingServiceUrl")]
        public string IndexingServiceUrl
        {
            get { return ((string)this["indexingServiceUrl"]); }
        }
       
    }
}
