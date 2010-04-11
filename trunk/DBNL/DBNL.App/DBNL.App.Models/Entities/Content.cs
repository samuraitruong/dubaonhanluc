using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBNL.App.Config;

namespace DBNL.App.Models
{
    public partial class Content
    {
        public string ThumbnailUrl { 
        
        get {
            if (string.IsNullOrEmpty(Picture)) return string.Empty;
            return DBNLConfigurationManager.FileResponsity.PictureRelativeUrl + "/"+this.Picture;
            
        } }
    }
}
