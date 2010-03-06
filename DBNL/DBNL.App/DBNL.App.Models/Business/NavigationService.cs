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
            return Navigations.Where(p=>p.Possition==pos.ToString()).AsEnumerable();
        }
        public static Navigation Create(Navigation nv)
        {
            Navigations.InsertOnSubmit(nv);
            Commit();
            return nv;
        }
    }
}
