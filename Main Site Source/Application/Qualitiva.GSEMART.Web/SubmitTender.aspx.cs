using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Qualitiva.GSEMART.BusinessObject;
using System.Text.RegularExpressions;
using Qualitiva.GSEMART.BusinessLayer;

public partial class Submit_Tender : System.Web.UI.Page
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
            this.PageSettings();

        }
    }

    /// <summary>
    /// Event triggered when btnSubmit button is clicked
    /// </summary>
    /// <param name="sender">object</param>
    /// <param name="e">EventArgs</param>
    protected void btnSubmit_OnClick(object sender, EventArgs e) {

        Boolean blnhasFile = fileUploadControl.HasFile;
        Boolean blnfileExtensionOK = false;

        Tender objTender = new Tender();


        // try save the file to the web server
        if (blnhasFile)
        {

            // Check the file size
            if (fileUploadControl.PostedFile.ContentLength <= 2097151)
            {
                // Check the extension
                String fileExtension = System.IO.Path.GetExtension(fileUploadControl.FileName).ToLower();
                String[] allowedExtensions = { ".doc", ".docx", ".pdf", ".xls", ".xlsx"};
                for (int i = 0; i < allowedExtensions.Length; i++)
                {
                    if (fileExtension == allowedExtensions[i])
                    {
                        blnfileExtensionOK = true;
                        break;
                    }
                }

                if (blnfileExtensionOK == false)
                {
                    ctlNotifier.intResponseCode = 1;
                    ctlNotifier.strResponse = "Please upload file with extension .doc, .docx or .pdf";
                }
                else
                {
                    // The file is ok!
                    ctlNotifier.intResponseCode = 0;
                }

            }
            else
            {
                ctlNotifier.intResponseCode = 3;
                ctlNotifier.strResponse = "Selected document size exceeds 2 MB.";
            }
        }
        else
        {
            ctlNotifier.intResponseCode = 0;

        }// End of file check
         
        // If the file is ok (or is not attached)
        if (ctlNotifier.intResponseCode == 0)
        {

            try
            {

                objTender.CompanyName = txtCompanyName.Text.Trim();
                objTender.ContactName = txtContactName.Text.Trim();
                objTender.Subject = txtTenderSubject.Text.Trim();
                objTender.Telephone = txtTelephone.Text.Trim();
                objTender.Mobile = txtMobile.Text.Trim();
                objTender.ExpiryDate = Convert.ToDateTime(ddlExpiryDate.SelectedValue);
                objTender.EmailAddress = txtEmailAddress.Text.Trim();
                objTender.URL = txtURL.Text.Trim();
                objTender.Country = ddlCountry.SelectedValue;

                objTender.Notes = txtRequirement.Text.Trim();
                //objTender.Notes = Regex.Replace(txtRequirement.Text, "<.*?>", string.Empty);
                    
                objTender = TenderAction.AddTender(objTender);

                // If a tender document has been specified then save to the index
                if (blnhasFile)
                {

                    // Create a datanode object
                    DataNode objDataNode = DataNodeAction.GetDataNode();

                    // Create a unique file name for the tender
                    string IndexFileName;

                    IndexFileName = DateTime.Now.ToString("yyyyMMddhhmmss") + fileUploadControl.FileName;

                    // Copy the file to the datanode
                    fileUploadControl.SaveAs(objDataNode.PhysicalPath + IndexFileName);

                    // Insert an Index record 
                    DocumentIndexAction.InsertIndex(
                        objTender.TenderId,
                        objDataNode.DataNodeId,
                        "Tender",
                        "Tender for: " + objTender.CompanyName,
                        IndexFileName);

                }




                ctlNotifier.intResponseCode = objTender.RespCode;
                ctlNotifier.strResponse = objTender.RespDesc; 

                

        
            }
            catch(Exception ex){
                ctlNotifier.strResponse = ex.Message;
                ctlNotifier.intResponseCode = 1;
            } // End of Save Tender


        } // End of File Ok test
       

        if (ctlNotifier.intResponseCode == 0)
        {
            try
            {
                EmailHelper.SendNewTenderEmail(objTender);
            }
            catch (Exception ex)
            {
                EmailHelper.SendErrorEmail("An error occured while sending tender creation mail to " + objTender.EmailAddress + ".", ex);
            }
            finally
            {

                Response.Redirect("TenderSuccess.aspx");


            }
        }




    }

    #region Functions

    /// <summary>
    /// Function for Page Settings
    /// </summary>
    private void PageSettings() {

        chkTC.Attributes.Add("onclick", "javascript:CheckBoxTCChanged(this);");
        btnSubmit.Attributes.Add("onclick", "javascript:return Page_ClientValidate('SubmitTender');");

        PopulateExpiryDate();


    }

    private void PopulateExpiryDate()
    {

        DateTime thisDate = DateTime.Today;

        // Start off a week ahead
        thisDate = thisDate.AddDays(7);

        for (int i = 0; i <= 180; i++)
        {
            ddlExpiryDate.Items.Add(thisDate.ToString("yyyy-MM-dd"));
            thisDate = thisDate.AddDays(1);
        }

    }


    #endregion


}
