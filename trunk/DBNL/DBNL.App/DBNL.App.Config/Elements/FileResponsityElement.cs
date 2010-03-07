using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Web;
using System.IO;

namespace DBNL.App.Config.Elements
{
    public class FileResponsityElement : ConfigurationElement
    {
        [ConfigurationProperty("bannerFolder")]

        public string BannerFolder
        {
            get { return GetFullPath((string)this["bannerFolder"]); }
        }

        private string GetFullPath(string path)
        {
            if (Path.IsPathRooted(path)) return path;

            return HttpContext.Current.Server.MapPath(path);

        }
    }
}
