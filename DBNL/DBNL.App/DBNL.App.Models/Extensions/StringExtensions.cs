using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using DBNL.App.Config;

namespace DBNL.App.Models.Extensions
{
    public static class StringExtensions
    {
        public static string ToUrlKey(this string key)
        {
            Regex regex = new Regex(DBNLConfigurationManager.WebUI.RemoveRule);
            return regex.Replace(key, DBNLConfigurationManager.WebUI.ReplacementChar);
        }
    }
}
