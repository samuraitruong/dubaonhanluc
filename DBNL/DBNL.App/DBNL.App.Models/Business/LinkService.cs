using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBNL.App.Models.Business
{
    public class LinkService:BaseService
    {
        public  IEnumerable<Link> GetAllItems()
        {
            return this.Links.AsEnumerable();
        }
        public  IQueryable<Link> List()
        {
            return this.Links.AsQueryable();
        }
        public  Link GetItem(int id)
        {
            return this.Links.Where(p => p.Id == id).SingleOrDefault();
        }

        public  Link Add(string title, string url)
        {
            Link link = new Link();
            link.Title = title.Trim();
            link.Url = url.Trim();
            link.UpdatedDate = DateTime.Today;
            link.CreatedDate = DateTime.Today;
            this.Links.InsertOnSubmit(link);
            Commit();
            return link;
        }

        public  Link Edit(int id, string title, string url)
        {
            Link updLink = this.Links.Where(p => p.Id == id).SingleOrDefault();
            updLink.Title = title;
            updLink.Url = url;
            updLink.UpdatedDate = DateTime.Today;
            Commit();
            return updLink;
        }

        public  void Delete(int id)
        {
            Link link = this.Links.Where(p => p.Id == id).SingleOrDefault();
            this.Links.DeleteOnSubmit(link);
            Commit();
        }

        public  Link Update(int EntityId, string Title, string Url)
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
