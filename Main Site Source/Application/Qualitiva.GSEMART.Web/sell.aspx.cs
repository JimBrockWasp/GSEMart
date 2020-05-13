using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Qualitiva.GSEMART.BusinessLayer;
using Qualitiva.GSEMART.BusinessObject;
using Qualitiva.GSEMART.Common;
using Qualitiva.GSEMART.BusinessObject.Enum;

public partial class sellerHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        Page.Title = Common.GetPageTitle();
       
    
    }

    protected void btnCreateAccount_Click(object sender, EventArgs e)
    {

        Account objAccount = new Account();
        AccountType objAccountType = new AccountType();
        string confirmationCode = "";
            
        try
        {

            string emailAddress = txtLoginEmail.Text.Trim();
            if (!validateEmail(emailAddress))
            {
                return;
            }



            objAccount.FullName = "";
            objAccount.LastName = "";
            objAccount.CompanyName = "";
            objAccount.Address = "";
            objAccount.PostCode = "";
            objAccount.City = "";


            objAccount.EmailAddress = txtLoginEmail.Text;
            State objState = new State();
            objState.StateId = "-1";
            objAccount.State = objState;

            objAccount.Country.CountryId = "US";
            objAccount.Telephone = "";
            objAccount.Fax = "";
            objAccount.Mobile = "";
            objAccount.SalesCode = "";
            objAccount.VATNumber = "";
            objAccount.VATNumberStatus.VATNumberStatusId = VATNumberStatusLookup.PendingVerification;
            objAccount.Discount = 0;
            
            objAccount.Password = txtLoginPassword.Text;
            objAccount.AccountStatus.AccountStatusId = AccountStatusLookup.Confirmed;
            objAccount.AgreedTCYN = true;
            objAccountType.AccountTypeId = (int)AccountTypeEnum.ComplementaryAccount;
            objAccount.AccountType = objAccountType;
            

            objAccount = AccountAction.AddAccount(objAccount, "nocode");
            ctlNotifier.intResponseCode = objAccount.RespCode;
            ctlNotifier.strResponse = objAccount.RespDesc;

        }
        catch (Exception ex)
        {
            ctlNotifier.intResponseCode = 1;
            ctlNotifier.strResponse = "An error occured while creating Account." + ex.Message;
            EmailHelper.SendErrorEmail("An error occured while creating Account for " + txtLoginEmail.Text + ". Support has been notified.", ex);
        }



        if (ctlNotifier.intResponseCode == 0)
        {
            try
            {
                EmailHelper.SendNewAccountEmail(objAccount, confirmationCode);
            }
            catch (Exception ex)
            {
                EmailHelper.SendErrorEmail("An error occured while sending new account creation mail to " + objAccount.EmailAddress + ".", ex);
            }
            finally
            {

                Response.Redirect("Success.aspx");

                /*
                string sellerURL = ConfigurationManager.AppSettings["sellerURL"];

                // Navigate to the sellers area
                Response.Redirect(sellerURL);
                */
            }
        }

    }


    protected void lnkSellerArea_Click(object sender, EventArgs e)
    {

        string sellerURL = ConfigurationManager.AppSettings["sellerURL"];

        // Navigate to the sellers area
        Response.Redirect(sellerURL);


    }

    private bool validateEmail(string emailAddress)
    {
        if (AccountAction.IsEmailExist(emailAddress))
        {
            cuvtxtEmailAddress.IsValid = false;
            return false;
        }

        return true;
    }


}
