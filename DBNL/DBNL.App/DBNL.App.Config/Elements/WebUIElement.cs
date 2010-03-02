using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

namespace DBNL.App.Config
{
   public class WebUIElement : ConfigurationElement
    {

       [ConfigurationProperty("test")]

       public string Test
       {
           get { return (string)this["test"]; }
       }
    }
}
