using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBNL.App.Config;
using System.Web;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;
using DBNL.App.Models.Statics;
using DBNL.App.Models.Extensions;

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
            content.CreatedDate = DateTime.Now;
            content.UpdatedDate = DateTime.Now;

            Contents.InsertOnSubmit(content);
            Commit();
            return content;
        }

        public static IQueryable<Content> All(int id)
        {
            return Contents.Where(p => p.CategoryId == id).OrderBy(o => o.IsFeatured).AsQueryable();
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

        public static void ToggleActive(int id)
        {
            Content item = GetItem(id);
            if (item == null) return;
            if (item.Status == EntityStatuses.Actived.ToString()) item.Status = EntityStatuses.Inactive.ToString();
            else item.Status = EntityStatuses.Actived.ToString();
            Commit();
        }

        private static Content GetItems(int id)
        {
            return Contents.Where(p => p.CategoryId == id).SingleOrDefault();
        }

        public static void Delete(int id)
        {
            Content item = GetItem(id);
            Contents.DeleteOnSubmit(item);
            Commit();
        }

        public static Content GetItem(int id)
        {
            return Contents.Where(p => p.ContentId == id).SingleOrDefault();
        }

        public static void Update(Content content, HttpPostedFileBase picture)
        {
            Content original = GetItem(content.ContentId);

            original.Title = content.Title;
            original.Content1 = content.Content1;
            original.Description = content.Description;
            original.IsFeatured = content.IsFeatured;
            original.UniqueKey = content.Title.ToUrlKey();

            Commit();
            try
            {
                if (picture != null && picture.ContentLength > 0)
                {
                    if (string.IsNullOrEmpty(content.Picture))
                    {
                        string ext = VirtualPathUtility.GetExtension(picture.FileName);
                        content.Picture = content.UniqueKey + ".jpg";
                    }
                    MemoryStream ms = new MemoryStream();
                    Image bitmap = Image.FromStream(picture.InputStream);
                    bitmap.Save(Path.Combine(DBNLConfigurationManager.FileResponsity.PictureFolder, content.Picture), ImageFormat.Jpeg);
                    bitmap.Dispose();
                    ms.Close();
                }
            }
            catch (Exception ex)
            {
            }
            finally {
                Commit();
            }


        }

        public static IEnumerable<Content> GetHostNewsList(int item)
        {
            return Contents.Where(p=>p.IsFeatured ==true).OrderByDescending(p => p.UpdatedDate).Skip(0).Take(item).AsEnumerable();

        }
    }
}
