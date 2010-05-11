using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBNL.App.Models.Statics;

namespace DBNL.App.Models.Business
{
    public class SupporterService: BaseService
    {
        public  Supporter Create(Supporter sp){
            sp.Status = EntityStatuses.Actived.ToString();
            this.Supporters.InsertOnSubmit(sp);
            Commit();
            return sp;
        }
        public  IEnumerable<Supporter> GetItems()
        {
            return Supporters.AsEnumerable();
        }
        public  IEnumerable<Supporter> GetItems(EntityStatuses status)
        {
            return Supporters.Where(p=>p.Status == status.ToString()).AsEnumerable();
        }

        public  IQueryable<Supporter> List()
        {
            return Supporters.AsQueryable();
        }
        public  Supporter GetItem(int id) {
            return Supporters.Where(p => p.Id == id).SingleOrDefault();
        }
        public  Supporter Add(Supporter sp)
        {
            Supporters.InsertOnSubmit(sp);
            Commit();
            return sp;
        }

        public  void Delete(int id)
        {
            Supporter sp = GetItem(id);
            Supporters.DeleteOnSubmit(sp);
            Commit();
        }

        public  void Public(int id)
        {
            Supporter sp = GetItem(id);
            if (sp.Status == EntityStatuses.Actived.ToString())
                sp.Status = EntityStatuses.Inactive.ToString();
            else
            {
                sp.Status = EntityStatuses.Actived.ToString();
            }
            Commit();
        }

        public  void Edit(int id, string NickName, string Name)
        {
            Supporter sp = GetItem(id);
            sp.NickName = NickName;
            sp.Name = Name;
            Commit();
        }
    }
}
