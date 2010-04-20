﻿using System;
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
            return regex.Replace(key.DoStripDiacritics(), DBNLConfigurationManager.WebUI.ReplacementChar);
        }
        public static string DoStripDiacritics(this string accented)
        {
            Regex regex = new Regex(@"\p{IsCombiningDiacriticalMarks}+");

            string strFormD = accented.Normalize(NormalizationForm.FormD);
            return regex.Replace(strFormD, String.Empty).Replace('\u0111', 'd').Replace('\u0110', 'D');
        }


        public static string TrimmedWord(this string src, int word)
        {
           string[] arr = src.Split(' ');
           StringBuilder sb = new StringBuilder();
           if (arr.Length <= word) return src;
           for (int i = 0; i < word; i++)
           {
               sb.AppendFormat("{0} ", arr[i]);
           }
           sb.Append("...");
           return sb.ToString();
                 
        }


    }
}
