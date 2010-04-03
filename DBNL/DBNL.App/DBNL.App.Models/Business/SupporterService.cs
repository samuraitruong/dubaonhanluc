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
    }
}
