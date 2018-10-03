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
    protected void Page_Load(object sender, EventArgs e)
    {

        DisplaySuppliers();

    }

    private void DisplaySuppliers()
    {

        List<Account> lstAccounts = AccountAction.GetAccountsWithAdverts();
        grdSuppliers.DataSource = lstAccounts;
        grdSuppliers.DataBind();


    }

    protected void DisplaySupplier(Object src, RepeaterItemEventArgs e)
    {
        
            Account rowView = (Account)e.Item.DataItem;

            /*
            // Hyperlink to account adverts
            
            Label lblCompanyName = (Label)e.Row.FindControl("lblCompanyName");
            lblCompanyName.Text = rowView.CompanyName;

            Label lblContact = (Label)e.Row.FindControl("lblContact");
            lblContact.Text = rowView.FullName + " " + rowView.LastName;

            Label lblTelephone = (Label)e.Row.FindControl("lblTelephone");
            lblTelephone.Text = rowView.Telephone;

            HyperLink hlEmail = (HyperLink)e.Row.FindControl("hlEmail");
            hlEmail.NavigateUrl = "mailto:" + rowView.EmailAddress;

            // Generate Hyperlink to Account adverts
            HyperLink hlWebsite = (HyperLink)e.Row.FindControl("hlWebsite");
            hlWebsite.NavigateUrl = rowView.CompanyWebsite;
            hlWebsite.Target = "_blank";
            */

            // Display the account Image
            Image accountImage = (Image)e.Item.FindControl("imgAccount");
            accountImage.ImageUrl = string.Format("~/ShowImageHandler.ashx?accountId={0}&thumb=2", rowView.AccountId);
            accountImage.ToolTip = "Click here see the company profile for " + rowView.CompanyName;

            HyperLink hlAccount = (HyperLink)e.Item.FindControl("hlAccount");
            hlAccount.NavigateUrl = "GSE-Supplier.aspx?acid=" + rowView.AccountId.ToString();

            /*
            Label lblProfile = (Label)e.Row.FindControl("lblProfile");
            lblProfile.Text = rowView.Profile;
            */
        
    }

}
