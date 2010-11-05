using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DBNL.App.Models.Business;

namespace DBNL.App.Models
{
    public class SiteConfigurations
    {
        public bool ProtectAllContent
        {

            get
            {
                return new ConfigurationService().GetBoolean("ProtectAllContent");
            }

            set
            {
                new ConfigurationService().SetValue("ProtectAllContent", value);
            }
        }
    }
}