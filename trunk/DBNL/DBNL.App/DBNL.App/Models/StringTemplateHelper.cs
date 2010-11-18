using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;
using Resources;
using DBNL.App.Config;
using System.IO;

namespace DBNL.App.Models
{
    public class StringTemplateHelper
    {
        public static string ReplaceVideoTag(string source)
        {
            string pattern = @"\[video\](http://[a-zA-Z0-9\-\.\/]*.*)\[/video\]";
            int index = 1;
            while(Regex.IsMatch(source, pattern)){
                Match match = Regex.Match(source, pattern);
                if (match != null)
                {
                    source = source.Replace(match.Value, GetPlayer(match.Value, "Player_" + (index++).ToString()));
                }

            }
            return source;
        }

        private static string GetPlayer(string p, string id)
        {
            string url = p.Replace("[video]", string.Empty).Replace("[/video]", string.Empty);

            return string.Format(DBNLConfigurationManager.WebUI.VideoPlayer, url, id);
        }
    }
}