/**
 * This classes is to handle advertisement details
 * 
 */
using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using Qualitiva.GSEMART.BusinessLayer;
using Qualitiva.GSEMART.BusinessObject;
using Qualitiva.GSEMART.Common;

public partial class ctl_Advert : System.Web.UI.UserControl
{
    private string _GUID;

    public string GUID
    {
        get { return _GUID; }
        set { _GUID = value; }
    }

    /// <summary>
    /// Page Load
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void Page_Load(object sender, EventArgs e)
    {   
        hdnReferer.Value = "";
        hdnReferer.Value = "?" + Request.QueryString.ToString();

        if (Convert.ToInt32(Request.QueryString["myAdvert"]) == 1)
            lnkBackButton.Text = "&laquo; Back to My Advertisement";
        else if (Convert.ToInt32(Request.QueryString["myInvoice"]) == 1)
            lnkBackButton.Text = "&laquo; Back to My Invoice";
        else if (Convert.ToInt32(Request.QueryString["myEmbedded"]) == 1)
            lnkBackButton.Text = "&laquo; Back to List";


        if (Request.FilePath.Contains(URLConstant.AddAdvert.Replace("~/", "")) == true)
            lnkBackButton.Visible = false;
    }

    /// <summary>
    /// Show Advert Images
    /// </summary>
    /// <param name="objAdvert">Advert object</param>
    public void ShowAdvertPreview(Advert objAdvert)
    {

        // Keep track of the row being updated in the tables
        int Row = 1;

        try
        {


            if (Request.Url.AbsolutePath.Contains("content/seller/addAdverts.aspx") == false)
                lblItemName.Text = objAdvert.Title;
            else
                lblItemName.Text = "Step 5 : Preview - " + objAdvert.Title;
            lblPrice.Text = objAdvert.Price.ToString("##,###,###,###");
            //lblCategory.Text = objAdvert.Category.Description;
            lblShortDesc.Text = objAdvert.ShortDescription.Replace("\n", "<br />");
            lblLongDesc.Text = objAdvert.LongDescription.Replace("\n","<br />");
            //lblContactName.Text = objAdvert.ContactName;
            //lblTelephone.Text = objAdvert.Telephone;

            switch (objAdvert.Category.CategoryId)
            {
                case "GS":

                    bool started = false;
                    string forSale = "Used ";

                    if (objAdvert.NewYN == true)
                    {
                        forSale = "Brand New ";
                    }

                    if ((objAdvert.AdvertGSE.ForSaleYN == true))
                    {
                        forSale += "For Sale ";
                        started = true;
                    }

                    if ((objAdvert.AdvertGSE.ForRentYN == true)){
                        if (started == true)
                        {
                            forSale += ", ";
                        }
                        forSale += "For Rent ";
                        started = true;
                    }

                    if ((objAdvert.AdvertGSE.ForLeaseYN == true))
                    {
                        if (started == true)
                        {
                            forSale += ", ";
                        }
                        forSale += "For Lease";
                    }

                    if (objAdvert.NewYN == true)
                    {
                        imgNewUsed.ImageUrl = "../images/new2.jpg";

                    }
                    else
                    {
                        imgNewUsed.ImageUrl = "../images/used.jpg";
                    }


                    #region CompanyLogo
                    imgCompanyLogo.ImageUrl = string.Format("~/ShowImageHandler.ashx?AccountId={0}", objAdvert.AccountId.ToString());
                    #endregion

                    AddDetailRow(tblAdvertDetails, "GSE Type:", objAdvert.AdvertGSE.GSETypeDescription, Row, 0);
                    AddDetailRow(tblAdvertDetails, "Offered:", forSale, Row , 1);
                    Row++;
                    AddDetailRow(tblAdvertDetails, "Availability:", objAdvert.AdvertGSE.AvailabilityDescription, Row, 0);
                    AddDetailRow(tblAdvertDetails, "Manufacturer:", objAdvert.AdvertGSE.Manufacturer, Row, 1);
                    Row++;

                    // Only display the qty and year for used equipment
                    if (objAdvert.NewYN == false)
                    {
                        AddDetailRow(tblAdvertDetails, "Quantity:", objAdvert.Quantity.ToString(), Row, 0);
                        AddDetailRow(tblAdvertDetails, "Year:", objAdvert.AdvertGSE.Year.ToString(), Row, 1);
                        Row++;

                    }

                    AddDetailRow(tblAdvertDetails, "Country:", objAdvert.Country.CountryName, Row, 0);
                    AddDetailRow(tblAdvertDetails, "Location:", objAdvert.Location, Row, 1);
                    Row++;

                    // A counter to increment the columns and rows to display the dynamic data 
                    int cnt = 0;

                    if (objAdvert.AdvertGSE.AdvertFeature.Count > 0)
                    {
                        
                       foreach (AdvertFeature objAdvertFeature in objAdvert.AdvertGSE.AdvertFeature)
                       {

                           if ((cnt % 2) ==0){
                               AddDetailRow(tblAdvertDetails, objAdvertFeature.Description + ":", objAdvertFeature.Value.ToString(), Row, 0);
                           }else{
                               AddDetailRow(tblAdvertDetails, objAdvertFeature.Description + ":", objAdvertFeature.Value.ToString(), Row, 1);
                               Row++;
                           }

                           cnt++;
                       }
                    }


                    if (objAdvert.AdvertDocuments.Count > 0)
                    {
                        foreach (AdvertDocument objAdvertDocument in objAdvert.AdvertDocuments)
                        {

                            TableRow tblRow = new TableRow();
                            TableCell tblCell = new TableCell();

                            tblCell.Style.Add("width", "100%");
                            tblCell.Text = "<a href='" + objAdvertDocument.VirtualPath + "' target='_blank'ss>" + objAdvertDocument.Title + "</a>";
                            tblRow.Cells.Add(tblCell);

                            tblDocuments.Rows.Add(tblRow);

                        }

                    }
                    else
                    {
                        tblDocuments.Visible = false;
                    }


                    break;

            }

            if (objAdvert.AdvertStatus.AdvertStatusId == "SL")
            {
                lblPrice.Text = ConfigurationManager.AppSettings["strTxtSold"].ToString();
                lblShortDesc.Text = "This Item is SOLD and is no longer available";
                tblMainAdvertTable.Visible = false;
            }
            else
            {
                if (objAdvert.ShowPriceYN)
                {
                    lblPrice.Text = objAdvert.Currency.Symbol + " " + Math.Round(objAdvert.Price, 0).ToString("##,###,###,###");
                }
                else
                {
                    lblPrice.Text = ConfigurationManager.AppSettings["strTxtHidePrice"].ToString();
                }
            }

            #region Contacts

            Row = 1;
            AddDetailRow(tblContactDetails, "Contact:", objAdvert.ContactName, Row, 0);
            AddDetailRow(tblContactDetails, "Telephone:", objAdvert.Telephone, Row, 1);
            Row++;

            AddDetailRow(tblContactDetails, "Email:", "<a href='mailto:" + objAdvert.EmailAddress + "?Subject=" + objAdvert.Title + " (Your advert #" + objAdvert.AdvertId.ToString() + " at www.GSE-Mart.aero)" + "'>Email Seller</a>", Row, 0);

            string strUrl = objAdvert.URL;
            //AddDetailRow(tblContactDetails, "Website:", "<a href='" + ResolveUrl("~/ClickThrough.aspx") + "?id=" + objAdvert.AdvertId.ToString() + "&url=" + Server.UrlEncode(strUrl) + "' target='_blank'>Visit Web Site</a>", Row, 1);
            AddDetailRow(tblContactDetails, "Website:", "<a href='"+ strUrl + "' target='_blank'>Visit Web Site</a>", Row, 1);
            Row++;

            if (objAdvert.ASAMemberYN == true)
            {

                string imageroot;

                if (Convert.ToInt32(Request.QueryString["myAdvert"]) == 1 || Convert.ToInt32(Request.QueryString["myInvoice"]) == 1 || Convert.ToInt32(Request.QueryString["myembedded"]) == 1)
                {
                    imageroot ="../../";
                }
                else
                {
                    imageroot = "";
                }
                AddDetailRow(tblContactDetails, "", "<img src='" + imageroot + "images/companylogos/logoASASmall.jpg' style='height:30px' />", Row, 0);
            }
            #endregion




            this.fillImageGrid(objAdvert.AdvertImage);
        }
        catch (Exception ex)
        {
                throw new Exception(ex.ToString());
        }
    }

    /// <summary>
    /// Fill up the image grid
    /// </summary>
    /// <param name="lstImages">List of AdvertImage objects</param>
    private void fillImageGrid(List<AdvertImage> lstImages)
    {
        Session["objAdvertImages_" + GUID] = lstImages;
        if (lstImages.Count > 0)
        {
            lblClickImageNote.Visible = true;
            dataLstImages.DataSource = lstImages;
            dataLstImages.DataBind();
        }
        else
        {
            imgDefault.ImageUrl = string.Format("~/ShowImageHandler.ashx?guid=" + GUID + "&ai={0}", "0");
        }
    }



    /// <summary>
    /// Event triggered when data item bound
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">RepeaterItemEventArgs</param>
    protected void dataLstImages_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                AdvertImage objAdvertImage = (AdvertImage)e.Item.DataItem;
                string advertImageId = objAdvertImage.AdvertImageId.ToString();

                if (objAdvertImage.IsDefaultYN)
                {
                    imgDefault.ImageUrl = string.Format("~/ShowImageHandler.ashx?guid=" + GUID + "&ai={0}", advertImageId);
                }

                Image imgThumb = (Image)e.Item.FindControl("imgThumb");
                HtmlAnchor imgThumbURL = (HtmlAnchor)e.Item.FindControl("imgThumbURL");
                
                imgThumb.ImageUrl = string.Format("~/ShowImageHandler.ashx?guid=" + GUID + "&ai={0}&thumb=1", advertImageId);
                imgThumbURL.HRef = "~/ShowImageHandler.ashx?guid=" + GUID + "&ai=" + advertImageId + "&thumb=10";
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.ToString());
        }
    }






    /// <summary>
    /// Event triggered when btnBack button is clicked
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnBack_Click(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Request.QueryString["myAdvert"]) == 1)
        {   
            Response.Redirect(URLConstant.MyAdvert + hdnReferer.Value, true);
        }
        else if (Convert.ToInt32(Request.QueryString["myInvoice"]) == 1)
        {
            Response.Redirect(URLConstant.MyInvoice + hdnReferer.Value, true);
        }
        else if (Convert.ToInt32(Request.QueryString["myembedded"]) == 1)
        {
            Response.Redirect(URLConstant.EmbeddedSearch + hdnReferer.Value, true);
        }
        else
        {
            Response.Redirect(URLConstant.Search + hdnReferer.Value, true);
        }
    }

    /// <summary>
    /// Add a row to the adverts details table
    /// </summary>
    /// <param name="header"></param>
    /// <param name="text"></param>
    private void zzAddDetailRow(Table tblDetail, string header, string text, int col)
    {

       
        TableRow tRow = new TableRow();
        tRow.Height = 25;

        TableCell tCell = new TableCell();
        tCell.CssClass = "header-label";
        tCell.Width = 100;
        tCell.Text = header;
        tCell.VerticalAlign = VerticalAlign.Middle;
        tRow.Cells.Add(tCell);

        tCell = new TableCell();
        tCell.VerticalAlign = VerticalAlign.Middle;
        tCell.Text = text;
        tRow.Cells.Add(tCell);
        tblDetail.Rows.Add(tRow);

    }
     /// <summary>
    /// Add a row to the adverts details table
    /// </summary>
    /// <param name="header"></param>
    /// <param name="text"></param>
    private void AddDetailRow(Table tblDetail, string header, string text,  int row, int col)
    {

        int ActualCol = 0;

        if ((col % 2) == 0)
        {
            ActualCol = 0;
        }
        else
        {
            ActualCol = 3;
        }

        if (text == "-1")
        {
            tblDetail.Rows[row].Cells[ActualCol + 1].Text = "&ltNot Specified&gt";
            tblDetail.Rows[row].Cells[ActualCol + 1].Font.Italic = true;
        }
        else
        {
            tblDetail.Rows[row].Cells[ActualCol + 1].Text = text;
        }

        tblDetail.Rows[row].Cells[ActualCol].Text = header;
    }

}
