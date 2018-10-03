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
using Qualitiva.GSEMART.BusinessObject;
using System.Collections.Generic;
using Qualitiva.GSEMART.BusinessLayer;

public partial class contactus : System.Web.UI.Page
{

    private int AccountId;
    private Account ThisAccount;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.QueryString["acid"] != null && Request.QueryString["acid"] != "")
        {
            AccountId = Convert.ToInt32(Request.QueryString["acid"]);
        }

        DisplaySupplier();
    }

    
    protected void DisplaySupplier()
    {
            
        Account ThisAccount = AccountAction.GetAccountById(AccountId);

        hlAccount.NavigateUrl = "GSE-Search.aspx?acid=" + ThisAccount.AccountId.ToString();
        // lblCompanyName.Text = ThisAccount.CompanyName;
        lblContact.Text = ThisAccount.FullName + " " + ThisAccount.LastName;
        lblTelephone.Text = ThisAccount.Telephone;
        hlEmail.NavigateUrl = "mailto:" + ThisAccount.EmailAddress;

        // Generate Hyperlink to Account adverts
        hlWebsite.NavigateUrl = ThisAccount.CompanyWebsite;
        hlWebsite.Target = "_blank";

        // Display the account Image
        imgAccount.ImageUrl = string.Format("~/ShowImageHandler.ashx?accountId={0}&thumb=2", ThisAccount.AccountId);
        imgAccount.ToolTip = "Click here to display all adverts for " + ThisAccount.CompanyName;

        if (ThisAccount.Profile == "")
        {
            divProfile.Visible = false;

        }
        else
        {
            lblProfile.Text = ThisAccount.Profile;
        }


    }

    protected void cmdDisplayAdverts_Click(object sender, EventArgs e)
    {

        string searchPageURL = "GSE-Search.aspx?acid=" + ThisAccount.AccountId.ToString();
        Response.Redirect(searchPageURL);

    }
}
