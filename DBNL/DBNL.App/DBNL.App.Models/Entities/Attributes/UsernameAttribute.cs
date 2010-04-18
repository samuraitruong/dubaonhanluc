using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using DBNL.App.Models.Business;

namespace DBNL.App.Models.Entities.Attributes
{
   

    [AttributeUsage(AttributeTargets.Field | AttributeTargets.Property, AllowMultiple = false)]
    public class UsernameAttribute : ValidationAttribute
    {
        public override bool IsValid(object value)
        {
            User u = UserService.Users.Where(p => p.Username == value).SingleOrDefault();
            return (u == null);
        }
    }



}
