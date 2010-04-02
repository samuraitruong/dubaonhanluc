using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBNL.App.Models.Statics;

namespace DBNL.App.Models.Business
{
    public class NavigationService: BaseService
    {
        public static IEnumerable<Navigation> GetItems(){
            return Navigations.AsEnumerable();
        }
        public static IEnumerable<Navigation> GetItems(NavigationPositions pos)
        {
            return Navigations.Where(p=>p.Position==pos.ToString()).AsEnumerable();
        }
        public static IEnumerable<Navigation> GetItems(NavigationPositions pos, bool rootOnly)
        {
            if(rootOnly) 
            return Navigations.Where(p => p.Position == pos.ToString() && p.ParentId == null).AsEnumerable();
            return GetItems(pos);
        }
        public static Navigation Create(Navigation nv)
        {
            Navigations.InsertOnSubmit(nv);
            Commit();
            return nv;
        }

        public static IQueryable<Navigation> List(int? ParentId, string Position)
        {
            var query = string.IsNullOrEmpty(Position) ? Navigations : Navigations.Where(p => p.Position == Position);

            if (!ParentId.HasValue)
            {
                return query.Where(p => p.ParentId == null).AsQueryable();
            }
            return Navigations.Where(p => p.ParentId.Value == ParentId.Value ).AsQueryable();

        }
    }
}
