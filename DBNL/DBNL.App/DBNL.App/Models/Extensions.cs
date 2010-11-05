using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Script.Serialization;
using Recaptcha;
using System.Web.Mvc;
using System.Web.UI;
using DBNL.App.Config;
using System.IO;

namespace DBNL.App.Extensions
{
    public static class Extensions
    {
        public static string ToJson(this object obj)
        {
            JavaScriptSerializer sr = new JavaScriptSerializer();
            return sr.Serialize(obj);
            
        }
        public static string GenerateCaptcha(this HtmlHelper helper)
        {
            var captchaControl = new RecaptchaControl
            {
                ID = "recaptcha",
                Theme = "clean", //http://wiki.recaptcha.net/index.php/Theme
                PublicKey = DBNLConfigurationManager.WebUI.ReCaptchaPublicKey,
                PrivateKey = DBNLConfigurationManager.WebUI.ReCaptchaPrivateKey
            };
            var htmlWriter = new HtmlTextWriter(new StringWriter());
            captchaControl.RenderControl(htmlWriter);
            return htmlWriter.InnerWriter.ToString();
        }
    }
}
