using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

namespace DBNL.App.Config
{
   public class WebUIElement : ConfigurationElement
    {


       [ConfigurationProperty("replacementChar")]

       public string ReplacementChar
       {
           get { return (string)this["replacementChar"]; }
       }

       [ConfigurationProperty("removeRule")]

       public string RemoveRule
       {
           get { return (string)this["removeRule"]; }
       }

       [ConfigurationProperty("test")]

       public string Test
       {
           get { return (string)this["test"]; }
       }
    }
}
