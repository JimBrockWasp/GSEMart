/*
 * This is the default main page for GSE-Mart
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
using Qualitiva.GSEMART.BusinessLayer;
using Qualitiva.GSEMART.BusinessObject;
using Qualitiva.GSEMART.Common;
using System.Collections.Generic;

public partial class _default : System.Web.UI.Page
{
    /// <summary>
    /// Page Load
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            //Populating adverts list that going to show on homepage
            this.GetTopListing();

            GetManufacturers();

            // Set the number of items listed
            this.ValidateAndSetLblQuantityItem();
        }
    }

    /// <summary>
    /// Function to get and bind the top 5 advert listing
    /// </summary>
    private void GetTopListing() {
        List<Advert> lstAdverts = AdvertAction.GetTopAdvertListing();

        dataTopListingImage.DataSource = lstAdverts;
        dataTopListingImage.DataBind();

        dataTopListingTitle.DataSource = lstAdverts;
        dataTopListingTitle.DataBind();
    }

    /// <summary>
    /// Event triggered when dataTopListing item bounded
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">e</param>
    protected void dataTopListing_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Advert objAdvert = (Advert)e.Item.DataItem;
                Image imgThumb = (Image)e.Item.FindControl("imgThumb");

                string AdvertImageId = "0";
                if (objAdvert.AdvertImage.Count > 0)
                {
                    AdvertImageId = objAdvert.AdvertImage[0].AdvertImageId.ToString();
                }

                imgThumb.ImageUrl = string.Format("~/ShowImageHandler.ashx?advertImageId={0}&thumb=2", AdvertImageId);
            }
        }
        catch (Exception ex)
        {
            throw new Exception(ex.ToString());
        }

    }

    /// <summary>
    /// Function to identity if there is a need to grab total advert values from database
    /// </summary>
    private void ValidateAndSetLblQuantityItem()
    {
        if (Application["lblQuantityItemLastUpdate"] != null)
        {
            DateTime dtLastUpdatedQuantityItem = (DateTime)Application["lblQuantityItemLastUpdate"];
            if (dtLastUpdatedQuantityItem.AddMinutes(5) < DateTime.Now)
            {
                this.SetNewQuantityItemValue();
            }
            else
            {
                this.SetOldQuantityItemValue();
            }
        }
        else
        {
            this.SetNewQuantityItemValue();
        }
    }

    /// <summary>
    /// Function to grab new total quantity from all the active adverts
    /// </summary>
    private void SetNewQuantityItemValue()
    {
        string quantity = AdvertAction.GetTotalAdvertQuantity(true).ToString("#,#");
        lblNewQuantityItem.Text = quantity;
        Application["lblNewQuantityItemValue"] = quantity;

        quantity = AdvertAction.GetTotalAdvertQuantity(false).ToString("#,#");
        lblUsedQuantityItem.Text = quantity;
        Application["lblUsedQuantityItemValue"] = quantity;

        quantity = AdvertAction.GetTotalAdvertCountries().ToString("#,#");
        lblAdvertCountries.Text = quantity;
        Application["lblAdvertCountriesValue"] = quantity;

        Application["lblQuantityItemLastUpdate"] = DateTime.Now;
    }

    /// <summary>
    /// Function to grab existing total quantity values
    /// </summary>
    private void SetOldQuantityItemValue()
    {
        lblNewQuantityItem.Text = Application["lblNewQuantityItemValue"].ToString();
        lblUsedQuantityItem.Text = Application["lblUsedQuantityItemValue"].ToString();
        lblAdvertCountries.Text = Application["lblAdvertCountriesValue"].ToString();

    }

    protected void cmdSearch_Click(object sender, EventArgs e)
    {

        
        //Response.Redirect(URLConstant.BuildSearchURL(ddlCategoryId.SelectedValue.ToString(), ddlCountryId.SelectedValue.ToString(), Server.UrlEncode(txtQuery.Text.ToString()), ddlSortById.SelectedValue.ToString(), Server.UrlEncode(strPageHeading), ddlGSEType.SelectedValue.ToString(), ddlASAMembersOnlyYN.Checked.ToString()));
        Response.Redirect(URLConstant.BuildSearchURL(
                            ddlCountryId.SelectedValue.ToString(),
                            ddlGSEType.SelectedValue.ToString(),
                            "False",
                            "",
                            chkNew.Items[0].Selected.ToString(),
                            chkNew.Items[1].Selected.ToString(),
                            "True",
                            "True",
                            "True",
                            "", "", "", 
                            "", "", "",
                            "", "",
                            "", "",
                            "", "",
                            ddlManufacturer.SelectedValue.ToString(),
                            "0",
                            ""));



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
