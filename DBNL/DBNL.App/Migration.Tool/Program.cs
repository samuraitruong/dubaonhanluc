using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml.Linq;
using DBNL.App.Models;
using DBNL.App.Models.Extensions;
using System.Web;



namespace Migration.Tool
{
    class Program
    {
        static void Main(string[] args)
        {
            //return;
            
            //DoMigration(358, 39);
            //DoMigration(372, 40);
            //DoMigration(268, 41);
            //DoMigration(344, 42);

            //DoMigration(370, 44);
            //DoMigration(371, 45);

            //DoMigration(346, 47);
            //DoMigration(347, 48);
            //DoMigration(348, 49);
            //DoMigration(349, 50);
            //DoMigration(355, 51);
            //DoMigration(351, 52);
            //DoMigration(350, 53);
            //DoMigration(356, 54);
            //DoMigration(352, 55);
           // DoMigration(357, 56);
            //DoMigration(376, 82);
            //FixDB();
        }

        private static void FixDB()
        {
             DBNLDataContext db = new DBNLDataContext();

            var items = from p in db.Contents
                        join p2 in db.Contents on p.Title equals p2.Title
                        where p.ContentId != p2.ContentId
                        select p;

            foreach (var item in items)
            {
                var query = from i in db.Contents
                            where i.Title == item.Title && i.ContentId != item.ContentId
                            select i;
                foreach (var k in query)
                {
                    Console.WriteLine(k.ContentId.ToString() +"\t"+k.Title);
                    db.Contents.DeleteOnSubmit(k);
                    db.SubmitChanges();
                }

            }
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
            foreach (var ele in doc.Root.Elements("table"))
            {
                //.Where(p => p.Element("column").Attribute("cid").Value == oldid.ToString())
                var cid = ele.Elements("column").Where(a => a.Attribute("name").Value == "cid").Select(a => a.Value).FirstOrDefault();
                if (cid != oldid.ToString()) continue;

                var name =  ele.Elements("column").Where(a => a.Attribute("name").Value == "name_vn").Select(a => a.Value).FirstOrDefault();
                var content_vn = ele.Elements("column").Where(a => a.Attribute("name").Value == "content_vn").Select(a => a.Value).FirstOrDefault();
                var img = ele.Elements("column").Where(a => a.Attribute("name").Value == "img").Select(a => a.Value).FirstOrDefault();
                var dated = ele.Elements("column").Where(a => a.Attribute("name").Value == "dated").Select(a => a.Value).FirstOrDefault();
                var ids = ele.Elements("column").Where(a => a.Attribute("name").Value == "id").Select(a => a.Value).FirstOrDefault();

                int id = int.Parse(ids);
                //if(id <847) continue;
                DateTime d = DateTime.ParseExact(dated, "yyyy-MM-dd", null);
                Content c = new Content()
                {
                    Title = name,
                    Content1 = HttpUtility.HtmlDecode(content_vn),
                    Picture = img,
                    Status = "Actived",
                    CreatedDate = d,
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
