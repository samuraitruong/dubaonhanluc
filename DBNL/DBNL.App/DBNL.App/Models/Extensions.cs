using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Script.Serialization;

namespace DBNL.App.Extensions
{
    public static class Extensions
    {
        public static string ToJson(this object obj)
        {
            JavaScriptSerializer sr = new JavaScriptSerializer();
            return sr.Serialize(obj);
            
        }
    }
}
