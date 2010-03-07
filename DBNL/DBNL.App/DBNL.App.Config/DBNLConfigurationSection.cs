using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using DBNL.App.Config.Elements;

namespace DBNL.App.Config
{
    public class DBNLConfigurationSection : ConfigurationSection
    {

        [ConfigurationProperty("FileResponsity")]
        public FileResponsityElement FileResponsityElement
        {
            get { return (FileResponsityElement)this["FileResponsity"]; }

        }
        [ConfigurationProperty("WebUIElement")]
        public WebUIElement WebUIElement
        {
            get { return (WebUIElement)this["WebUIElement"]; }
        }
    }
}
