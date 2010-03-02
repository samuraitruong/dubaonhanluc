using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

namespace DBNL.App.Config
{
    public class DBNLConfigurationManager
    {
        public static DBNLConfigurationSection instance;

        public static DBNLConfigurationSection GetInsance()
        {
            if(instance == null) {
             instance = (DBNLConfigurationSection)ConfigurationManager.GetSection("DBNL.App.Config");
            }
            return instance;
        }
        public static WebUIElement WebUI{
            get{
                return GetInsance().WebUIElement;
            }
        }
    }
}
