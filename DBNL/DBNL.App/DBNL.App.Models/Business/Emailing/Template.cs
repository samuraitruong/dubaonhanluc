using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.IO;

/// <summary>
/// Summary description for Template
/// </summary>
/// 
namespace DBNL.App.Models.Business.Emailing
{
    public class Template
    {
        private string src;

        public string Sources
        {
            get { return src; }
            set { src = value; }
        }
        public Template(string fileName)
        {
            if (File.Exists(fileName))
            {
                this.src = File.ReadAllText(fileName, Encoding.UTF8);
            }
            else
            {
                throw new Exception("File template doesn't exist");
            }
        }
        public Template(string fileName, Encoding coding)
        {
            this.src = File.ReadAllText(fileName, coding);
        }
        public virtual string Merge(Parameters p)
        {
            TemplateParser parser = new TemplateParser(p);
            parser.SetTemplate(this.src);
            return parser.Parse();
        }
        public Template()
        { }

    }
}