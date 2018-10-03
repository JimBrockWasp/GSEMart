/**
 * Emailing Class which responsible to handle all emailing processes
 * 
 */
 
using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Qualitiva.GSEMART.BusinessLayer;
using Qualitiva.GSEMART.BusinessObject;
using Qualitiva.GSEMART.Common;

public class EmailHelper
{
    #region Member Variables

    public static string strFromSystemEmail = ConfigurationManager.AppSettings["FromSystemEmail"];
    public static string strEmailSender = ConfigurationManager.AppSettings["FromEmail"];
    public static string strEmailBCC = ConfigurationManager.AppSettings["BCCEmail"];
    public static string strEmailSupport = ConfigurationManager.AppSettings["SupportEmail"];
    public static string strNewAdvertConfirmationEmailToAdmin = ConfigurationManager.AppSettings["NewAdvertConfirmationEmail"];
    public static string strRenewAdvertConfirmationEmailToAdmin = ConfigurationManager.AppSettings["RenewAdvertConfirmationEmail"];
    public static string strNewSellerAccountConfirmationEmailToAdmin = ConfigurationManager.AppSettings["NewSellerAccountConfirmationEmail"];
    
    private static string newAccountEmail;
    private static string NewAccountEmail
    {
        get
        {
            if (newAccountEmail == null)
            {
                EmailTemplate objEmailTemplate = EmailTemplateAction.GetEmailTemplate("New Account");
                newAccountEmail = objEmailTemplate.Text;
            }
            return newAccountEmail;
        }
    }

    private static string newTenderEmail;
    private static string NewTenderEmail
    {
        get
        {
            if (newTenderEmail == null)
            {
                EmailTemplate objEmailTemplate = EmailTemplateAction.GetEmailTemplate("New Tender");
                newTenderEmail = objEmailTemplate.Text;
            }
            return newTenderEmail;
        }
    }

    private static string forgottenPasswordEmail;
    private static string ForgottenPasswordEmail
    {
        get
        {
            if (forgottenPasswordEmail == null)
            {
                EmailTemplate objEmailTemplate = EmailTemplateAction.GetEmailTemplate("Forgotten Password");
                forgottenPasswordEmail = objEmailTemplate.Text;
            }
            return forgottenPasswordEmail;
        }
    }

    private static string resendConfirmationEmail;
    private static string ResendConfirmationEmail
    {
        get
        {
            if (resendConfirmationEmail == null)
            {
                EmailTemplate objEmailTemplate = EmailTemplateAction.GetEmailTemplate("Resend Confirmation");
                resendConfirmationEmail = objEmailTemplate.Text;
            }
            return resendConfirmationEmail;
        }
    }

    private static string newAdvertConfirmationEmail;
    private static string NewAdvertConfirmationEmail {
        get
        {
            if (newAdvertConfirmationEmail == null)
            {
                EmailTemplate objEmailTemplate = EmailTemplateAction.GetEmailTemplate("New Advert Confirmation");
                newAdvertConfirmationEmail = objEmailTemplate.Text;
            }
            return newAdvertConfirmationEmail;
        }
    }

    private static string renewAdvertConfirmationEmail;
    private static string RenewAdvertConfirmationEmail
    {
        get
        {
            if (renewAdvertConfirmationEmail == null)
            {
                EmailTemplate objEmailTemplate = EmailTemplateAction.GetEmailTemplate("Renew Advert Confirmation");
                renewAdvertConfirmationEmail = objEmailTemplate.Text;
            }
            return renewAdvertConfirmationEmail;
        }
    }

    #endregion

    #region Functions

    /// <summary>
    /// Sending Email to new registered user
    /// </summary>
    /// <param name="objAccount">Account</param>
    /// <param name="ConfirmationCode">Confirmation Code which generated</param>
    public static void SendNewAccountEmail(Account objAccount, string ConfirmationCode)
    {
        string text = string.Format(NewAccountEmail,
                                    objAccount.AccountId,
                                    objAccount.EmailAddress,
                                    objAccount.Password,
                                    Common.SellerUrl);


        EmailHelper.SendEmail(objAccount.EmailAddress, text, "Welcome to GSE-Mart.aero!");

        if (strNewSellerAccountConfirmationEmailToAdmin == "true")
        {
            EmailHelper.SendEmail(strEmailBCC, text, "New Account Created");
        }

        AccountEmailHistory objAccountEmailHistory = new AccountEmailHistory();
        objAccountEmailHistory.AccountId = objAccount.AccountId;
        objAccountEmailHistory.DateSent = DateTime.Now;
        objAccountEmailHistory.EmailAddress = objAccount.EmailAddress;
        objAccountEmailHistory.Subject = "GSE-Mart Account Information";
        objAccountEmailHistory.Message = text;
        
    }


    public static void SendNewTenderEmail(Tender objTender)
    {

        string tenderEmail = string.Format(NewTenderEmail, objTender.TenderId);
        EmailHelper.SendEmail(objTender.EmailAddress, tenderEmail, "New Tender Created");   

        string text = string.Format("New Tender Created TenderId:{0} - Email: {1}", objTender.TenderId.ToString(), objTender.EmailAddress);
        EmailHelper.SendEmail(strEmailBCC, text, "Tender Created");
    }



    
    /// <summary>
    /// Function to send Error email to system support team
    /// </summary>
    /// <param name="subject">Email Subject</param>
    /// <param name="ex">Exception</param>
    public static void SendErrorEmail(string strEmailSubject, Exception ex)
    {
        Communication.SendEmail(strEmailSender, strEmailSupport, strEmailSubject, ex.ToString());
    }

    /// <summary>
    /// Function to send Support email to system support team
    /// </summary>
    /// <param name="subject">Email Subject</param>
    /// <param name="message">Email body message</param>
    public static void SendSupportEmail(string strEmailSubject, string strEmailBody)
    {
        Communication.SendEmail(strFromSystemEmail, strEmailSupport, strEmailSubject, strEmailBody);
    }

    /// <summary>
    /// General function for sending email
    /// </summary>
    /// <param name="to">Receiver email address</param>
    /// <param name="strEmailBody">Email body content</param>
    /// <param name="strSubject">Email Subject</param>
    public static void SendEmail(string strEmailReceiver, string strEmailBody, string strEmailSubject)
    {
        Communication.SendEmail(strEmailSender, strEmailReceiver, null, null, strEmailSubject, strEmailBody);
    }

    #endregion
}
