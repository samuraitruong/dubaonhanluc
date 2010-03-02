using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

namespace DBNL.App.Config
{
    public class DBNLConfigurationSection : ConfigurationSection
    {
        [ConfigurationProperty("WebUIElement")]
        public WebUIElement WebUIElement
        {
            get { return (WebUIElement)this["WebUIElement"]; }
        }
    }
}
