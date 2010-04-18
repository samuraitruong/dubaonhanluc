using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;

namespace DBNL.App.Models
{
    [MetadataType(typeof(NavigationMetaData))]
    public partial class Navigation
    {

        public class NavigationMetaData
        {
            [Required(ErrorMessageResourceName = "Navigation_Name", ErrorMessageResourceType = typeof(DataAnnotations))]
            public string Name { get; set; }

            //[Required(ErrorMessageResourceName = "Banner_Url", ErrorMessageResourceType = typeof(DataAnnotations))]
            //[RegularExpression(@"(([\w]+:)?//)?(([\d\w]|%[a-fA-f\d]{2,2})+(:([\d\w]|%[a-fA-f\d]{2,2})+)?@)?([\d\w][-\d\w]{0,253}[\d\w]\.)+[\w]{2,4}(:[\d]+)?(/([-+_~.\d\w]|%[a-fA-f\d]{2,2})*)*(\?(&?([-+_~.\d\w]|%[a-fA-f\d]{2,2})=?)*)?(#([-+_~.\d\w]|%[a-fA-f\d]{2,2})*)?", ErrorMessageResourceName = "Banner_UrlFormat", ErrorMessageResourceType = typeof(DataAnnotations))]
            //public string Url { get; set; }
        }

    }

}
