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

public partial class ctl_Notifier : System.Web.UI.UserControl
{
    private int _intResponseCode=-1;
    private string _strResponse;
   
    public int intResponseCode
    {
        get { return _intResponseCode; }
        set { _intResponseCode = value; }
    }

    public string strResponse
    {
       
        get { return _strResponse; }
        set {   
          
            _strResponse = value;
            if (this.intResponseCode != -1)
            {
                tblMsg.Visible = true;
                if (this.intResponseCode == 0)
                {
                    
                    tblMsg.Attributes.Add("class", "tblSuccess");
                    imgMsg.ImageUrl = "../images/correct.gif";
                    lblMsg.CssClass = "lblSuccessMsg";
                }
                else
                {
                    tblMsg.Attributes.Add("class", "tblError");
                    imgMsg.ImageUrl = "../images/error.gif";
                    lblMsg.CssClass = "lblErrMsg";
                }
                lblMsg.Text = value;
            }
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        
       
    }
    
}
