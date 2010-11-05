using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TemplateBuilder
/// </summary>
/// 
namespace DBNL.App.Models.Business.Emailing
{
    public class TemplateBuilder
    {
        public string TemplateName { get; set; }
        public string Content;
        public TemplateBuilder(string templateName)
        {
            TemplateName = templateName;
        }
        public TemplateBuilder()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        protected void Init()
        {
            if (string.IsNullOrEmpty(this.Content)) Content = Resources.Templates.ResourceManager.GetString(TemplateName);
        }
        public void AddParameter(string key, object obj)
        {
            Init();
            this.Content = this.Content.Replace("[" + key + "]", obj.ToString());
        }
        public override string ToString()
        {
            return this.Content;
        }

        public void Replace(string p, string p_2)
        {
            this.Content = Content.Replace(string.Format("<%!--{0}--%>", p), p_2);
        }
    }
}