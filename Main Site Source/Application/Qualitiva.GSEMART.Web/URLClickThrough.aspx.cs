using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class URLClickThrough : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ShowGoogleAnalytics();

        if (Request.QueryString["url"] != null)
        {
            Response.Redirect(Request.QueryString["url"]);
        }

    }

    /// <summary>
    /// Function to determine if to show google analytics
    /// </summary>
    private void ShowGoogleAnalytics()
    {
        if (ConfigurationManager.AppSettings["site_type"] == "live")
        {
            this.pnGoogleAnalytics.Visible = true;
        }
        else
        {
            this.pnGoogleAnalytics.Visible = false;
        }
    }
}
