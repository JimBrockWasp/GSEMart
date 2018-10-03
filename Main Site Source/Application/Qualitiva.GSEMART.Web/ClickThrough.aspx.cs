using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Qualitiva.GSEMART.BusinessLayer;

public partial class ClickThrough : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        

        if (Request.QueryString["id"] != null && Request.QueryString["url"] != null)
        {
            int AdvertId = Convert.ToInt32(Request.QueryString["id"]);
            string URL = Request.QueryString["url"].ToString();
            URL = Server.UrlDecode(URL);
            AdvertAction.UpdateURLClickThrough(AdvertId);

            Response.Redirect(URL);
        }
    }
}
