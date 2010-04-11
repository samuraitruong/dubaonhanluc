using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBNL.App.Models.Statics;

namespace DBNL.App.Models.Business
{
    public class SupporterService: BaseService
    {
        public static Supporter Create(Supporter sp){
            sp.Status = EntityStatuses.Actived.ToString();
            Supporters.InsertOnSubmit(sp);
            Commit();
            return sp;
        }
        public static IEnumerable<Supporter> GetItems()
        {
            return Supporters.AsEnumerable();
        }

        public static IQueryable<Supporter> List()
        {
            return Supporters.AsQueryable();
        }
        public static Supporter GetItem(int id) {
            return Supporters.Where(p => p.Id == id).SingleOrDefault();
        }
        public static Supporter Add(Supporter sp)
        {
            Supporters.InsertOnSubmit(sp);
            Commit();
            return sp;
        }

        public static void Delete(int id)
        {
            Supporter sp = GetItem(id);
            Supporters.DeleteOnSubmit(sp);
            Commit();
        }
    }
}
