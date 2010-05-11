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
        public  ContentCategory GetFeatureCategory() {

            return Categories.Where(p => p.IsFeatured == true).FirstOrDefault();
        }

        public  IEnumerable<ContentCategory> GetAllCategories()
        {
            return this.Categories.Where(p=>p.Status != EntityStatuses.Deleted.ToString() && p.Invisible == false).AsEnumerable();
        }

        public  IQueryable<ContentCategory> List()
        {
            return this.Categories.Where(p => p.Status != EntityStatuses.Deleted.ToString() && p.Invisible == false).AsQueryable();
        }

        public  ContentCategory AddCategory(string name, int? parentCategoryId)
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
            this.Categories.InsertOnSubmit(category);
            Commit();
            return category;
        }

        public  ContentCategory GetById(int id)
        {
            return Categories.Where(p => p.ID == id).SingleOrDefault();
        }

        public  IQueryable<ContentCategory> List(int? ParentId)
        {
            var query = Categories.Where(p => p.Status != EntityStatuses.Deleted.ToString() && p.Invisible == false);

            if(!ParentId.HasValue){
                return query.Where(p => p.ParentCategoryId == null).AsQueryable();
            }
            return query.Where(p => p.ParentCategoryId.Value == ParentId.Value).AsQueryable();
        }

        public  ContentCategory Edit(int id, string name, int? parentId, bool isFeatured, bool showOnHP)
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
            UpdateFeaturedCategory();
            return updCate;
        }

        public  ContentCategory GetRandomCategory()
        {
            int Count = Categories.Count();

            Random r = new Random();
            int idnex = r.Next(Count);

            return Categories.Skip(idnex).Take(1).FirstOrDefault();

        }
        public static IEnumerable<ContentCategory> GetCategoriesShowOnHPEx()
        {
            CategoryService service = new CategoryService();

            return service.GetCategoriesShowOnHP();
        }
        public IEnumerable<ContentCategory> GetCategoriesShowOnHP()
        {
            return Categories.Where(p => p.ShowOnHP == true).AsEnumerable();
        }

        public  void Delete(int id)
        {
            ContentCategory cat = GetItem(id);
            Delete(cat);
        }

        private  void Delete(ContentCategory cat)
        {
            if (cat.Status == EntityStatuses.Deleted.ToString()) return;
            foreach (var item in cat.ContentCategories)
            {
                Delete(item);
            }
            //foreach(var content in cat.Contents.Where(p=>p.Status != EntityStatuses.Deleted.ToString()) {
            //    content.Status = 
            //}

            var query = Navigations.Where(p => p.CategoryId == cat.ID 
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

        public  ContentCategory GetItem(int id, EntityStatuses status, bool isExclude)
        {
            return Categories.Where(p => p.ID == id && (isExclude ? p.Status != status.ToString() : p.Status == status.ToString())).SingleOrDefault();

        }
        public  ContentCategory GetItem(int id)
        {
            return Categories.Where(p => p.ID == id).SingleOrDefault();
        }

        public  ContentCategory GetByKey(string category)
        {
            return Categories.Where(p => p.Key == category).SingleOrDefault();
        }

        public  IEnumerable<ContentCategory> GetItems(int? ParentId)
        {
            if(!ParentId.HasValue) return Categories.Where(p=>p.ParentCategoryId == null &&  p.Invisible == false).OrderBy(p => p.CategoryName).AsEnumerable();

            return Categories.Where(p => p.ParentCategoryId == ParentId.Value && p.Invisible == false).OrderBy(p => p.CategoryName).AsEnumerable();

        }

        public  void Update(int id, ContentCategory category)
        {
            var original = GetById(id);
            original.CategoryName = category.CategoryName;
            original.Key = category.CategoryName.ToUrlKey();
            original.IsFeatured = category.IsFeatured;
            original.ShowOnHP = category.ShowOnHP;
            original.Status =category.Status;
            original.UpdatedDate = DateTime.Now;
            if(category.ParentCategoryId.HasValue)
            original.ContentCategory1 = GetById(category.ParentCategoryId.Value);
            Commit();
            UpdateFeaturedCategory();
        }

        public  void Create(ContentCategory category)
        {
            string key = category.CategoryName.ToUrlKey();
            var item = GetByKey(key);
            if (item != null)
            {
                key += category.GetHashCode().ToString();
            }
            category.CreatedDate = DateTime.Now;
            category.UpdatedDate = DateTime.Now;
            category.Key = key;

            category.Status = EntityStatuses.Actived.ToString();
            Categories.InsertOnSubmit(category);
            Commit();
            UpdateFeaturedCategory();
        }

        private  void UpdateFeaturedCategory()
        {
            
        }

        public  ContentCategory GetInvisibleCategory()
        {
            return Categories.Where(p => p.Invisible == true).SingleOrDefault();
        }

        public  IEnumerable<Content> GetForcusingContents(int count)
        {
            var list = Contents.Where(p => p.IsFocusing == true)
                                .OrderByDescending(p => p.CreatedDate)
                                .Skip(0)
                                .Take(count)
                                .ToList();
            int remain = count - list.Count;


            if (remain > 0)
            {
                var query1 = Contents.Where(p => p.IsFocusing == false)
                                .OrderByDescending(p => p.CreatedDate)
                                .Skip(0)
                                .Take(remain).AsEnumerable();
                list.AddRange(query1.ToList());
            }
            return list;

        }
    }
}
