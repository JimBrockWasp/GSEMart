using System;
using System.Collections.Generic;
using System.Text;
using System.Net.Mail;
using System.Net;
using System.Configuration;

namespace Qualitiva.GSEMART.Common
{
   public class Communication
    {
        public static void SendEmail(string from, string to, string subject, string body)
        {
            SendEmail(from, to, null, null, subject, body, null);
        }

        public static void SendEmail(string from, string to, string cc, string bcc, string subject, string body)
        {
            SendEmail(from, to, cc, bcc, subject, body, null);
        }

        public static void SendEmail(string from, string to, string cc, string bcc, string subject, string body, params Attachment[] attachments)
        {
            MailMessage message = new MailMessage(from, to, subject, body);
            if (!string.IsNullOrEmpty(cc))
            {
                message.CC.Add(cc);
            }
            if (!string.IsNullOrEmpty(bcc))
            {
                message.Bcc.Add(bcc);
            }
            if (attachments != null)
            {
                foreach (Attachment attachment in attachments)
                {
                    message.Attachments.Add(attachment);
                }
            }

            // Only Send an email if this is the live site
            if (ConfigurationManager.AppSettings["site_type"] == "live")
            {
                SmtpClient smtpClient = new SmtpClient();
                smtpClient.Send(message);
            }
        }
    }
}
