/*
 * This is the class that handle site.master page
 * 
 */
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
using Qualitiva.GSEMART.Common;
using System.IO;
using Qualitiva.GSEMART.BusinessLayer;
using Qualitiva.GSEMART.BusinessObject;

public partial class site : System.Web.UI.MasterPage
{
    private bool boolLogon = false;

    /// <summary>
    /// OnLoad
    /// </summary>
    /// <param name="e">EventArgs</param>
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
        Page.Header.DataBind();
    }

    /// <summary>
    /// Page Load
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void Page_Load(object sender, EventArgs e)
    {

        #region Hit Counter
        this.ShowHitCounter();
        #endregion

        #region Google Analytics
        this.ShowGoogleAnalytics();
        #endregion
    }




    /// <summary>
    /// Function to show hit counter
    /// </summary>
    private void ShowHitCounter()
    {
        ulong HitCount;

        SiteHitCounter obj = new SiteHitCounter();
        string PageName = System.Web.HttpContext.Current.Request.Url.AbsolutePath;
        if (PageName.IndexOf("/content/") == -1 && !IsPostBack)
        {

            obj = SiteHitCounterAction.AddSiteHitCounter(obj);
        }
        obj = SiteHitCounterAction.GetSiteHitCount();

        // Get the hit counter and make it update every 7 hits
        HitCount = obj.HitCount;
        HitCount = HitCount - (HitCount % 7);

        lblHitCounter.Text = "Site Hit Count since launch: " + HitCount.ToString("###,###,###,###");
    }

    /// <summary>
    /// Function to determine if to show google analytics
    /// </summary>
    private void ShowGoogleAnalytics() {
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
