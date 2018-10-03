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

public partial class SeeFullImage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["aiid"] != null)
        {
            imgFullSize.ImageUrl = string.Format("~/ShowImageHandler.ashx?ai={0}&thumb=10", Request.QueryString["aiid"].ToString());
        }
    }
   
}
