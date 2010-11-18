using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

namespace DBNL.App.Config
{
   public class WebUIElement : ConfigurationElement
    {
       
        [ConfigurationProperty("articlePagingItem")]
        public int ArticlePagingItem
        {
            get { return (int)this["articlePagingItem"]; }
        }
       [ConfigurationProperty("jobDisplayOnHP")]
        public int JobDisplayOnHP
        {
            get { return (int)this["jobDisplayOnHP"]; }
        }
       [ConfigurationProperty("marqueeItemCount")]
           public int MarqueeItemCount
           {
               get { return (int)this["marqueeItemCount"]; }
           }

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
        [ConfigurationProperty("featuredItemOnHP")]
       public int FeaturedItemOnHP
       {
           get { return (int)this["featuredItemOnHP"]; }
       }
        [ConfigurationProperty("extension")]
        public string Extension
        {
            get { return (string)this["extension"]; }
        }

        [ConfigurationProperty("ReCaptchaPrivateKey")]
        public string ReCaptchaPrivateKey
        {
            get { return (string)this["ReCaptchaPrivateKey"]; }
        }

        [ConfigurationProperty("ReCaptchaPublicKey")]
        public string ReCaptchaPublicKey
        {
            get { return (string)this["ReCaptchaPublicKey"]; }
        }
        [ConfigurationProperty("VideoPlayer")]
        public string VideoPlayer
        {
            get { return (string)this["VideoPlayer"]; }
        }
       
    }
}
