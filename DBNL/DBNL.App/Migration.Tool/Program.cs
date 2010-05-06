using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml.Linq;
using DBNL.App.Models;
using DBNL.App.Models.Extensions;
using Microsoft.Security.Application;
using System.Web;



namespace Migration.Tool
{
    class Program
    {
        static void Main(string[] args)
        {

            //DoMigration( 350, 53);
            //DoMigration(356, 54);
            //DoMigration(352, 55);
            //DoMigration(352, 55);
            //DoMigration(346, 47);
            //DoMigration(347, 48);
            //DoMigration(348, 49);
            //DoMigration(358, 39);
            //DoMigration(372,40);
            //DoMigration(268, 41);
            //DoMigration(344, 42);
            //DoMigration(370, 44);
            //DoMigration(371, 45);
            //DoMigration(376, 82);
        }


        public static void DoReplace()
        {
            DBNLDataContext db = new DBNLDataContext();
            foreach (var item in db.Contents)
            {
                item.Description = item.Description.ReplaceHtmlEntities();
                db.SubmitChanges();
            }
        }
        private static void DoMigration(int oldid, int newid)
        {
            DBNLDataContext db = new DBNLDataContext();

            XDocument doc = XDocument.Load("articles.xml");
            foreach (var ele in doc.Root.Elements("articles").Where(p => p.Element("cid").Value == oldid.ToString()))
            {

                Content c = new Content()
                {
                    Title = ele.Element("name_vn").Value,
                    Content1 = HttpUtility.HtmlDecode(ele.Element("content_vn").Value),
                    Picture = ele.Element("img") != null ? ele.Element("img").Value : string.Empty,
                    Status = "Actived",
                    CreatedDate = DateTime.ParseExact(ele.Element("dated").Value, "yyyy-MM-dd", null),
                    CategoryId = newid,


                };

                c.UpdatedDate = c.CreatedDate;
                c.UniqueKey = c.Title.ToUrlKey();
                c.Content1 = c.Content1.Replace("/fckFiles/image/", "/Resources/Galleries/");
                c.Description = c.Content1.TrimmedWord(100);
                Console.WriteLine(c.Title);
                c.Picture = c.Picture.Substring(c.Picture.LastIndexOf("/") + 1);
                db.Contents.InsertOnSubmit(c);
                db.SubmitChanges();


            }
        }
    }
}
