using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DBNL.App.Models
{
    public class UserClientInfo
    {
        public string UserHostName { get; set; }

        public string UserHostAddress { get; set; }
        public override bool Equals(Object o)
        {
            var obj = (UserClientInfo)o;

            return this.UserHostAddress == obj.UserHostAddress && this.UserHostName == obj.UserHostName;
        }
    }
}