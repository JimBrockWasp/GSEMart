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

public partial class newSearchAdverts : System.Web.UI.Page
{
    private string strQuery = String.Empty;
    private string CountryId = String.Empty;
    private string RegionId = String.Empty;
    private string strCategoryId = String.Empty;
    private string GSETypeId = "0";
    private string ASAMembersOnlyYN = "false";

    private string NewYN;
    private string UsedYN;
    private string ForSaleYN;
    private string ForRentYN;
    private string ForLeaseYN;

    private string QtyId1;
    private string QtyValue1;
    private string QtyUnitId1;

    private string QtyId2;
    private string QtyValue2;
    private string QtyUnitId2;

    private string SpecId1;
    private string SpecOptionId1;

    private string SpecId2;
    private string SpecOptionId2;

    private string SpecId3;
    private string SpecOptionId3;

    private string SortBy = "RA";
    private string strPageHeading = String.Empty;

    private string strQueryString = String.Empty;
    private string strSearchURL = String.Empty;

    private string Manufacturer;
    private string AccountId = "0";

    private int intTotalRec;
    private int page = 1;

    private int specValueCnt = 0;

    public PlaceHolder plFooterButtons = new PlaceHolder();

    /// <summary>
    /// Page Load
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (!String.IsNullOrEmpty(Request.QueryString.ToString()))
            {
                instructions.Visible = false;
            }

            this.ddlGSEType.Attributes.Add("OnChange", "SetVisibility()");
            this.SO8_1.Attributes.Add("OnChange", "SetEngineVisibility('SO8', '_1', '_2')");
            this.SO19_1.Attributes.Add("OnChange", "SetEngineVisibility('SO19', '_1', '_2')");
            this.SO25_2.Attributes.Add("OnChange", "SetEngineVisibility('SO25', '_2', '_3')");
            this.SO31_1.Attributes.Add("OnChange", "SetEngineVisibility('SO31', '_1', '_2')");
            this.chkNew.Items[1].Attributes.Add("OnClick", "SetASAOptionsVisibility()");

            // Get a list of accounts with adverts
            GetAccounts();   
        
            // Get a list of manufacturers
            GetManufacturers();
            
            if (Request.QueryString["asaonlyyn"] != null && Request.QueryString["asaonlyyn"] != "")
            {
                ASAMembersOnlyYN = Convert.ToString(Request.QueryString["asaonlyyn"]);
                if (Convert.ToBoolean(ASAMembersOnlyYN) == true)
                {
                    rdoASAMembersOnly.Items[1].Selected = true;
                }
                else
                {
                    rdoASAMembersOnly.Items[0].Selected = true;
                }
            }
            
            if (Request.QueryString["gtid"] != null && Request.QueryString["gtid"] != "")
            {
                GSETypeId = Request.QueryString["gtid"];
                ddlGSEType.SelectedValue = Request.QueryString["gtid"].ToString();
            }

            if (Request.QueryString["acid"] != null && Request.QueryString["acid"] != "")
            {
                AccountId = Request.QueryString["acid"];
                ddlSuppliers.SelectedValue = Request.QueryString["acid"].ToString();
            }

            if (Request.QueryString["cnt"] != null)
            {
                CountryId = Request.QueryString["cnt"].ToString();
                ddlCountryId.SelectedValue = Request.QueryString["cnt"].ToString();
            }

            if (Request.QueryString["man"] != null)
            {
                Manufacturer = Request.QueryString["man"].ToString();
                ddlManufacturer.SelectedValue = Request.QueryString["man"].ToString();
            }

            if (Request.QueryString["sort"] != null)
            {
                SortBy = Request.QueryString["sort"].ToString();
                //ddlSortById.SelectedValue = Request.QueryString["sort"].ToString();
            }

            if (Request.QueryString["heading"] != null)
            {
                if (Request.QueryString["heading"].ToString() != String.Empty)
                    strPageHeading = Server.UrlDecode(Request.QueryString["heading"].ToString());
            }

            if (Request.QueryString["page"] != null)
            {
                if (Request.QueryString["page"].ToString() != String.Empty)
                    page = Convert.ToInt32(Request.QueryString["page"]);
            }

            if (Request.QueryString["newyn"] != null)
            {
                if (Request.QueryString["newyn"].ToString() != String.Empty)
                    chkNew.Items[0].Selected = Convert.ToBoolean(Request.QueryString["newyn"]);
            }

            if (Request.QueryString["usedyn"] != null)
            {
                if (Request.QueryString["usedyn"].ToString() != String.Empty)
                    chkNew.Items[1].Selected = Convert.ToBoolean(Request.QueryString["usedyn"]);
            }

            if (Request.QueryString["FSYN"] != null)
            {
                if (Request.QueryString["FSYN"].ToString() != String.Empty)

                    chkSaleOptions.Items[0].Selected = Convert.ToBoolean(Request.QueryString["FSYN"]);
            }

            if (Request.QueryString["FRYN"] != null)
            {
                if (Request.QueryString["FRYN"].ToString() != String.Empty)

                    chkSaleOptions.Items[1].Selected = Convert.ToBoolean(Request.QueryString["FRYN"]);
            }

            if (Request.QueryString["FLYN"] != null)
            {
                if (Request.QueryString["FLYN"].ToString() != String.Empty)

                    chkSaleOptions.Items[2].Selected = Convert.ToBoolean(Request.QueryString["FLYN"]);
            }


            // Fill the appropriate controls depending on the GSE Type
            FillSpecValues(GSETypeId);

            //grdAdverts.Visible = true;
            this.Search();
        }
    }

    /// <summary>
    /// Event trigger when search button is clicked
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void btnSearch_Click(object sender, EventArgs e)
    {

        // Get the GSE Type Selected
        GSETypeId = ddlGSEType.SelectedValue.ToString();

        // Get the AccountId
        AccountId = ddlSuppliers.SelectedValue.ToString();

        // Get the qty and spec values from the screen controls based on the GSE Type
        GetSpecValues(GSETypeId);

        
        //Response.Redirect(URLConstant.BuildSearchURL(ddlCategoryId.SelectedValue.ToString(), ddlCountryId.SelectedValue.ToString(), Server.UrlEncode(txtQuery.Text.ToString()), ddlSortById.SelectedValue.ToString(), Server.UrlEncode(strPageHeading), ddlGSEType.SelectedValue.ToString(), ddlASAMembersOnlyYN.Checked.ToString()));
        Response.Redirect(URLConstant.BuildSearchURL(
                            ddlCountryId.SelectedValue.ToString(),
                            ddlGSEType.SelectedValue.ToString(),
                            rdoASAMembersOnly.Items[1].Selected.ToString(),
                            SortBy,
                            chkNew.Items[0].Selected.ToString(),
                            chkNew.Items[1].Selected.ToString(),
                            chkSaleOptions.Items[0].Selected.ToString(),
                            chkSaleOptions.Items[1].Selected.ToString(),
                            chkSaleOptions.Items[2].Selected.ToString(),
                            QtyId1, QtyUnitId1, QtyValue1, QtyId2, QtyUnitId2, QtyValue2,
                            SpecId1, SpecOptionId1, 
                            SpecId2, SpecOptionId2,
                            SpecId3, SpecOptionId3,
                            ddlManufacturer.SelectedValue.ToString(),
                            ddlSuppliers.SelectedValue.ToString(),
                            strPageHeading));
    }

    /// <summary>
    /// Function to pass in all search parameters and make search
    /// </summary>
    protected void Search()
    {

        try
        {

            List<Advert> lstAdvert = new List<Advert>();
            int rowPerPage = 10;
            int rowStart = (page * rowPerPage) - rowPerPage + 1;
            int totalRecord = 0;

            // Get the value from the country drop down
            CountryId=ddlCountryId.SelectedValue.ToString();

            // Get the manufacturer from the drop down
            Manufacturer = ddlManufacturer.SelectedValue.ToString();

            // Default these values for now
            SortBy ="";
            ASAMembersOnlyYN = rdoASAMembersOnly.Items[1].Selected.ToString();
                         
            
            NewYN  = chkNew.Items[0].Selected.ToString();
            UsedYN = chkNew.Items[1].Selected.ToString();

            ForSaleYN  =chkSaleOptions.Items[0].Selected.ToString();
            ForRentYN  =chkSaleOptions.Items[1].Selected.ToString();
            ForLeaseYN =chkSaleOptions.Items[2].Selected.ToString();

            GSETypeId = ddlGSEType.SelectedValue.ToString();
            AccountId = ddlSuppliers.SelectedValue.ToString();

            // Get the qty and spec values from the screen controls based on the GSE Type
            GetSpecValues(GSETypeId);

            //contruction the URL
            // todo:Jim
            //strQueryString = ResolveUrl(URLConstant.BuildAdsDetailURL(ddlCategoryId.SelectedValue.ToString(), ddlCountryId.SelectedValue.ToString(), Server.UrlEncode(strQuery), ddlSortById.SelectedValue.ToString(), Server.UrlEncode(strPageHeading), page, ddlGSEType.SelectedValue.ToString(), ddlASAMembersOnlyYN.Checked.ToString()));
            strSearchURL = ResolveUrl(URLConstant.BuildSearchURL(
                                        CountryId, GSETypeId, 
                                        ASAMembersOnlyYN, SortBy, NewYN, UsedYN, ForRentYN, ForLeaseYN, ForSaleYN,
                                        QtyId1, QtyUnitId1, QtyValue1, QtyId2, QtyUnitId2, QtyValue2,
                                        SpecId1, SpecOptionId1, 
                                        SpecId2, SpecOptionId2,
                                        SpecId3, SpecOptionId3,
                                        Manufacturer,
                                        AccountId, 
                                        strPageHeading));

            strQueryString = ResolveUrl(URLConstant.BuildAdsDetailURL(
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

                //setting up the paging numbering
                this.SetPaging(totalRecord, page, rowPerPage, strSearchURL);
            }
        }
        catch (Exception ex)
        {
            ctlNotifier.intResponseCode = 1;
            ctlNotifier.strResponse = "An error occured while retrieving search results." + ex.ToString();
        }

    }

    /// <summary>
    /// Function to pass in parameters and generate paging numbering
    /// </summary>
    /// <param name="totalRow">Total no of records searched</param>
    /// <param name="intCurrentPage">Current page number, start from 1</param>
    /// <param name="intRowPerPage">No of Row to display per page</param>
    /// <param name="strURL">current URL before appending page query string</param>
    private void SetPaging(int totalRow, int intCurrentPage, int intRowPerPage, string strURL)
    {
        string strPageShow = "";

        string pagingText = "";
        string strPageOf = "";
        string strPreviousPage = "";
        string strNextPage = "";

        int intTotalRow = totalRow;
        int intPageStart = 0;
        int intPageEnd = 0;

        double value = (double)intTotalRow / (double)intRowPerPage;
        int intNumberOfPage = Convert.ToInt32(Math.Ceiling(value));

        //if there is at least 1 records, means we only will have paging
        if (totalRow > 0)
        {
            //if there is more than 1 records, possiblw to show PREV and NEXT text
            if (totalRow > 1)
            {
                if (intCurrentPage != 1)
                    strPreviousPage = " <a href=" + strURL + "&page=" + (intCurrentPage - 1) + ">Prev</a> | ";

                if (intCurrentPage != intNumberOfPage)
                    strNextPage = " <a href=" + strURL + "&page=" + (intCurrentPage + 1) + ">Next</a> ";
            }

            //constructing the first value to show on paging numbering
            if (intCurrentPage <= 6)
            {
                intPageStart = 1;
            }
            else if (intCurrentPage >= 7 && intNumberOfPage <= 10)
            {
                intPageStart = 1;
            }
            else if (intNumberOfPage - intCurrentPage <= 3)
            {
                intPageStart = intNumberOfPage - 9;
            }
            else
            {
                intPageStart = intCurrentPage - 5;
            }

            //display page showing text
            strPageShow = "Displaying  <font class='highlight'>" + ((intCurrentPage * intRowPerPage) - intRowPerPage + 1) + "</font> to <font class='highlight'>" + ((intCurrentPage * intRowPerPage) > totalRow ? totalRow : (intCurrentPage * intRowPerPage)) + "</font> of <font class='highlight'>" + totalRow + "</font> Advertisements";

            //display page of text
            if (intNumberOfPage > 1)
                strPageOf = " [Page " + intCurrentPage + " of " + intNumberOfPage + "] | ";
            else
                strPageOf = " [Page " + intCurrentPage + " of " + intNumberOfPage + "] ";

            //constructing the last value to show on paging numbering
            if (intCurrentPage <= 6)
            {
                if (intNumberOfPage > 10)
                {
                    intPageEnd = 10;
                }
                else
                {
                    intPageEnd = intNumberOfPage;
                }
            }
            else if (intNumberOfPage - intCurrentPage <= 3)
            {
                intPageEnd = intNumberOfPage;
            }
            else
            {
                intPageEnd = intCurrentPage + 4;
            }

            if (intPageStart != intPageEnd)
            {
                //displaying all the paging numbering
                for (int i = intPageStart; i <= intPageEnd; i++)
                {
                    if (i == intCurrentPage)
                    {
                        pagingText = pagingText + " " + i + " | ";
                    }
                    else
                    {
                        pagingText = pagingText + "<a href='" + strURL + "&page=" + i + "'>" + i + "</a> | ";
                    }
                }
            }

            lblPagingDescTop.Text = strPageShow;
            lblPagingTop.Text = strPageOf + strPreviousPage + pagingText + strNextPage;

            lblPagingBottom.Text = strPageOf + strPreviousPage + pagingText + strNextPage;
        }
    }

    /// <summary>
    /// Display Adverts on the gridview
    /// </summary>
    /// <param name="src">Object</param>
    /// <param name="e">GridViewRowEventArgs</param>
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
            else {
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

            if (!String.IsNullOrEmpty (rowView.AdvertGSE.SpecDescription1.ToString()))
            {

                FillNextSpecValue(rowView.AdvertGSE.SpecDescription1.ToString() + ':', rowView.AdvertGSE.SpecOptionDescription1.ToString(), "", e);
            }

            if (!String.IsNullOrEmpty(rowView.AdvertGSE.SpecDescription2.ToString()))
            {
  
                // Check for no engine because Mode is Not Self propelled
                if (!((rowView.AdvertGSE.SpecId1.Trim() == "MODE")
                    && (rowView.AdvertGSE.SpecId2.Trim() == "ENG")
                    && (rowView.AdvertGSE.SpecOptionId1.Trim() != "SELF")
                    && (string.IsNullOrEmpty (rowView.AdvertGSE.SpecOptionId2.Trim()))))
            
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
                lblEmail.Text = "<a href='mailto:" + rowView.EmailAddress + "?Subject=" + rowView.Title + " (Your advert #" +rowView.AdvertId.ToString() + " at www.GSE-Mart.aero)'>Email</a>";

            
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
        Label lblHeading = (Label)e.Row.FindControl("");;
        Label lblValue = (Label)e.Row.FindControl("");

        // Reassign them 
        switch (specValueCnt){

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


    /// <summary>
    /// Function to fix readline issue
    /// </summary>
    /// <param name="value">string</param>
    /// <returns>string</returns>
    protected string FixCrLf(string value)
    {
        return Utilities.FixCrLf(value);
    }

    /// <summary>
    /// Get the search parameters from the screen controls depending on the GSEType
    /// </summary>
    /// <param name="GSETypeId"></param>
    private void GetSpecValues(string GSETypeId)
    {

        QtyId1 = ""; QtyUnitId1 = ""; QtyValue1 = "0";
        QtyId2 = ""; QtyUnitId2 = ""; QtyValue2 = "0";
        SpecId1 = ""; SpecOptionId1 = "";
        SpecId2 = ""; SpecOptionId2 = "";
        SpecId3 = ""; SpecOptionId3 = "";

        switch (GSETypeId)
        {
            case "1":
                QtyId1 = "PPM"; QtyUnitId1 = "PPM"; QtyValue1 = Q1_1.Text;
                QtyId2 = "PSI"; QtyUnitId2 = "PSI"; QtyValue2 = Q1_2.Text;
                SpecId1 = "MODE"; SpecOptionId1 = SO1_1.SelectedValue.ToString();
                break;

            case "2":
                QtyId1 = "TONS"; QtyUnitId1 = "TON"; QtyValue1 = Q2_1.Text;
                QtyId2 = "PPM"; QtyUnitId2 = "PPM"; QtyValue2 = Q2_2.Text;
                SpecId1 = "MODE"; SpecOptionId1 = SO2_1.SelectedValue.ToString();
                break;

            case "3":
                QtyId1 = "BTU"; QtyUnitId1 = "BTU"; QtyValue1 = Q3_1.Text;
                QtyId2 = "PPM"; QtyUnitId2 = "PPM"; QtyValue2 = Q3_2.Text;
                SpecId1 = "MODE"; SpecOptionId1 = SO3_1.SelectedValue.ToString();
                SpecId2 = "HENG"; SpecOptionId2 = SO3_2.SelectedValue.ToString();
                break;

            case "4":
                break;

            case "5":
                break;

            case "6":
                SpecId1 = "TYPE"; SpecOptionId1 = SO6_1.SelectedValue.ToString();
                break;

            case "7":
                QtyId1 = "PULL";
                if (QU7_1_1.Checked == true) QtyUnitId1 = "KN"; else QtyUnitId1 = "LBS";
                QtyValue1 = Q7_1.Text;

                SpecId1 = "ENG"; SpecOptionId1 = SO7_1.SelectedValue.ToString();
                break;

            case "8":
                QtyId1 = "HGHT"; 
                if (QU8_1_1.Checked == true) QtyUnitId1 = "MM"; else QtyUnitId1 = "FT";
                QtyValue1 = Q8_1.Text;

                QtyId2 = "BOOM"; 
                if (QU8_2_1.Checked == true) QtyUnitId2 = "MM"; else QtyUnitId2 = "FT"; 
                QtyValue2 = Q8_2.Text;

                SpecId1 = "MODE"; SpecOptionId1 = SO8_1.SelectedValue.ToString();
                SpecId2 = "ENG"; SpecOptionId2 = SO8_2.SelectedValue.ToString();
                break;


            case "9":
                QtyId1 = "HGHT"; 
                if (QU9_1_1.Checked == true) QtyUnitId1 = "MM"; else QtyUnitId1 = "FT";
                QtyValue1 = Q9_1.Text;

                SpecId1 = "TYPE"; SpecOptionId1 = SO9_1.SelectedValue.ToString();
                break;

            case "10":
                QtyId1 = "HGHT"; 
                if (QU10_1_1.Checked == true) QtyUnitId1 = "MM"; else QtyUnitId1 = "FT";
                QtyValue1 = Q10_1.Text;

                SpecId1 = "TYPE"; SpecOptionId1 = SO10_1.SelectedValue.ToString();
                break;

            case "11":
                QtyId1 = "PAYLD";
                if (QU11_1_1.Checked == true) QtyUnitId1 = "TON"; else QtyUnitId1 = "LBS";
                QtyValue1 = Q11_1.Text;

                SpecId1 = "ENG"; SpecOptionId1 = SO11_1.SelectedValue.ToString();
                break;

            case "12":
                QtyId1 = "HGHT";
                if (QU12_1_1.Checked == true) QtyUnitId1 = "MM"; else QtyUnitId1 = "FT";
                QtyValue1 = Q12_1.Text;
                break;

            case "13":
                SpecId1 = "ATYP"; SpecOptionId1 = SO13_1.SelectedValue.ToString();
                break;

            case "14":
                SpecId1 = "TYPE"; SpecOptionId1 = SO14_1.SelectedValue.ToString();
                break;

            case "15":
                break;

            case "16":
                break;

            case "17":
                QtyId1 = "CAPC";
                if (QU17_1_1.Checked == true) QtyUnitId1 = "KG"; else QtyUnitId1 = "LBS";
                QtyValue1 = Q17_1.Text;

                SpecId1 = "TYPE"; SpecOptionId1 = SO17_1.SelectedValue.ToString();
                SpecId2 = "ENG";  SpecOptionId2 = SO17_2.SelectedValue.ToString();
                break;

            case "18":
                QtyId1 = "CONV"; QtyUnitId1 = "HZ"; QtyValue1 = Q18_1.Text;
                SpecId1 = "MODE"; SpecOptionId1 = SO18_1.SelectedValue.ToString();
                break;

            case "19":
                SpecId1 = "MODE"; SpecOptionId1 = SO19_1.SelectedValue.ToString();
                SpecId2 = "ENG";  SpecOptionId2 = SO19_2.SelectedValue.ToString();
                break;

            case "20":
                QtyId1 = "POWER"; QtyUnitId1 = "KVA"; QtyValue1 = Q20_1.Text;
                SpecId1 = "VOLT"; SpecOptionId1 = SO20_1.SelectedValue.ToString();
                SpecId2 = "MODE"; SpecOptionId2 = SO20_2.SelectedValue.ToString();
                break;

            case "21":
                QtyId1 = "CAPC";
                if (QU21_1_1.Checked == true) QtyUnitId1 = "LTR"; else QtyUnitId1 = "GL";
                QtyValue1 = Q21_1.Text;

                SpecId1 = "MODE"; SpecOptionId1 = SO21_1.SelectedValue.ToString();
                break;

            case "22":
                QtyId1 = "PAYLD";
                if (QU22_1_1.Checked == true) QtyUnitId1 = "KG"; else QtyUnitId1 = "LBS";
                QtyValue1 = Q22_1.Text;

                SpecId1 = "ENG"; SpecOptionId1 = SO22_1.SelectedValue.ToString();
                break;

            case "23":
                QtyId1 = "PAYLD";
                if (QU23_1_1.Checked == true) QtyUnitId1 = "KG"; else QtyUnitId1 = "LBS";
                QtyValue1 = Q23_1.Text;

                SpecId1 = "ENG"; SpecOptionId1 = SO23_1.SelectedValue.ToString();
                break;

            case "24":
                QtyId1 = "HGHT";
                if (QU24_1_1.Checked == true) QtyUnitId1 = "MM"; else QtyUnitId1 = "FT";
                QtyValue1 = Q24_1.Text;

                SpecId1 = "MODE"; SpecOptionId1 = SO24_1.SelectedValue.ToString();
                break;

            case "25":
                QtyId1 = "HGHT";
                if (QU25_1_1.Checked == true) QtyUnitId1 = "MM"; else QtyUnitId1 = "FT";
                QtyValue1 = Q25_1.Text;

                SpecId1 = "TYPE"; SpecOptionId1 = SO25_1.SelectedValue.ToString();
                SpecId2 = "MODE"; SpecOptionId2 = SO25_2.SelectedValue.ToString();
                SpecId3 = "ENG";  SpecOptionId3 = SO25_3.SelectedValue.ToString();
                break;

            case "26":
                QtyId1 = "HGHT";
                if (QU26_1_1.Checked == true) QtyUnitId1 = "MM"; else QtyUnitId1 = "FT";
                QtyValue1 = Q26_1.Text;

                SpecId1 = "TYPE"; SpecOptionId1 = SO26_1.SelectedValue.ToString();
                SpecId2 = "MODE"; SpecOptionId2 = SO26_2.SelectedValue.ToString();
                break;

            case "27":
                break;

            case "28":
                SpecId1 = "TYPE"; SpecOptionId1 = SO28_1.SelectedValue.ToString();
                break;

            case "29":
                break;

            case "30":
                QtyId1 = "PAX"; QtyUnitId1 = "PAX"; QtyValue1 = Q30_1.Text;
                SpecId1 = "ENG"; SpecOptionId1 = SO30_1.SelectedValue.ToString();
                break;

            case "31":
                QtyId1 = "HGHT";
                if (QU31_1_1.Checked == true) QtyUnitId1 = "MM"; else QtyUnitId1 = "FT";
                QtyValue1 = Q31_1.Text;

                SpecId1 = "MODE"; SpecOptionId1 = SO31_1.SelectedValue.ToString();
                SpecId2 = "ENG"; SpecOptionId2 = SO31_2.SelectedValue.ToString();
                break;

            case "32":
                QtyId1 = "MTOW";
                if (QU32_1_1.Checked == true) QtyUnitId1 = "TON"; else QtyUnitId1 = "LBS";

                QtyValue1 = Q32_1.Text; 
                SpecId1 = "TYPE"; SpecOptionId1 = SO32_1.SelectedValue.ToString();
                SpecId2 = "ENG"; SpecOptionId2 = SO32_2.SelectedValue.ToString();
                break;

            case "33":
                SpecId1 = "ENG"; SpecOptionId1 = SO33_1.SelectedValue.ToString();
                break;

            case "34":
                QtyId1 = "CAPC";
                if (QU34_1_1.Checked == true) QtyUnitId1 = "LTR"; else QtyUnitId1 = "GL";
                QtyValue1 = Q34_1.Text;

                SpecId1 = "TYPE"; SpecOptionId1 = SO34_1.SelectedValue.ToString();
                SpecId2 = "MODE"; SpecOptionId2 = SO34_2.SelectedValue.ToString();
                break;

            case "35":
                break;

            case "36":
                break;

            case "37":
                SpecId1 = "TYPE"; SpecOptionId1 = SO37_1.SelectedValue.ToString();
                SpecId2 = "TBTH"; SpecOptionId2 = SO37_2.SelectedValue.ToString();
                break;

            case "38":
                SpecId1 = "ENG"; SpecOptionId1 = SO38_1.SelectedValue.ToString();
                break;

            case "39":
                SpecId1 = "TYPE"; SpecOptionId1 = SO39_1.SelectedValue.ToString();
                break;

            case "40":
                QtyId1 = "CAPC";
                if (QU40_1_1.Checked == true) QtyUnitId1 = "LTR"; else QtyUnitId1 = "GL";
                QtyValue1 = Q40_1.Text;

                SpecId1 = "MODE"; SpecOptionId1 = SO40_1.SelectedValue.ToString();
                break;

            case "41":
                QtyId1 = "PAYLD";
                if (QU41_1_1.Checked == true) QtyUnitId1 = "KG"; else QtyUnitId1 = "LBS";
                QtyValue1 = Q41_1.Text;
                break;

            case "42":
                SpecId1 = "TYPE"; SpecOptionId1 = SO42_1.SelectedValue.ToString();
                break;

            case "43":
                break;

            case "44":
                SpecId1 = "TYPE"; SpecOptionId1 = SO44_1.SelectedValue.ToString();
                break;

            case "46":
                SpecId1 = "TYPE"; SpecOptionId1 = SO46_1.SelectedValue.ToString();
                break;

            case "47":
                SpecId1 = "TYPE"; SpecOptionId1 = SO47_1.SelectedValue.ToString();
                break;

            case "48":
                SpecId1 = "TYPE"; SpecOptionId1 = SO48_1.SelectedValue.ToString();
                break;


            case "49":
                break;


            case "50":
                break;

            default:
                QtyId1 = ""; QtyUnitId1 = ""; QtyValue1 = "0";
                QtyId2 = ""; QtyUnitId2 = ""; QtyValue2 = "0";
                SpecId1 = ""; SpecOptionId1 = "";
                SpecId2 = ""; SpecOptionId2 = "";
                SpecId3 = ""; SpecOptionId3 = "";
                break;


        }

        // If Qty Values have not been specified then set them to zero
        if (String.IsNullOrEmpty(QtyValue1))
        {
            QtyValue1 = "0";
        }
        if (String.IsNullOrEmpty(QtyValue2))
        {
            QtyValue2 = "0";
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

        // Now fill the appropriate controls with the values
        switch (GSETypeId)
        {
            case "1":
                Q1_1.Text = QtyValue1;
                Q1_2.Text = QtyValue2;
                SO1_1.SelectedValue= SpecOptionId1;
                break;

            case "2":
                Q2_1.Text = QtyValue1;
                Q2_2.Text = QtyValue2;
                SO2_1.SelectedValue = SpecOptionId1;
                break;

            case "3":
                Q3_1.Text = QtyValue1;
                Q3_2.Text = QtyValue2;
                SO3_1.SelectedValue = SpecOptionId1;
                SO3_2.SelectedValue = SpecOptionId2;
                break;

            case "4":
                break;

            case "5":
                break;

            case "6":
                SO6_1.SelectedValue = SpecOptionId1;
                break;

            case "7":
                Q7_1.Text = QtyValue1;
                if (string.IsNullOrEmpty(QtyUnitId1)) {QtyUnitId1 = "KN";}
                if (QtyUnitId1 == "KN") { QU7_1_1.Checked = true; QU7_1_2.Checked = false; } else { QU7_1_2.Checked = true; QU7_1_1.Checked = false;}
                SO7_1.SelectedValue = SpecOptionId1;
                break;

            case "8":
                if (string.IsNullOrEmpty(QtyUnitId1)) { QtyUnitId1 = "MM"; }
                if (QtyUnitId1 == "MM") { QU8_1_1.Checked = true; QU8_1_2.Checked = false; } else { QU8_1_1.Checked = false; QU8_1_2.Checked = true; } 
                Q8_1.Text = QtyValue1;

                if (string.IsNullOrEmpty(QtyUnitId2)) { QtyUnitId2 = "MM"; }
                if (QtyUnitId2 == "MM") {QU8_2_1.Checked = true;QU8_2_2.Checked = false;} else {QU8_2_1.Checked = false; QU8_2_2.Checked = true;}
                Q8_2.Text = QtyValue2;

                SO8_1.SelectedValue = SpecOptionId1;
                SO8_2.SelectedValue = SpecOptionId2;
                break;


            case "9":
                if (string.IsNullOrEmpty(QtyUnitId1)) { QtyUnitId1 = "MM"; }
                if (QtyUnitId1 == "MM"){QU9_1_1.Checked = true;QU9_1_2.Checked = false;} else {QU9_1_1.Checked = false;QU9_1_2.Checked = true;}
                Q9_1.Text = QtyValue1;

                SO9_1.SelectedValue = SpecOptionId1;
                break;

            case "10":
                if (string.IsNullOrEmpty(QtyUnitId1)) { QtyUnitId1 = "MM"; }
                if (QtyUnitId1 == "MM") { QU10_1_1.Checked = true; QU10_1_2.Checked = false; } else { QU10_1_1.Checked = false; QU10_1_2.Checked = true; }
                Q10_1.Text = QtyValue1;

                SO10_1.SelectedValue = SpecOptionId1 = SO10_1.SelectedValue.ToString();
                break;

            case "11":
                if (string.IsNullOrEmpty(QtyUnitId1)) { QtyUnitId1 = "TON"; }
                if (QtyUnitId1 == "TON") { QU11_1_1.Checked = true; QU11_1_2.Checked = false; } else { QU11_1_1.Checked = false; QU11_1_2.Checked = true; }
                Q11_1.Text = QtyValue1;

                SO11_1.SelectedValue = SpecOptionId1;
                break;

            case "12":
                if (string.IsNullOrEmpty(QtyUnitId1)) { QtyUnitId1 = "MM"; }
                if (QtyUnitId1 == "MM"){QU12_1_1.Checked =true; QU12_1_2.Checked = false;} else {QU12_1_1.Checked =false; QU12_1_2.Checked = true;}
                Q12_1.Text = QtyValue1;

                break;

            case "13":
                SO13_1.SelectedValue = SpecOptionId1;
                break;

            case "14":
                SO14_1.SelectedValue = SpecOptionId1;
                break;

            case "15":
                break;

            case "16":
                break;

            case "17":
                if (string.IsNullOrEmpty(QtyUnitId1)) { QtyUnitId1 = "KG"; }
                if (QtyUnitId1 == "KG") { QU17_1_1.Checked = true; QU17_1_2.Checked = false; } else { QU17_1_1.Checked = false; QU17_1_2.Checked = true; }
                Q17_1.Text = QtyValue1;

                SO17_1.SelectedValue = SpecOptionId1;
                SO17_2.SelectedValue = SpecOptionId2;
                break;

            case "18":
                Q18_1.Text = QtyValue1;
                SO18_1.SelectedValue = SpecOptionId1;
                break;

            case "19":
                SO19_1.SelectedValue = SpecOptionId1;
                SO19_2.SelectedValue = SpecOptionId2;
                break;

            case "20":
                Q20_1.Text = QtyValue1;
                SO20_1.SelectedValue = SpecOptionId1;
                SO20_2.SelectedValue = SpecOptionId2;
                break;

            case "21":
                if (string.IsNullOrEmpty(QtyUnitId1)) { QtyUnitId1 = "LTR"; }
                if (QtyUnitId1 == "LTR") { QU21_1_1.Checked = true; QU21_1_2.Checked = false; } else { QU21_1_1.Checked = false; QU21_1_2.Checked = true; }
                Q21_1.Text = QtyValue1;

                SO21_1.SelectedValue = SpecOptionId1;
                break;

            case "22":
                if (string.IsNullOrEmpty(QtyUnitId1)) { QtyUnitId1 = "KG"; }
                if (QtyUnitId1 == "KG") { QU22_1_1.Checked = true; QU22_1_2.Checked = false; } else { QU22_1_1.Checked = false; QU22_1_2.Checked = true; }
                Q22_1.Text = QtyValue1;

                SO22_1.SelectedValue = SpecOptionId1;
                break;

            case "23":
                if (string.IsNullOrEmpty(QtyUnitId1)) { QtyUnitId1 = "KG"; }
                if (QtyUnitId1 == "KG") { QU23_1_1.Checked = true; QU23_1_2.Checked = false; } else { QU23_1_1.Checked = false; QU23_1_2.Checked = true; }
                Q23_1.Text = QtyValue1;

                SO23_1.SelectedValue = SpecOptionId1;
                break;

            case "24":
                if (string.IsNullOrEmpty(QtyUnitId1)) { QtyUnitId1 = "MM"; }
                if (QtyUnitId1 == "MM") { QU24_1_1.Checked = true; QU24_1_2.Checked = false; } else { QU24_1_1.Checked = false; QU24_1_2.Checked = true; }
                Q24_1.Text = QtyValue1;

                SO24_1.SelectedValue = SpecOptionId1;
                break;

            case "25":
                if (string.IsNullOrEmpty(QtyUnitId1)) { QtyUnitId1 = "MM"; }
                if (QtyUnitId1 == "MM") { QU25_1_1.Checked = true; QU25_1_2.Checked = false; } else { QU25_1_1.Checked = false; QU25_1_2.Checked = true; }
                Q25_1.Text = QtyValue1;

                SO25_1.SelectedValue = SpecOptionId1;
                SO25_2.SelectedValue = SpecOptionId2;
                SO25_3.SelectedValue = SpecOptionId3;
                break;

            case "26":
                if (string.IsNullOrEmpty(QtyUnitId1)) { QtyUnitId1 = "MM"; }
                if (QtyUnitId1 == "MM") { QU26_1_1.Checked = true; QU26_1_2.Checked = false; } else { QU26_1_1.Checked = false; QU26_1_2.Checked = true; }
                Q26_1.Text = QtyValue1;

                SO26_1.SelectedValue = SpecOptionId1;
                SO26_2.SelectedValue = SpecOptionId2;
                break;

            case "27":
                break;

            case "28":
                SO28_1.SelectedValue = SpecOptionId1;
                break;

            case "29":
                break;

            case "30":
                Q30_1.Text = QtyValue1;
                SO30_1.SelectedValue = SpecOptionId1;
                break;

            case "31":
                if (string.IsNullOrEmpty(QtyUnitId1)) { QtyUnitId1 = "MM"; }
                if (QtyUnitId1 == "MM") { QU31_1_1.Checked = true; QU31_1_2.Checked = false; } else { QU31_1_1.Checked = false; QU31_1_2.Checked = true; }
                Q31_1.Text = QtyValue1;

                SO31_1.SelectedValue = SpecOptionId1;
                SO31_2.SelectedValue = SpecOptionId2;
                break;

            case "32":
                if (string.IsNullOrEmpty(QtyUnitId1)) { QtyUnitId1 = "TON"; }
                if (QtyUnitId1 == "TON") { QU32_1_1.Checked = true; QU32_1_2.Checked = false; } else { QU32_1_1.Checked = false; QU32_1_2.Checked = true; }
                Q32_1.Text = QtyValue1;

                SO32_1.SelectedValue = SpecOptionId1;
                SO32_2.SelectedValue = SpecOptionId2;
                break;

            case "33":
                SO33_1.SelectedValue = SpecOptionId1;
                break;

            case "34":
                if (string.IsNullOrEmpty(QtyUnitId1)) { QtyUnitId1 = "LTR"; }
                if (QtyUnitId1 == "LTR") { QU34_1_1.Checked = true; QU34_1_2.Checked = false; } else { QU34_1_1.Checked = false; QU34_1_2.Checked = true; }
                Q34_1.Text = QtyValue1;

                SO34_1.SelectedValue = SpecOptionId1;
                SO34_2.SelectedValue = SpecOptionId2;
                break;

            case "35":
                break;

            case "36":
                break;

            case "37":
                SO37_1.SelectedValue = SpecOptionId1;
                SO37_2.SelectedValue = SpecOptionId2;
                break;

            case "38":
                SO38_1.SelectedValue = SpecOptionId1;
                break;

            case "39":
                SO39_1.SelectedValue = SpecOptionId1;
                break;

            case "40":
                if (string.IsNullOrEmpty(QtyUnitId1)) { QtyUnitId1 = "LTR"; }
                if (QtyUnitId1 == "LTR") { QU40_1_1.Checked = true; QU40_1_2.Checked = false; } else { QU40_1_1.Checked = false; QU40_1_2.Checked = true; }
                Q40_1.Text = QtyValue1;

                SO40_1.SelectedValue = SpecOptionId1;
                break;

            case "41":
                if (string.IsNullOrEmpty(QtyUnitId1)) { QtyUnitId1 = "KG"; }
                if (QtyUnitId1 == "KG") { QU41_1_1.Checked = true; QU41_1_2.Checked = false; } else { QU41_1_1.Checked = false; QU41_1_2.Checked = true; }
                Q41_1.Text = QtyValue1;
                break;

            case "42":
                SO42_1.SelectedValue = SpecOptionId1;
                break;

            case "43":
                break;

            case "44":
                SO44_1.SelectedValue = SpecOptionId1;
                break;

            case "46":
                SO46_1.SelectedValue = SpecOptionId1;
                break;

            case "47":
                SO47_1.SelectedValue = SpecOptionId1;
                break;

            case "48":
                SO48_1.SelectedValue = SpecOptionId1;
                break;

            case "49":
                break;

            case "50":
                break;
            default:
                break;

        }


    }

    protected void GetAccounts()
    {
        try
        {
            ddlSuppliers.DataSource = AccountAction.GetAccountsWithAdverts();
            ddlSuppliers.DataValueField = "AccountId";
            ddlSuppliers.DataTextField = "CompanyName";
            ddlSuppliers.DataBind();

            ListItem listItem = new ListItem();
            listItem.Text = "All Sellers";
            listItem.Value = "0";
            ddlSuppliers.Items.Insert(0, listItem);

        }
        catch (Exception ex)
        {
            ctlNotifier.intResponseCode = 3;
            ctlNotifier.strResponse = "Unable to retrieve Account list. Support has been notified";
            EmailHelper.SendErrorEmail("An error occured while retrieve Account list.", ex);
        }
    }

    protected void GetManufacturers()
    {
        try
        {

            ddlManufacturer.DataSource = ManufacturerAction.GetManufacturers();
            ddlManufacturer.DataValueField = "ManufacturerName";
            ddlManufacturer.DataTextField = "ManufacturerName";
            ddlManufacturer.DataBind();

            ListItem listItem = new ListItem();
            listItem.Text = "All Manufacturers";
            listItem.Value = "";
            ddlManufacturer.Items.Insert(0, listItem);

        }
        catch (Exception ex)
        {
            ctlNotifier.intResponseCode = 3;
            ctlNotifier.strResponse = "Unable to retrieve Manufacturer list. Support has been notified";
            EmailHelper.SendErrorEmail("An error occured while retrieve Manufacturer list.", ex);
        }
    }

}
