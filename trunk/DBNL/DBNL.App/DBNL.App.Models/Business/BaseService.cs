using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBNL.App.Models.Business
{
    public class BaseService
    {
        public static DBNLDataContext instance;
        public static DBNLDataContext GetInstance()
        {
            if (instance == null) instance = new DBNLDataContext();
            return instance;
        }
        public static void Commit(){
            if(instance == null) return;
            instance.SubmitChanges();
        }
    }
}
