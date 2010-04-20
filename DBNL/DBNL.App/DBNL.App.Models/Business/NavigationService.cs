using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBNL.App.Models.Statics;
using DBNL.App.Models.Extensions;

namespace DBNL.App.Models.Business
{
    public class NavigationService : BaseService
    {
        public static IEnumerable<Navigation> GetItems()
        {
            return Navigations.AsEnumerable();
        }
        public static IEnumerable<Navigation> GetItems(NavigationPositions pos)
        {
            return Navigations.Where(p => p.Position == pos.ToString()).OrderBy(p=>p.DisplayOrder).AsEnumerable();
        }
        public static IEnumerable<Navigation> GetItems(string pos)
        {
            return Navigations.Where(p => p.Position == pos && p.ParentId ==null).OrderBy(p=>p.DisplayOrder).AsEnumerable();
        }

        private static IEnumerable<Navigation> GetItems(int parentId)
        {
            return Navigations.Where(p => p.ParentId == parentId).OrderBy(p=>p.DisplayOrder).AsEnumerable();
        }
        public static IEnumerable<Navigation> GetItems(NavigationPositions pos, bool rootOnly)
        {
            if (rootOnly)
                return Navigations.Where(p => p.Position == pos.ToString() && p.ParentId == null).OrderBy(p=>p.DisplayOrder).AsEnumerable();
            return GetItems(pos);
        }
        public static Navigation Create(Navigation nv)
        {
            nv.CreatedDate = DateTime.Now;
            nv.UpdatedDate = DateTime.Now;
            if(nv.ParentId.HasValue && nv.ParentId.Value ==0) nv.ParentId = new Nullable<int>();
            nv.Status = EntityStatuses.Actived.ToString();

            if (nv.Component == SiteModules.Article.ToString())
            {
                if (!nv.ContentId.HasValue || nv.ContentId.Value == 0)
                {
                    ContentCategory cat = new ContentCategory()
                    {
                        CategoryName = nv.Name,
                        CreatedDate = DateTime.Now,
                        IsFeatured = false,
                        Key = nv.Name.ToUrlKey(),
                        ParentCategoryId = new Nullable<int>(),
                        Status = EntityStatuses.Actived.ToString(),
                        UpdatedDate = DateTime.Now
                    };


                    Navigation parent = GetItem(nv.ParentId.HasValue? nv.ParentId.Value: 0);
                    if (parent != null && parent.Component == SiteModules.Article.ToString())
                    {
                        cat.ParentCategoryId = parent.ContentId;
                    }
                    nv.Controller = DBNL.App.Models.Statics.Controllers.Article.ToString();
                    nv.Action = DBNL.App.Models.Statics.Actions.Category.ToString();
                    nv.Area = "";


                    Categories.InsertOnSubmit(cat);
                    Commit();
                    nv.ContentId = cat.ID;
                }
            }
            Navigations.InsertOnSubmit(nv);
            Commit();
            Reorder(nv.Id, ReorderMethods.Down.ToString());
            return nv;
        }

        public static IQueryable<Navigation> List(int? ParentId, string Position)
        {
            var query = Navigations.Where(p=>p.Status != EntityStatuses.Deleted.ToString());

            if(!string.IsNullOrEmpty(Position) ) query = query.Where(p => p.Position == Position);

            if (!ParentId.HasValue)
            {
                return query.Where(p => p.ParentId == null).OrderBy(p=>p.DisplayOrder).AsQueryable();
            }
            return Navigations.Where(p => p.ParentId.Value == ParentId.Value).OrderBy(p => p.DisplayOrder).AsQueryable();

        }

        public static void Reorder(int Id, string Method)
        {
            Navigation nav = GetItem(Id);
            List<Navigation> navigations;
            if (nav == null) return;
            if (nav.Navigation1 == null)
            {
                navigations = GetItems(nav.Position).ToList();
            }
            else
            {
                navigations = GetItems(nav.ParentId.Value).ToList();
            }
            if (Method == ReorderMethods.Up.ToString())
            {
                
                for (int i=1; i<=navigations.Count() ;i++)
                {
                    Navigation curent = navigations[(i-1)];
                    //curent.DisplayOrder = i;

                    if (curent.Id == nav.Id && i>1)
                    {
                        navigations[i -2].DisplayOrder = i;
                        curent.DisplayOrder = i -1;
                        break;
                    }
                }
            }

            if (Method == ReorderMethods.Down.ToString())
            {

                for (int i = 1; i <=navigations.Count(); i++)
                {
                    Navigation curent = navigations[i-1];
                    //curent.DisplayOrder = i;

                    if (curent.Id == nav.Id && i < navigations.Count)
                    {
                        navigations[i].DisplayOrder = i;
                        curent.DisplayOrder = i + 1;
                        break;
                    }
                }
            }

            Commit();
        }


        public static Navigation GetItem(int Id)
        {
            return Navigations.Where(p => p.Id == Id).SingleOrDefault();
        }

        public static void UpdateMenuItem(Navigation navigation)
        {
            Navigation original = GetItem(navigation.Id);
            original.Action     = navigation.Action;
            original.Area = navigation.Area;
            original.Component = navigation.Component;
            original.Position = navigation.Position;
            original.ContentId = navigation.ContentId;
            original.Controller = navigation.Controller;
            original.DisplayOrder = navigation.DisplayOrder;
            original.ExternalUrl = navigation.ExternalUrl;
            original.Name = navigation.Name;
            original.ParentId = navigation.ParentId;
            original.RelativeUrl = navigation.RelativeUrl;
            original.Status = navigation.Status;

            Commit();
        }

        public static void Delete(int id)
        {
            Navigation item = GetItem(id);
            Delete(item);
        }

        public static void Delete(Navigation nav)
        {
            if (nav == null) return;

            foreach (var item in nav.Navigations)
            {
                Delete(item);
            }
            Navigations.DeleteOnSubmit(nav);
            Commit();
        }
    }
    public enum ReorderMethods
    {
        Up,
        Down
    }
}
