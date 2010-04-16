using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;

namespace DBNL.App.Models
{
    public class Sample
    {
        [Required(ErrorMessage="hihi hehe")]
        public string Name { get; set; }
    }
}
