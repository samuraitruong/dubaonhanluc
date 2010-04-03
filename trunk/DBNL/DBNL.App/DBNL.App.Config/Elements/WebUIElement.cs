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

       [ConfigurationProperty("featuredCount")]
       public int FeaturedContentCount
       {
           get { return (int)this["featuredCount"]; }
       }

       [ConfigurationProperty("othernewsCount")]
       public int OtherNewsCount
       {
           get { return (int)this["othernewsCount"]; }
       }
       [ConfigurationProperty("hotestNewsCount")]
       public int HotestNewsCount
       {
           get { return (int)this["hotestNewsCount"]; }
       }
       [ConfigurationProperty("otherFeaturesNews")]
       public int OtherFeaturesNews
       {
           get { return (int)this["otherFeaturesNews"]; }
       }
       
    }
}
