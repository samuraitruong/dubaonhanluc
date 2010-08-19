using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBNL.App.Config;
using System.Web;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;

using DBNL.App.Models.Extensions;
using DBNL.App.Models.Statics;

namespace DBNL.App.Models.Business
{
    
    public class ContentService: BaseService
    {
        public ContentService() : base() { }
        public  Content GetContentById(int id)
        {
            Content content = Contents.Where(p => p.ContentId == id).SingleOrDefault();
            return content;

        }
        public  IEnumerable<Content> GetItems(){
            return Contents.AsEnumerable();
        }

        
        public  Content Create(Content content, HttpPostedFileBase picture)
        {
            try
            {
                if (picture != null && picture.ContentLength > 0)
                {
                    string ext = VirtualPathUtility.GetExtension(picture.FileName);
                    MemoryStream ms = new MemoryStream();
                    Image bitmap = Image.FromStream(picture.InputStream);
                    string filename = content.UniqueKey + ".jpg";
                    bitmap.Save(Path.Combine(DBNLConfigurationManager.FileResponsity.PictureFolder, filename), ImageFormat.Jpeg);
                    content.Picture = filename;
                    bitmap.Dispose();
                    ms.Close();
                }
            }
            catch (IOException ex)
            {
            }
            content.CreatedDate = DateTime.Now;
            content.UpdatedDate = DateTime.Now;
            
            Contents.InsertOnSubmit(content);
            Commit();
            return content;
        }

        public  IQueryable<Content> All(int id)
        {
            return Contents.Where(p => p.CategoryId == id && p.Status == EntityStatuses.Actived.ToString())
                //.OrderByDescending(o => o.IsFeatured)
                .OrderByDescending(p=>p.UpdatedDate)
                
                .AsQueryable();
        }

        public  IEnumerable<Content> GetContentByCategoryId(int id)
        {
            return Contents.Where(p => p.CategoryId == id).OrderBy(o => o.IsFeatured).AsEnumerable();
        }

        public  IQueryable<Content> List(int CategoryId)
        {
            return Contents.Where(p => p.CategoryId == CategoryId).AsQueryable();
        }

        public  IEnumerable<Content> GetFeaturedArtileByCategoryId(int id)
        {
            return Contents.Where(p => p.CategoryId == id && p.IsFeatured == true).
                OrderByDescending(o => o.UpdatedDate).
                Skip(0).
                Take(DBNLConfigurationManager.WebUI.FeaturedContentCount).
                AsEnumerable();
        }

        public  IEnumerable<Content> GetOlderNews(Content content)
        {
            return Contents.Where(p => p.CategoryId == content.CategoryId  && p.UpdatedDate < content.UpdatedDate).
                OrderByDescending(o => o.UpdatedDate).
                Skip(0).
                Take(DBNLConfigurationManager.WebUI.OtherNewsCount).
                AsEnumerable();
        }

        public  IQueryable<Content> All()
        {
            return Contents.AsQueryable();
        }

        public  void ToggleActive(int id)
        {
            Content item = GetItem(id);
            if (item == null) return;
            if (item.Status == EntityStatuses.Actived.ToString()) item.Status = EntityStatuses.Inactive.ToString();
            else item.Status = EntityStatuses.Actived.ToString();
            Commit();
        }

        private  Content GetItems(int id)
        {
            return Contents.Where(p => p.CategoryId == id).SingleOrDefault();
        }

        public  void Delete(int id)
        {
            Content item = GetItem(id);
            Contents.DeleteOnSubmit(item);
            Commit();
        }

        public  Content GetItem(int id)
        {
            return Contents.Where(p => p.ContentId == id).SingleOrDefault();
        }

        public  void Update(Content content, HttpPostedFileBase picture)
        {

            //this.Contents.Attach(content);
            Content original = GetItem(content.ContentId);

            original.Title = content.Title;
            original.Content1 = content.Content1;
            original.Description = content.Description;
            original.IsFeatured = content.IsFeatured;
            original.UniqueKey = content.Title.ToUrlKey();
            original.CategoryId = content.CategoryId;
            //original.ContentCategory = new CategoryService().GetById(content.CategoryId);


            
            try
            {
                if (picture != null && picture.ContentLength > 0)
                {
                    if (string.IsNullOrEmpty(original.Picture) || Path.HasExtension(original.Picture))
                    {
                        string ext = VirtualPathUtility.GetExtension(picture.FileName);
                        original.Picture = original.UniqueKey + ".jpg";
                    }
                    MemoryStream ms = new MemoryStream();
                    Image bitmap = Image.FromStream(picture.InputStream);
                    bitmap.Save(Path.Combine(DBNLConfigurationManager.FileResponsity.PictureFolder, original.Picture), ImageFormat.Jpeg);
                    bitmap.Dispose();
                    ms.Close();
                }
            }
            catch (Exception ex)
            {
               
            }
            Commit();
        }

        public  IEnumerable<Content> GetHostNewsList(int item)
        {
            return Contents.Where(p=>p.IsFeatured ==true).OrderByDescending(p => p.UpdatedDate).Skip(0).Take(item).AsEnumerable();

        }

        public  Content GetContentByKey(string content)
        {
            return Contents.Where(p => p.UniqueKey == content).FirstOrDefault();
        }

        public  IQueryable<Models.Content> AllOrhanArticles()
        {
            var query = from p in Contents
                        join p2 in Categories on p.CategoryId equals p2.ID
                        where p.Status != EntityStatuses.Deleted.ToString() && p2.Invisible ==true
                        orderby p.Title
                        select p;
            return query.AsQueryable();

        }

        public  void ToggleOnHP(int id)
        {
            var item = GetItem(id);
            if (item == null) return;

            item.IsFeatured = !item.IsFeatured;
            item.IsFocusing = !item.IsFocusing;
            item.UpdatedDate = DateTime.Now;

            Commit();
            UpdateForcusingItem();
        }

        public  void UpdateForcusingItem()
        {
            var query = Contents.Where(p => p.IsFocusing == true)
                                .OrderByDescending(p => p.UpdatedDate)
                                .Skip(DBNLConfigurationManager.WebUI.HotestNewsCount + DBNLConfigurationManager.WebUI.OtherFeaturesNews)
                                .AsEnumerable();

            foreach (var item in query)
            {
                item.IsFocusing = false;
                Commit();
            }
        }
    }
}
