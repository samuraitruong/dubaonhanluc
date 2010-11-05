using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.IO;
using System.Web;

namespace DBNL.App.Config
{
   public class EmailingElement : ConfigurationElement
    {
       public string GetFullPath(string path)
       {
           if(Path.IsPathRooted(path)) return path;
           return HttpContext.Current.Server.MapPath(path);
       }
        [ConfigurationProperty("contactAddress")]
       public string ContactFormEmailAddress
        {
            get { return ((string)this["contactAddress"]); }
        }

         
    }
}
