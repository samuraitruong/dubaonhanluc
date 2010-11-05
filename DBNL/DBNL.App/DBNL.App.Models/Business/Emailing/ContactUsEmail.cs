using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DBNL.App.Config;

/// <summary>
/// Summary description for ConnectionEmail
/// </summary>
/// 
namespace DBNL.App.Models.Business.Emailing
{
    public class ContactUsEmail : Emailer
    {


        public ContactUsEmail(string name, string email, string phone,  string address, string company, string subject, string message)
        {
            parameters = new Parameters();
            parameters.AddParameter("From", email);
            parameters.AddParameter("Name", name);
            parameters.AddParameter("Phone", phone);
            parameters.AddParameter("To", DBNLConfigurationManager.Emails.ContactFormEmailAddress);
            parameters.AddParameter("Body", message);
            parameters.AddParameter("Subject", subject);
            parameters.AddParameter("Company", company);
            parameters.AddParameter("Address", address);
            template = new EmailTemplate(HttpContext.Current.Server.MapPath("~/App_Data/EmailTemplates/ContactUsTemplate.xml"));
        }

        public static void Send(string name, string email, string phone, string address, string company, string subject, string message)
        {
            ContactUsEmail mailer = new ContactUsEmail(name, email, phone, address, company, subject, message);
            mailer.Send();
        }
        public ContactUsEmail()
        {

            //
            // TODO: Add constructor logic here
            //
        }


    }
}