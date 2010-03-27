using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBNL.App.Models.Business
{
    public class LinkService:BaseService
    {
        public static IEnumerable<Link> GetAllItems()
        {
            return GetInstance().Links.AsEnumerable();
        }
        public static IQueryable<Link> List()
        {
            return GetInstance().Links.AsQueryable();
        }
        public static Link GetItem(int id)
        {
            return GetInstance().Links.Where(p => p.Id == id).SingleOrDefault();
        }

        public static Link Add(string title, string url)
        {
            Link link = new Link();
            link.Title = title.Trim();
            link.Url = url.Trim();
            link.UpdatedDate = DateTime.Today;
            link.CreatedDate = DateTime.Today;
            GetInstance().Links.InsertOnSubmit(link);
            Commit();
            return link;
        }

        public static Link Edit(int id, string title, string url)
        {
            Link updLink = GetInstance().Links.Where(p => p.Id == id).SingleOrDefault();
            updLink.Title = title;
            updLink.Url = url;
            updLink.UpdatedDate = DateTime.Today;
            Commit();
            return updLink;
        }

        public static void Delete(int id)
        {
            Link link = GetInstance().Links.Where(p => p.Id == id).SingleOrDefault();
            GetInstance().Links.DeleteOnSubmit(link);
            Commit();
        }

        public static Link Update(int EntityId, string Title, string Url)
        {
            Link entity = GetItem(EntityId);
            entity.Url = Url;
            entity.Title = Title;
            entity.UpdatedDate = DateTime.Now;
            Commit();
            return entity;
        }
    }
}
