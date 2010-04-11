using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBNL.App.Config;
using System.Web;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;

namespace DBNL.App.Models.Business
{
    public class ContentService: BaseService
    {
        public static Content GetContentById(int id)
        {
            DBNLDataContext db = new DBNLDataContext();
            Content content = db.Contents.Where(p => p.ContentId == id).SingleOrDefault();
            return content;

        }
        public static IEnumerable<Content> GetItems(){
            return Contents.AsEnumerable();
        }

        public static Content Create(Content content, HttpPostedFileBase picture)
        {
            if(picture != null) {
                string ext = VirtualPathUtility.GetExtension(picture.FileName);
                //picture.InputStream.Write(
                MemoryStream ms = new MemoryStream();
                Image bitmap = Image.FromStream(picture.InputStream);
                string filename = content.UniqueKey + ".jpg";
                bitmap.Save(Path.Combine(DBNLConfigurationManager.FileResponsity.PictureFolder, filename), ImageFormat.Jpeg);
                content.Picture = filename;
                bitmap.Dispose();
                ms.Close();
            }
            Contents.InsertOnSubmit(content);
            Commit();
            return content;
        }

        public static IEnumerable<Content> GetContentByCategoryId(int id)
        {
            return Contents.Where(p => p.CategoryId == id).OrderBy(o => o.IsFeatured).AsEnumerable();
        }

        public static IQueryable<Content> List(int CategoryId)
        {
            return Contents.Where(p => p.CategoryId == CategoryId).AsQueryable();
        }

        public static IEnumerable<Content> GetFeaturedArtileByCategoryId(int id)
        {
            return Contents.Where(p => p.CategoryId == id && p.IsFeatured == true).
                OrderByDescending(o => o.UpdatedDate).
                Skip(0).
                Take(DBNLConfigurationManager.WebUI.FeaturedContentCount).
                AsEnumerable();
        }

        public static IEnumerable<Content> GetOlderNews(Content content)
        {
            return Contents.Where(p => p.CategoryId == content.CategoryId  && p.UpdatedDate < content.UpdatedDate).
                OrderByDescending(o => o.UpdatedDate).
                Skip(0).
                Take(DBNLConfigurationManager.WebUI.OtherNewsCount).
                AsEnumerable();
        }

        public static IQueryable<Content> All()
        {
            return Contents.AsQueryable();
        }
    }
}
