using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBNL.App.Models.Extensions;
using DBNL.App.Models.Statics;

namespace DBNL.App.Models.Business
{
    public class CategoryService: BaseService
    {
        public static ContentCategory GetFeatureCategory() {

            return Categories.Where(p => p.IsFeatured == true).FirstOrDefault();
        }

        public static IEnumerable<ContentCategory> GetAllCategories()
        {
            return GetInstance().ContentCategories.Where(p=>p.Status != EntityStatuses.Deleted.ToString()).AsEnumerable();
        }

        public static IQueryable<ContentCategory> List()
        {
            return GetInstance().ContentCategories.Where(p=>p.Status != EntityStatuses.Deleted.ToString()).AsQueryable();
        }

        public static ContentCategory AddCategory(string name, int? parentCategoryId)
        {
            ContentCategory category = new ContentCategory
            {
                CategoryName = name.Trim(),
                Key = name.Trim().ToUrlKey(),
                ParentCategoryId = parentCategoryId,
                CreatedDate =DateTime.Now,
                UpdatedDate = DateTime.Now,
                Status = EntityStatuses.Actived.ToString()
            };
            GetInstance().ContentCategories.InsertOnSubmit(category);
            Commit();
            return category;
        }

        public static ContentCategory GetById(int id)
        {
            return Categories.Where(p => p.ID == id).SingleOrDefault();
        }

        public static IQueryable<ContentCategory> List(int? ParentId)
        {
            var query = Categories.Where(p => p.Status != EntityStatuses.Deleted.ToString());

            if(!ParentId.HasValue){
                return query.Where(p => p.ParentCategoryId == null).AsQueryable();
            }
            return query.Where(p => p.ParentCategoryId.Value == ParentId.Value).AsQueryable();
        }

        public static ContentCategory Edit(int id, string name, int? parentId, bool isFeatured, bool showOnHP)
        {
            ContentCategory updCate = GetById(id);
            updCate.CategoryName = name.Trim();
            updCate.UpdatedDate = DateTime.Now;
            if (parentId.HasValue)
            {
                updCate.ParentCategoryId = parentId.Value;
            }
            else
            {
                updCate.ParentCategoryId = null;
            }
            updCate.IsFeatured = isFeatured;
            updCate.ShowOnHP = showOnHP;
            Commit();
            return updCate;
        }

        public static ContentCategory GetRandomCategory()
        {
            int Count = Categories.Count();

            Random r = new Random();
            int idnex = r.Next(Count);

            return Categories.Skip(idnex).Take(1).FirstOrDefault();

        }

        internal static IEnumerable<ContentCategory> GetCategoriesShowOnHP()
        {
            return Categories.Where(p => p.ShowOnHP == true).AsEnumerable();
        }

        public static void Delete(int id)
        {
            ContentCategory cat = GetItem(id);
            Delete(cat);
        }

        private static void Delete(ContentCategory cat)
        {
            if (cat.Status == EntityStatuses.Deleted.ToString()) return;
            foreach (var item in cat.ContentCategories)
            {
                Delete(item);
            }
            //foreach(var content in cat.Contents.Where(p=>p.Status != EntityStatuses.Deleted.ToString()) {
            //    content.Status = 
            //}

            var query = Navigations.Where(p => p.ContentId == cat.ID 
                                            && p.Component == SiteModules.Article.ToString()
                                            ).AsEnumerable();

            foreach (var nav in query)
            {
                nav.Status = EntityStatuses.Deleted.ToString();
                Commit();
            }

            cat.Status = EntityStatuses.Deleted.ToString();
            Commit();

        }

        public static ContentCategory GetItem(int id, EntityStatuses status, bool isExclude)
        {
            return Categories.Where(p => p.ID == id && (isExclude ? p.Status != status.ToString() : p.Status == status.ToString())).SingleOrDefault();

        }
        public static ContentCategory GetItem(int id)
        {
            return Categories.Where(p => p.ID == id).SingleOrDefault();
        }
    }
}
