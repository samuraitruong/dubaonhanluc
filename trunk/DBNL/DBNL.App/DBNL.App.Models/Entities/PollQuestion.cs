using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;

namespace DBNL.App.Models
{
     [MetadataType(typeof(PollQuestionMetaData))]
    public partial class PollQuestion
    {
        public float Percent { get; set; }

        public class PollQuestionMetaData
        {
           
        }
    }
}
