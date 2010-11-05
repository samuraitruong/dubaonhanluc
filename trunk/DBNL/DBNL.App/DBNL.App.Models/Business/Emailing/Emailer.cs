using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.Net.Mail;

namespace DBNL.App.Models.Business.Emailing
{
    public class Emailer
    {

        public EmailTemplate template { get; set; }
        public Parameters parameters { get; set; }

        SmtpClient smtpClient;
        public virtual void PrepareParameter()
        {
            try
            {
                if (parameters == null) parameters = new Parameters();
                parameters.AddParameter("RootUrl", WebUtility.RootUrl);
            }
            catch (Exception ex)
            {

            }

        }
        public Emailer()
        {
            smtpClient = new SmtpClient();
            smtpClient.EnableSsl = smtpClient.Port != 25;
        }
        public void Send()
        {
            PrepareParameter();
            this.Send(this.parameters, this.template);
        }
        public void Send(Parameters para, EmailTemplate template)
        {
            try
            {

                template.Merge(para);
                smtpClient.Send(template.MailMessage);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }

}