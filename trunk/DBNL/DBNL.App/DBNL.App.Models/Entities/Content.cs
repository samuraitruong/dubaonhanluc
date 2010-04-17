using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBNL.App.Config;
using System.ComponentModel.DataAnnotations;


namespace DBNL.App.Models
{
    [MetadataType(typeof(ContentMetaData))]
    public partial class Content
    {
        public string ThumbnailUrl { 
        
        get {
            if (string.IsNullOrEmpty(Picture)) return string.Empty;
            return DBNLConfigurationManager.FileResponsity.PictureRelativeUrl + "/"+this.Picture;
            
        } }

        public class ContentMetaData
        {
            [Required(ErrorMessageResourceName="Content_Title", ErrorMessageResourceType= typeof(DataAnnotations))]
            public string Title { get; set; }
        }

    }
}
