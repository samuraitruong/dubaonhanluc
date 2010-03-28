using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBNL.App.Models.Extensions;

namespace DBNL.App.Models.Business
{
    public class CategoryService: BaseService
    {
        public static IEnumerable<ContentCategory> GetAllCategories()
        {
            return GetInstance().ContentCategories.AsEnumerable();
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
    }
}
