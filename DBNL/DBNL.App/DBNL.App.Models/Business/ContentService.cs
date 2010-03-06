using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

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

        public static Content Create(Content content)
        {
            Contents.InsertOnSubmit(content);
            Commit();
            return content;
        }

        public static IEnumerable<Content> GetContentByCategoryId(int id)
        {
            return Contents.Where(p => p.CategoryId == id).OrderBy(o => o.IsFeatured).AsEnumerable();
        }
    }
}
