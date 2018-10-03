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

public partial class tc : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AccountId"] != null)
        {
            Session.Abandon();
            Common.LogoutUser();
            Session["AccountId"] = null;
            Session["UserFullName"] = null;
            Session["AccountEmailAddress"] = null;
            Session["AccountStatus"] = null;
        }
    }
}
