using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBNL.App.Config;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;


namespace DBNL.App.Models
{
    [MetadataType(typeof(ContentMetaData))]
    public partial class Content
    {
        public string HighlightText { get; set; }
        public string ThumbnailUrl { 
        
        get {

            if (string.IsNullOrEmpty(Picture)) return DBNLConfigurationManager.FileResponsity.PictureRelativeUrl + "/Default.jpg";
            return DBNLConfigurationManager.FileResponsity.PictureRelativeUrl + "/"+this.Picture;
            
        } }

        public class ContentMetaData
        {
            public int Id { get; set; }
            [Required(ErrorMessageResourceName="Content_Title", ErrorMessageResourceType= typeof(DataAnnotations))]
            [DisplayName("Tựa đề bài viết")]
            public string Title { get; set; }

            [DisplayName("Nội dung")]
            public string Content1 { get; set; }

            [DisplayName("Danh mục")]
            public string CategoryId { get; set; }


            [DisplayName("Là chủ đề nổi bật")]
            public bool IsFeatured { get; set; }


            [DisplayName("Hình minh họa")]
            public string Picture { get; set; }

            [DisplayName("Mô tả")]
            public string Description { get; set; }
            
            
            
        }

    }
}
