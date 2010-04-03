using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBNL.App.Models.Extensions;

namespace DBNL.App.Models.Business
{
    public class CategoryService: BaseService
    {
        public static ContentCategory GetFeatureCategory() {

            return Categories.Where(p => p.IsFeatured == true).FirstOrDefault();
        }

        public static IEnumerable<ContentCategory> GetAllCategories()
        {
            return GetInstance().ContentCategories.AsEnumerable();
        }

        public static IQueryable<ContentCategory> List()
        {
            return GetInstance().ContentCategories.AsQueryable();
        }

        public static ContentCategory AddCategory(string name, int? parentCategoryId)
        {
            ContentCategory category = new ContentCategory
            {
                CategoryName = name.Trim(),
                Key = name.Trim().ToUrlKey(),
                ParentCategoryId = parentCategoryId
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
            if(!ParentId.HasValue){
                return Categories.Where( p=>p.ParentCategoryId == null).AsQueryable();
            }
            return Categories.Where(p => p.ParentCategoryId.Value == ParentId.Value).AsQueryable();
        }

        public static ContentCategory Edit(int id, string name, int? parentId, bool isFeatured, bool showOnHP)
        {
            ContentCategory updCate = GetById(id);
            updCate.CategoryName = name.Trim();
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
    }
}
