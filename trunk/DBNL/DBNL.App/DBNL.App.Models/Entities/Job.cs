using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBNL.App.Config;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using DBNL.App.Models.Entities.Attributes;
using DBNL.App.Models.Entities;


namespace DBNL.App.Models
{
    [MetadataType(typeof(JobMetaData))]
    public partial class Job
    {
        public class JobMetaData
        {
           [LocalizedDisplayName(DisplayNameResourceName = "Title", DisplayNameResourceType = typeof(DBNL.App.Models.Resources.JobStrings))]
           [Required(ErrorMessageResourceName = "TitleRequiredMessage", ErrorMessageResourceType = typeof(DBNL.App.Models.Resources.JobStrings))]
            public string Title { get; set; }

           [LocalizedDisplayName(DisplayNameResourceName = "Company", DisplayNameResourceType = typeof(DBNL.App.Models.Resources.JobStrings))]
           //[Required(ErrorMessageResourceName = "CompanyRequiredMessage", ErrorMessageResourceType = typeof(DBNL.App.Models.Resources.JobStrings))]
           public string Company { get; set; }

            [LocalizedDisplayName(DisplayNameResourceName = "JobDetail", DisplayNameResourceType = typeof(DBNL.App.Models.Resources.JobStrings))]

           public string JobDetail { get; set; }

            [LocalizedDisplayName(DisplayNameResourceName = "Description", DisplayNameResourceType = typeof(DBNL.App.Models.Resources.JobStrings))]
            //[Required(ErrorMessageResourceName = "CompanyRequiredMessage", ErrorMessageResourceType = typeof(DBNL.App.Models.Resources.JobStrings))]
            public string Description { get; set; }

            [LocalizedDisplayName(DisplayNameResourceName = "CompanyInfo", DisplayNameResourceType = typeof(DBNL.App.Models.Resources.JobStrings))]
            //[Required(ErrorMessageResourceName = "CompanyRequiredMessage", ErrorMessageResourceType = typeof(DBNL.App.Models.Resources.JobStrings))]
            public string CompanyInfo { get; set; }

            [LocalizedDisplayName(DisplayNameResourceName = "Deadline", DisplayNameResourceType = typeof(DBNL.App.Models.Resources.JobStrings))]
            public DateTime Deadline { get; set; }
        }

    }
}
