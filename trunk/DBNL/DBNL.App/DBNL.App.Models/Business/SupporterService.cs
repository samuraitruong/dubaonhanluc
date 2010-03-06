using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBNL.App.Models.Business
{
    public class SupporterService: BaseService
    {
        public static Supporter Create(Supporter sp){
            Supporters.InsertOnSubmit(sp);
            Commit();
            return sp;
        }
    }
}
