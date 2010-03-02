using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBNL.App.Models.Business
{
    public class BaseService
    {
        public static DBNLDataContextDataContext instance;
        public static DBNLDataContextDataContext GetInstance()
        {
            if (instance == null) instance = new DBNLDataContextDataContext();
            return instance;
        }
        public static void Commit(){
            if(instance == null) return;
            instance.SubmitChanges();
        }
    }
}
