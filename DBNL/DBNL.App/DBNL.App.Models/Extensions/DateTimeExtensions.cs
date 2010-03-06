using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBNL.App.Models.Extensions
{
    public static class DateTimeExtensions
    {
        public static string ToVNString(this DateTime dt)
        {
            return dt.ToString("dd/MM/yyyy");
        }
    }
}
