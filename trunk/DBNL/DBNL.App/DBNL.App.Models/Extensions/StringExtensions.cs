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
            if (string.IsNullOrEmpty(src)) return src;

           

            string stipped = DoStripHTML(src);
            string unicode = stipped.ReplaceHtmlEntities();

            string[] arr = unicode.Split(' ');
           StringBuilder sb = new StringBuilder();
           if (arr.Length <= word) return src;
           for (int i = 0; i < word; i++)
           {
               sb.AppendFormat("{0} ", arr[i]);
           }
           sb.Append("...");
           return sb.ToString();
                 
        }
        public static string StripHTML(this string inputString)
        {
            if (inputString == null) return string.Empty;
            return Regex.Replace
              (inputString, "<.*?>", string.Empty);
        }

        public static string Capatilized(this string src, int word)
        {
            string result = "";
            if (src.Length > 0)
                result = src[0].ToString().ToUpper() + src.Substring(1).ToLower();

            return result.TrimmedWord(word);

        }
        public static string DoStripHTML(string html)
        {
            return html.StripHTML();
        }
        public static string ReplaceHtmlEntities(this string src)
        {
            string temp = src;
            temp = temp.Replace("&euro;",     "€");
            temp = temp.Replace("&quot;", "\"");
            temp = temp.Replace("&sbquo;",    ",");
            temp = temp.Replace("&fnof;",     "ƒ");
            temp = temp.Replace("&bdquo;",    "„");
            temp = temp.Replace("&hellip;",   "…");
            temp = temp.Replace("&dagger;",   "†");
            temp = temp.Replace("&Dagger;",   "‡");
            temp = temp.Replace("&circ;",     "ˆ");

            temp = temp.Replace("&permil;",   "‰");
            temp = temp.Replace("&Scaron;",   "Š");
            temp = temp.Replace("&lsaquo;",   "‹");
            temp = temp.Replace("&OElig;",    "Œ");
            temp = temp.Replace("&lsquo;",    "‘");
            temp = temp.Replace("&rsquo;",    "’");
            temp = temp.Replace("&rdquo;",    "”");
            temp = temp.Replace("&ldquo;",    "“");

            temp = temp.Replace("&bull;", "•");
            temp = temp.Replace("&ndash;", "–");
            temp = temp.Replace("&mdash;", "—");
            temp = temp.Replace("&titde;", "˜");
            temp = temp.Replace("&trade;", "™");
            temp = temp.Replace("&scaron;", "š");
            temp = temp.Replace("&rsaquo;", "›");
            temp = temp.Replace("&oelig;", "œ");

            temp = temp.Replace("&Yuml", "Ÿ");
            temp = temp.Replace("&nbsp;", " ");
            temp = temp.Replace("&iexcl;", "¡");
            temp = temp.Replace("&cent;", "¢");
            temp = temp.Replace("&pound;", "£");
            temp = temp.Replace("&curren;", "¤");
            temp = temp.Replace("&yen;", "¥");
            temp = temp.Replace("&brvbar;", "¦");

            temp = temp.Replace("&sect;", "§");
            temp = temp.Replace("&uml;", "¨");
            temp = temp.Replace("&copy;", "©");
            temp = temp.Replace("&ordf;", "ª");
            temp = temp.Replace("&laquo;", "«");
            temp = temp.Replace("&not;", "¬");
            temp = temp.Replace("&reg;", "­­­®­­");
            temp = temp.Replace("&marc;", "¯");

            temp = temp.Replace("&deg;", "°");
            temp = temp.Replace("&plusmn;", "±");
            temp = temp.Replace("&sup2;", "²");
            temp = temp.Replace("&sup3;", "³");
            temp = temp.Replace("&acute;", "´");
            temp = temp.Replace("&micro;", "µ");
            temp = temp.Replace("&para;", "­¶­­");
            temp = temp.Replace("&middot;", "·");

            temp = temp.Replace("&sup1;", "¹");
            temp = temp.Replace("&ordm;", "º");
            temp = temp.Replace("&sup2;", "²");
            temp = temp.Replace("&sup3;", "³");
            temp = temp.Replace("&acute;", "´");
            temp = temp.Replace("&micro;", "µ");
            temp = temp.Replace("&para;", "­¶­­");
            temp = temp.Replace("&middot;", "·");


            temp = temp.Replace("&raquo;", "»");
            temp = temp.Replace("&frac14;", "¼");
            temp = temp.Replace("&frac12;", "½");
            temp = temp.Replace("&frac34;", "¾");
            temp = temp.Replace("&iquest;", "¿");
            temp = temp.Replace("&Agrave;", "À");
            temp = temp.Replace("&Aacute;", "Á");
            temp = temp.Replace("&Acirc;", "Â");
            temp = temp.Replace("&Atilde;", "Ã");
            temp = temp.Replace("&Auml;", " Ä");
            temp = temp.Replace("&Aring;", "Å");
            temp = temp.Replace("&AElig;", "Æ");
            temp = temp.Replace("&Ccedil;", "Ç");
            temp = temp.Replace("&Egrave;", "È");
            temp = temp.Replace("&Eacute;", "É");
            temp = temp.Replace("&Ecirc;", "Ê");
            temp = temp.Replace("&Euml;", " Ë");
            temp = temp.Replace("&Igrave;", "Ì");
            temp = temp.Replace("&Iacute;", "Í");
            temp = temp.Replace("&Icirc;", "Î");
            temp = temp.Replace("&Iuml;", " Ï");
            temp = temp.Replace("&ETH;", "  Ð");
            temp = temp.Replace("&Ntilde;", "Ñ");
            temp = temp.Replace("&Ograve;", "Ò");
            temp = temp.Replace("&Oacute;", "Ó");
            temp = temp.Replace("&Ocirc;", "Ô");
            temp = temp.Replace("&Otilde;", "Õ");
            temp = temp.Replace("&Ouml;", " Ö");
            temp = temp.Replace("&times;", "×");
            temp = temp.Replace("&Oslash;", "Ø");
            temp = temp.Replace("&Ugrave;", "Ù");
            temp = temp.Replace("&Uacute;", "Ú");
            temp = temp.Replace("&Ucirc;", "Û");
            temp = temp.Replace("&Uuml;", " Ü");
            temp = temp.Replace("&Yacute;", "Ý");
            temp = temp.Replace("&THORN;", "Þ");
            temp = temp.Replace("&szlig;", "ß");
            temp = temp.Replace("&agrave;", "à");
            temp = temp.Replace("&aacute;", "á");
            temp = temp.Replace("&acirc;", "â");
            temp = temp.Replace("&atilde;", "ã");
            temp = temp.Replace("&auml;", " ä");
            temp = temp.Replace("&aring;", "å");
            temp = temp.Replace("&aelig;", "æ");
            temp = temp.Replace("&ccedil;", "ç");
            temp = temp.Replace("&egrave;", "è");
            temp = temp.Replace("&eacute;", "é");
            temp = temp.Replace("&ecirc;", "ê");
            temp = temp.Replace("&euml;", " ë");
            temp = temp.Replace("&igrave;", "ì");
            temp = temp.Replace("&iacute;", "í");
            temp = temp.Replace("&icirc;", "î");
            temp = temp.Replace("&iuml;", " ï");
            temp = temp.Replace("&eth;", "  ð");
            temp = temp.Replace("&ntilde;", "ñ");
            temp = temp.Replace("&ograve;", "ò");
            temp = temp.Replace("&oacute;", "ó");
            temp = temp.Replace("&ocirc;", "ô");
            temp = temp.Replace("&otilde;", "õ");
            temp = temp.Replace("&ouml;", " ö");
            temp = temp.Replace("&divide;", "÷");
            temp = temp.Replace("&oslash;", "ø");
            temp = temp.Replace("&ugrave;", "ù");
            temp = temp.Replace("&uacute;", "ú");
            temp = temp.Replace("&ucirc;", "û");
            temp = temp.Replace("&uuml;", " ü");
            temp = temp.Replace("&yacute;", "ý");
            temp = temp.Replace("&thorn;", "þ");
            temp = temp.Replace("&yuml;", " ÿ");

            return temp;


        }


    }
}
