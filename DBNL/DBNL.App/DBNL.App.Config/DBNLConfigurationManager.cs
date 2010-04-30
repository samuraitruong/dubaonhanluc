using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using DBNL.App.Config.Elements;

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
        public static FileResponsityElement FileResponsity
        {
            get
            {
                return GetInsance().FileResponsityElement;
            }
        }
        public static LuceneElement LuceneElement
        {
            get
            {
                return GetInsance().LuceneElement;
            }
        }
        public static WebUIElement WebUI{
            get{
                return GetInsance().WebUIElement;
            }
        }
    }
}
