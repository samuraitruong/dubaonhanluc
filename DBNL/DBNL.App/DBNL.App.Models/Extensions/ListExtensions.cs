using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace DBNL.App.Models.Extensions
{
    static class ListExtensions
    {
        public static string ToHtml(this IEnumerable<SelectListItem> list){

            StringBuilder sb = new StringBuilder();
            sb.AppendLine("<select>");
            foreach (var item in list) {
                sb.AppendFormat("<option value='{0}'> {1}</option>", item.Value, item.Text);
            }
            sb.AppendLine("</select>");
            return sb.ToString();
        }
    }
}
