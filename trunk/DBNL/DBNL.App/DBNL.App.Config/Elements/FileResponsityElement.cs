using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Web;
using System.IO;
using System.Web.Mvc;

namespace DBNL.App.Config.Elements
{
    public class FileResponsityElement : ConfigurationElement
    {
        [ConfigurationProperty("bannerFolder")]
        public string BannerRelativeUrl
        {
            get { return GetRelativeUrl((string)this["bannerFolder"]); }
        }

        [ConfigurationProperty("pictureFolder")]
        public string PictureRelativeUrl
        {
            get { return GetRelativeUrl((string)this["pictureFolder"]); }
        }


        [ConfigurationProperty("pictureFolder")]

        public string PictureFolder
        {
            get { return GetFullPath((string)this["pictureFolder"]); }
        }

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
        private string GetRelativeUrl(string path)
        {
            //return path;
            return UrlHelper.GenerateContentUrl(path, new HttpContextWrapper(HttpContext.Current) );
            //et { return GetFullPath((string)this["bannerFolder"]); }

        }
    }
}
