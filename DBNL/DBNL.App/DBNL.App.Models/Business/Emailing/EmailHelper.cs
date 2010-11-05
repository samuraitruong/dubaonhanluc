using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.IO;
using System.Net.Mail;
using System.Text;

/// <summary>
/// Summary description for EmailHelper
/// </summary>
/// 
namespace DBNL.App.Models.Business.Emailing
{
    public class EmailHelper
    {
        public EmailHelper()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public static void SendMailFromAdmin(string MailTo, string Title, string Msg)
        {
            MailMessage mailMsg = new MailMessage();
            try
            {
                MailAddress fromAdd = new MailAddress(Constants.EMAIL_USERNAME, "Web Admin");
                mailMsg.From = fromAdd;
                mailMsg.Subject = Title;
                mailMsg.IsBodyHtml = true;
                mailMsg.Body = Msg;
                mailMsg.To.Add(new MailAddress(MailTo));
                mailMsg.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
                mailMsg.BodyEncoding = Encoding.UTF8;
                mailMsg.SubjectEncoding = Encoding.UTF8;

                SmtpClient smtpClt = new SmtpClient();
                smtpClt.Host = Constants.EMAIL_HOST;
                smtpClt.Port = int.Parse(Constants.EMAIL_PORT);
                smtpClt.Credentials = new System.Net.NetworkCredential(Constants.EMAIL_USERNAME, Constants.EMAIL_PASSWORD);
                //smtpClt.EnableSsl = bool.Parse(Constants.EMAIL_ENABLESSL);
                smtpClt.Send(mailMsg);
            }
            catch (Exception ex)
            {
                throw ex;
                //Msg.InnerHtml = ex.Message;
            }
        }
    }
}