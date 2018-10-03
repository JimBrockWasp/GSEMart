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


public partial class Embedded : System.Web.UI.Page
{

    private string strQuery = String.Empty;
    private string CountryId = String.Empty;
    private string RegionId = String.Empty;
    private string strCategoryId = String.Empty;
    private string GSETypeId = "0";
    private string ASAMembersOnlyYN = "false";

    private string NewYN = "true";
    private string UsedYN = "true";
    private string ForSaleYN = "true";
    private string ForRentYN = "true";
    private string ForLeaseYN = "true";

    private string QtyId1="";
    private string QtyValue1 = "0";
    private string QtyUnitId1 = "";

    private string QtyId2 = "";
    private string QtyValue2 = "0";
    private string QtyUnitId2 = "";

    private string SpecId1 = "";
    private string SpecOptionId1 = "";

    private string SpecId2 = "";
    private string SpecOptionId2 = "";

    private string SpecId3 = "";
    private string SpecOptionId3 = "";

    private string SortBy = "RA";
    private string strPageHeading = String.Empty;

    private string strQueryString = String.Empty;
    private string strSearchURL = String.Empty;

    private string Manufacturer = "";
    private string AccountId = "0";

    private int intTotalRec;
    private int page = 1;

    private int specValueCnt = 0;



    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Request.QueryString["gtid"] != null && Request.QueryString["gtid"] != "")
            {
                GSETypeId = Request.QueryString["gtid"];
            }

            if (Request.QueryString["acid"] != null && Request.QueryString["acid"] != "")
            {
                AccountId = Request.QueryString["acid"];
            }

            if (Request.QueryString["cnt"] != null)
            {
                CountryId = Request.QueryString["cnt"].ToString();
            }

            if (Request.QueryString["man"] != null)
            {
                Manufacturer = Request.QueryString["man"].ToString();
            }

            if (Request.QueryString["sort"] != null)
            {
                SortBy = Request.QueryString["sort"].ToString();
                //ddlSortById.SelectedValue = Request.QueryString["sort"].ToString();
            }


            if (Request.QueryString["newyn"] != null)
            {
                if (Request.QueryString["newyn"].ToString() != String.Empty)
                    NewYN = Request.QueryString["newyn"];
            }

            if (Request.QueryString["usedyn"] != null)
            {
                if (Request.QueryString["usedyn"].ToString() != String.Empty)
                    UsedYN = Request.QueryString["usedyn"];
            }

            if (Request.QueryString["FSYN"] != null)
            {
                if (Request.QueryString["FSYN"].ToString() != String.Empty)

                    ForSaleYN = Request.QueryString["FSYN"];
            }

            if (Request.QueryString["FRYN"] != null)
            {
                if (Request.QueryString["FRYN"].ToString() != String.Empty)

                    ForRentYN = Request.QueryString["FRYN"];
            }

            if (Request.QueryString["FLYN"] != null)
            {
                if (Request.QueryString["FLYN"].ToString() != String.Empty)

                    ForLeaseYN = Request.QueryString["FLYN"];
            }


            // Fill the appropriate controls depending on the GSE Type
            FillSpecValues(GSETypeId);

            //grdAdverts.Visible = true;
            this.Search();
        }

    }


    protected void Search()
    {

        try
        {

            List<Advert> lstAdvert = new List<Advert>();
            int rowPerPage = 1000;
            int rowStart = 0;
            int totalRecord = 0;


            //contruction the URL
            // todo:Jim
            //strQueryString = ResolveUrl(URLConstant.BuildAdsDetailURL(ddlCategoryId.SelectedValue.ToString(), ddlCountryId.SelectedValue.ToString(), Server.UrlEncode(strQuery), ddlSortById.SelectedValue.ToString(), Server.UrlEncode(strPageHeading), page, ddlGSEType.SelectedValue.ToString(), ddlASAMembersOnlyYN.Checked.ToString()));
            strSearchURL = ResolveUrl(URLConstant.BuildEmbeddedSearchURL(
                                        CountryId, GSETypeId,
                                        ASAMembersOnlyYN, SortBy, NewYN, UsedYN, ForRentYN, ForLeaseYN, ForSaleYN,
                                        QtyId1, QtyUnitId1, QtyValue1, QtyId2, QtyUnitId2, QtyValue2,
                                        SpecId1, SpecOptionId1,
                                        SpecId2, SpecOptionId2,
                                        SpecId3, SpecOptionId3,
                                        Manufacturer,
                                        AccountId,
                                        strPageHeading));

            strQueryString = ResolveUrl(URLConstant.BuildEmbeddedAdsDetailURL(
                                        CountryId, GSETypeId,
                                        ASAMembersOnlyYN, SortBy, NewYN, UsedYN, ForRentYN, ForLeaseYN, ForSaleYN,
                                        QtyId1, QtyUnitId1, QtyValue1, QtyId2, QtyUnitId2, QtyValue2,
                                        SpecId1, SpecOptionId1,
                                        SpecId2, SpecOptionId2,
                                        SpecId3, SpecOptionId3,
                                        Manufacturer,
                                        AccountId,
                                        strPageHeading));



            // Convert the selected value from the drop down into the parameteres required for the search
            switch (CountryId.Length)
            {
                case 2:
                    RegionId = "";
                    break;
                case 3:
                    RegionId = CountryId;
                    CountryId = "";
                    break;
                default:
                    CountryId = "";
                    RegionId = "";
                    break;

            }



            // If a GSEType has not been specified, don't do a search
            //if (GSETypeId != "0" && !String.IsNullOrEmpty(GSETypeId))
            if (!String.IsNullOrEmpty(Request.QueryString.ToString()))
            {

                lstAdvert = AdvertAction.GetAdvertByFilterSearch(
                    rowPerPage,
                    rowStart,
                    CountryId,
                    RegionId,
                    SortBy,
                    GSETypeId,
                    ASAMembersOnlyYN,
                    NewYN,
                    UsedYN,
                    ForRentYN,
                    ForLeaseYN,
                    ForSaleYN,
                    QtyId1,
                    QtyUnitId1,
                    QtyValue1,
                    QtyId2,
                    QtyUnitId2,
                    QtyValue2,
                    SpecId1,
                    SpecOptionId1,
                    SpecId2,
                    SpecOptionId2,
                    SpecId3,
                    SpecOptionId3,
                    Manufacturer,
                    AccountId,
                    out totalRecord);

                //Set Empty list message
                grdAdverts.EmptyDataText = "You search did not match any adverts. We would suggest to try with different criteria.";

                //Bind Grid   
                plSearchResults.Visible = true;
                grdAdverts.Visible = true;
                grdAdverts.PageIndex = page;
                grdAdverts.DataSource = lstAdvert;
                grdAdverts.DataBind();

                intTotalRec = totalRecord;

                // setting up the paging numbering
                // this.SetPaging(totalRecord, page, rowPerPage, strSearchURL);
            }
        }
        catch (Exception ex)
        {
                        
            
            ctlNotifier.intResponseCode = 1;
            ctlNotifier.strResponse = "An error occured while retrieving search results." + ex.ToString();
            
        }

    }

    private void FillSpecValues(string GSETypeId)
    {
        // Get the values from the query sting into the local variables
        if (Request.QueryString["QV1"] != null && Request.QueryString["QV1"].ToString() != String.Empty)
        {
            QtyValue1 = Server.UrlDecode(Request.QueryString["QV1"].ToString());
        }
        if (Request.QueryString["QUId1"] != null && Request.QueryString["QUId1"].ToString() != String.Empty)
        {
            QtyUnitId1 = Server.UrlDecode(Request.QueryString["QUId1"].ToString());
        }
        if (Request.QueryString["QV2"] != null && Request.QueryString["QV2"].ToString() != String.Empty)
        {
            QtyValue2 = Server.UrlDecode(Request.QueryString["QV2"].ToString());
        }
        if (Request.QueryString["QUid2"] != null && Request.QueryString["QUid2"].ToString() != String.Empty)
        {
            QtyUnitId2 = Server.UrlDecode(Request.QueryString["QUid2"].ToString());
        }
        if (Request.QueryString["SOId1"] != null && Request.QueryString["SOId1"].ToString() != String.Empty)
        {
            SpecOptionId1 = Server.UrlDecode(Request.QueryString["SOId1"].ToString());
        }
        if (Request.QueryString["SOId2"] != null && Request.QueryString["SOId2"].ToString() != String.Empty)
        {
            SpecOptionId2 = Server.UrlDecode(Request.QueryString["SOId2"].ToString());
        }
        if (Request.QueryString["SOId3"] != null && Request.QueryString["SOId3"].ToString() != String.Empty)
        {
            SpecOptionId3 = Server.UrlDecode(Request.QueryString["SOId3"].ToString());
        }
    }
    protected void DisplayAdverts(Object src, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Advert rowView = (Advert)e.Row.DataItem;
            string advertId = rowView.AdvertId.ToString();
            string advertImageId = "0";


            specValueCnt = 0;

            if (rowView.AdvertImage.Count > 0)
            {
                advertImageId = rowView.AdvertImage[0].AdvertImageId.ToString();
                for (int i = 0; i < rowView.AdvertImage.Count; i++)
                {
                    if (rowView.AdvertImage[i].IsDefaultYN == true)
                    {
                        advertImageId = rowView.AdvertImage[i].AdvertImageId.ToString();
                        break;
                    }
                }
            }
            TableCellCollection myCells = e.Row.Cells;

            #region Images
            Image advertImage = (Image)e.Row.FindControl("imgAdvert");
            advertImage.ImageUrl = string.Format("~/ShowImageHandler.ashx?advertImageId={0}&thumb=2", advertImageId);
            advertImage.ToolTip = rowView.Title;
            #endregion

            #region NewUsedImage
            Image NewUsedImage = (Image)e.Row.FindControl("NewUsedImage");
            if (rowView.NewYN == true)
            {
                NewUsedImage.ImageUrl = "images/new2.jpg";

            }
            else
            {
                NewUsedImage.ImageUrl = "images/used.jpg";
            }
            #endregion


            #region Pricing and Label
            Label lblCurrency = (Label)e.Row.FindControl("lblCurrency");
            if (rowView.AdvertStatus.AdvertStatusId == "SL")
            {
                lblCurrency.Text = ConfigurationManager.AppSettings["strTxtSold"].ToString();
            }
            else
            {
                if (rowView.ShowPriceYN)
                {
                    lblCurrency.Text = rowView.Currency.Symbol + " " + Math.Round(rowView.Price, 0).ToString("###,###,###,###");
                }
                else
                {
                    lblCurrency.Text = ConfigurationManager.AppSettings["strTxtHidePrice"].ToString();
                }
            }
            #endregion

            #region Specifications

            if (rowView.AdvertGSE.QtyDescription1 != "")
            {
                FillNextSpecValue(rowView.AdvertGSE.QtyDescription1.ToString() + ':', rowView.AdvertGSE.QtyValue1.ToString(), rowView.AdvertGSE.QtyUnitDescription1.ToString(), e);
            }

            if (rowView.AdvertGSE.QtyDescription2 != "")
            {
                FillNextSpecValue(rowView.AdvertGSE.QtyDescription2.ToString() + ':', rowView.AdvertGSE.QtyValue2.ToString(), rowView.AdvertGSE.QtyUnitDescription1.ToString(), e);
            }

            if (!String.IsNullOrEmpty(rowView.AdvertGSE.SpecDescription1.ToString()))
            {

                FillNextSpecValue(rowView.AdvertGSE.SpecDescription1.ToString() + ':', rowView.AdvertGSE.SpecOptionDescription1.ToString(), "", e);
            }

            if (!String.IsNullOrEmpty(rowView.AdvertGSE.SpecDescription2.ToString()))
            {

                // Check for no engine because Mode is Not Self propelled
                if (!((rowView.AdvertGSE.SpecId1.Trim() == "MODE")
                    && (rowView.AdvertGSE.SpecId2.Trim() == "ENG")
                    && (rowView.AdvertGSE.SpecOptionId1.Trim() != "SELF")
                    && (string.IsNullOrEmpty(rowView.AdvertGSE.SpecOptionId2.Trim()))))
                {
                    FillNextSpecValue(rowView.AdvertGSE.SpecDescription2.ToString() + ':', rowView.AdvertGSE.SpecOptionDescription2.ToString(), "", e);
                }



            }

            if (!String.IsNullOrEmpty(rowView.AdvertGSE.SpecDescription3.ToString()))
            {

                FillNextSpecValue(rowView.AdvertGSE.SpecDescription3.ToString() + ':', rowView.AdvertGSE.SpecOptionDescription3.ToString(), "", e);
            }

            #endregion



            #region Quantity
            // Only display qty if used
            if (rowView.NewYN == false)
            {
                Label lblQuantity = (Label)e.Row.FindControl("lblQuantity");
                lblQuantity.Text = "Qty:" + rowView.Quantity.ToString();
            }
            #endregion

            #region Location / Country

            Label lblCountry = (Label)e.Row.FindControl("lblCountry");
            lblCountry.Text = rowView.Country.CountryName;

            Label lblLocation = (Label)e.Row.FindControl("lblLocation");
            lblLocation.Text = rowView.Location;

            Label lblAdvertId = (Label)e.Row.FindControl("lblAdvertId");
            lblAdvertId.Text = "AdvertId: " + rowView.AdvertId.ToString();

            #endregion

            #region AdvertId
            /*
            Label lblAdvertId = (Label)e.Row.FindControl("lblAdvertId");
            lblAdvertId.Text = "AdvertId: " + rowView.AdvertId.ToString();
             */
            #endregion

            #region CompanyLogo
            Image CompanyLogo = (Image)e.Row.FindControl("CompanyLogo");
            CompanyLogo.ImageUrl = string.Format("~/ShowImageHandler.ashx?AccountId={0}", rowView.AccountId.ToString());
            #endregion


            #region Contacts
            //Label lblContactName = (Label)e.Row.FindControl("lblContactName");



            Label lblTelephone = (Label)e.Row.FindControl("lblTelephone");
            Label lblEmail = (Label)e.Row.FindControl("lblEmail");

            PlaceHolder plEmail = (PlaceHolder)e.Row.FindControl("plEmail");
            PlaceHolder plASAMember = (PlaceHolder)e.Row.FindControl("plASAMember");

            //lblContactName.Text = rowView.Owner;
            lblTelephone.Text = rowView.Telephone;

            if (rowView.EmailAddress != "")
            {
                plEmail.Visible = true;
                lblEmail.Text = "<a href='mailto:" + rowView.EmailAddress + "?Subject=" + rowView.Title + " (Your advert #" + rowView.AdvertId.ToString() + " at www.GSE-Mart.aero)'>Email</a>";


            }
            else
            {
                plEmail.Visible = false;
            }

            if (rowView.ASAMemberYN == true)
            {
                plASAMember.Visible = true;
            }
            else
            {
                plASAMember.Visible = false;
            }

            #endregion

            HyperLink hlAdTitle1 = (HyperLink)e.Row.FindControl("hlAdTitle1");
            HyperLink hlAdTitle2 = (HyperLink)e.Row.FindControl("hlAdTitle2");
            hlAdTitle1.NavigateUrl = strQueryString + "&id=" + rowView.AdvertId.ToString();
            hlAdTitle2.NavigateUrl = hlAdTitle1.NavigateUrl;
        }
    }

    /// <summary>
    /// Display the spec value in the next available position
    /// </summary>
    /// <param name="value">string</param>
    /// <returns>string</returns>
    private void FillNextSpecValue(string headingText, string valueText, string valueUnitDescription, GridViewRowEventArgs e)
    {


        // Set the local labels to any control to start
        Label lblHeading = (Label)e.Row.FindControl(""); ;
        Label lblValue = (Label)e.Row.FindControl("");

        // Reassign them 
        switch (specValueCnt)
        {

            case 0:
                lblHeading = (Label)e.Row.FindControl("lblSpecHeading1");
                lblValue = (Label)e.Row.FindControl("lblSpecValue1");
                break;

            case 1:
                lblHeading = (Label)e.Row.FindControl("lblSpecHeading2");
                lblValue = (Label)e.Row.FindControl("lblSpecValue2");
                break;

            case 2:
                lblHeading = (Label)e.Row.FindControl("lblSpecHeading3");
                lblValue = (Label)e.Row.FindControl("lblSpecValue3");
                break;

            case 3:
                lblHeading = (Label)e.Row.FindControl("lblSpecHeading4");
                lblValue = (Label)e.Row.FindControl("lblSpecValue4");
                break;

            default:
                break;

        }

        lblHeading.Text = headingText;
        lblHeading.Height = 30;

        if ((valueText == "-1") || (valueText == ""))
        {
            lblValue.Text = "&ltnot specified&gt";
            lblValue.Font.Italic = true;
        }
        else
        {
            lblValue.Text = valueText + " " + valueUnitDescription;
        }

        // Increment the counter
        specValueCnt++;

    }

    protected string FixCrLf(string value)
    {
        return Utilities.FixCrLf(value);
    }
}
