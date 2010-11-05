using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
//using iTextSharp.text.pdf;
//using iTextSharp.text;
//using iTextSharp.text.html.simpleparser;
using System.Collections;
using System.Web.UI;
using System.Reflection;

/// <summary>
/// Summary description for WebUtility
/// </summary>
/// 
namespace DBNL.App.Models.Business.Emailing
{
    public class WebUtility
    {
        public WebUtility()
        {
            
        }
        public static string RootUrl
        {
            get
            {
                string baseUrl = Path.Combine(HttpContext.Current.Request.Url.GetLeftPart(System.UriPartial.Authority),
                HttpContext.Current.Request.ApplicationPath.TrimEnd(new char[] { '/' }));
                return baseUrl;
            }
        }

        //public static void WritePdf(string html)
        //{
        //    HttpContext.Current.Response.AddHeader("content-type", "application/pdf");
        //    HttpContext.Current.Response.AddHeader("Content-Disposition",
        //                       "attachment; filename=" + DateTime.Now.Ticks.ToString() + ".pdf");
        //    Document document = new Document(PageSize.A4, 50, 35, 25, 35);
        //    iTextSharp.text.pdf.PdfWriter writer = iTextSharp.text.pdf.PdfWriter.GetInstance(document, HttpContext.Current.Response.OutputStream);
        //    document.Open();
        //    StyleSheet styles = new StyleSheet();
        //    styles.LoadTagStyle("td", "face", "Tahoma");
        //    styles.LoadTagStyle("td", "font-family", "Tahoma");
        //    styles.LoadTagStyle("", "face", "Tahoma");

        //    ArrayList objects = HTMLWorker.ParseToList(new StringReader(html), styles);
        //    string dir = Environment.GetEnvironmentVariable("windir");
        //    dir += @"\Fonts\times.ttf";

        //    BaseFont bf = BaseFont.CreateFont(dir, BaseFont.IDENTITY_H, true);
        //    iTextSharp.text.Font font = new iTextSharp.text.Font(bf);
        //    for (int k = 0; k < objects.Count; ++k)
        //    {
        //        IElement ele = (IElement)objects[k];
        //        foreach (Chunk c in ele.Chunks)
        //        {
        //            font.Size = c.Font.Size;
        //            c.Font = font;
        //        }

        //        document.Add(ele);
        //    }
        //    document.Close();

        //    HttpContext.Current.Response.End();
        //}

    }
}