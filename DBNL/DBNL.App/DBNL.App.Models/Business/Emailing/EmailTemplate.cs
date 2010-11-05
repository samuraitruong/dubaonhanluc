using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.Net.Mail;

namespace DBNL.App.Models.Business.Emailing
{
    public class EmailTemplate : Template
    {
        private MailMessage mailMessage;

        public MailMessage MailMessage
        {
            get { return mailMessage; }
            set { mailMessage = value; }
        }

        public override string Merge(Parameters p)
        {
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.LoadXml(base.Merge(p));
            XmlNode root = xmlDoc.DocumentElement;

            mailMessage.Subject = root.SelectSingleNode("subject").InnerText.Replace("\r\n", string.Empty);
            mailMessage.From = new MailAddress(root.SelectSingleNode("addresses/entry[@name=\"From\"]/@value").InnerText.Replace("\r\n", string.Empty));

            XmlNodeList recipients = root.SelectNodes("addresses/entry[@name=\"To\"]/@value");
            StringBuilder sb = new StringBuilder();
            foreach (XmlNode node in recipients)
            {
                mailMessage.To.Add(new MailAddress(node.InnerText.Replace("\r\n", string.Empty)));
            }
            XmlNodeList repliers = root.SelectNodes("addresses/entry[@name=\"ReplyTo\"]/@value");
            foreach (XmlNode node in repliers)
            {
                mailMessage.ReplyTo =new MailAddress(node.InnerText.Replace("\r\n", string.Empty));
            }

            XmlNodeList attachments = root.SelectNodes("attachments/file/@path");

            foreach (XmlNode node in attachments)
            {
                mailMessage.Attachments.Add(new Attachment(node.InnerText.Replace("\r\n", string.Empty)));
            }
            XmlNode bodyNode = root.SelectSingleNode("body");
            mailMessage.Body = bodyNode.FirstChild.InnerText.Replace("\r\n", string.Empty);
            mailMessage.IsBodyHtml = true;
            return xmlDoc.InnerXml;
        }
        public EmailTemplate(string fileName)
            : base(fileName)
        {
            mailMessage = new MailMessage();
        }
    }
}