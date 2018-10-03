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
using System.Collections.Generic;
using System.Text;
using Qualitiva.GSEMART.BusinessLayer;
using Qualitiva.GSEMART.BusinessObject;
using Qualitiva.GSEMART.Common;

public partial class EmbeddedAdDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {

                if (Request.QueryString["id"] != null)
                {
                    int advertId = Convert.ToInt32(Request.QueryString["id"]);

                    Advert objAdvert = AdvertAction.GetAdvertById(advertId);
                    objAdvert.AdvertImage = AdvertAction.GetAdvertImageByAdvertId(advertId);
                    objAdvert.AdvertDocuments = AdvertAction.GetAdvertDocuments(advertId);

                    ctAdvert.GUID = System.Guid.NewGuid().ToString();
                    ctAdvert.ShowAdvertPreview(objAdvert);

                    //update the advert.counter values
                    AdvertAction.SetAdvertCounter(advertId);

                    lblAdvertId.Text = "Advert ID : " + advertId.ToString();
                    lblCounter.Text = (objAdvert.Counter + 1).ToString();

                    //Constructing the page title
                    // Master.Page.Title = objAdvert.Title + " - " + objAdvert.Category.Description + " - GSE-Mart.aero";
                }
            }
        }
        catch (Exception ex)
        {
            ctlNotifier.intResponseCode = 1;
            ctlNotifier.strResponse = ex.ToString();
        }
    }
}
