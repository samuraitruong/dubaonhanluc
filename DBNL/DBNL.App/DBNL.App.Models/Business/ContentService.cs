using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBNL.App.Models.Business
{
    public class ContentService
    {
        public static Content GetContentById(int id)
        {
            DBNLDataContext db = new DBNLDataContext();
            Content content = db.Contents.Where(p => p.ContentId == id).SingleOrDefault();
            return content;

        }
    }
}
