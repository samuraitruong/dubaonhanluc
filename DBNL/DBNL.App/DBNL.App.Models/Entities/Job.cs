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
            //[LocalizedDisplayName("Title", NameResourceType = typeof(Entities.Job))]
            //[Required(ErrorMessageResourceName = "Job_Title", ErrorMessageResourceType = typeof(DataAnnotations))]
            //public string Title { get; set; }

            //[LocalizedDisplayName("Job_Company")]
            //[Required(ErrorMessageResourceName = "Job_Company", ErrorMessageResourceType = typeof(DataAnnotations))]
            //public string Company { get; set; }
        }

    }
}
