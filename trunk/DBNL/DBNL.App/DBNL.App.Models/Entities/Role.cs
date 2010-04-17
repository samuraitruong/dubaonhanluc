using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;

namespace DBNL.App.Models
{
     [MetadataType(typeof(RoleMetaData))]
    public partial class Role
    {
        public List<int> CategoryIds { get; set; }
        
        public class RoleMetaData
        {
            [Required (ErrorMessageResourceType=typeof(DataAnnotations), ErrorMessageResourceName="Role_RoleName")]
            public string RoleName { get; set; }
        }
    }
}
