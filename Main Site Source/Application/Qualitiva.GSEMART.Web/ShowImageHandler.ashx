<%@ WebHandler Language="C#" Class="ShowImageHandler" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Web.SessionState;
using Qualitiva.GSEMART.BusinessLayer;
using Qualitiva.GSEMART.BusinessObject;
using Qualitiva.GSEMART.Common;

public class ShowImageHandler : IHttpHandler, IReadOnlySessionState
{

    public void ProcessRequest(HttpContext context)
    {

        if (context.Request.QueryString["AccountId"] != null)
        {

            int AccountId = Convert.ToInt32(context.Request.QueryString["AccountId"]);
            try
            {
                AccountImage objAccountImage = new AccountImage();
                objAccountImage = AccountAction.GetAccountImageByAccountId(AccountId);
                ShowAccountImage(context, objAccountImage);


            }
            catch (Exception ex)
            {
            }
        }
       
        
        if (context.Request.QueryString["advertImageId"] != null)
        {

            int advertImageId = Convert.ToInt32(context.Request.QueryString["advertImageId"]);
            try
            {
                AdvertImage objAdvertImage = new AdvertImage();
                objAdvertImage = AdvertAction.GetAdvertImageById(advertImageId);
                ShowImage(context,objAdvertImage);
                

            }
            catch (Exception ex)
            {
            }
        }

        if (context.Request.QueryString["ai"] != null && context.Request.QueryString["guid"] != null)
        {
            if (context.Request.QueryString["guid"] != String.Empty)
            {
                int advertImageId = Convert.ToInt32(context.Request.QueryString["ai"]);
                string guid = context.Request.QueryString["guid"].ToString();

                if (context.Session["objAdvertImages_" + guid] != null)
                {
                    List<AdvertImage> lstImages = (List<AdvertImage>)context.Session["objAdvertImages_" + guid];
                    if (lstImages.Count > 0)
                    {

                        foreach (AdvertImage advImage in lstImages)
                        {
                            if (advImage.AdvertImageId == advertImageId)
                            {
                                ShowImage(context, advImage);
                                break;
                            }
                        }
                    }
                    else
                    {
                        context.Response.ContentType = "image/jpg";
                        context.Response.WriteFile("~/images/notfound.jpg");
                    }
                }
            }
        }
    }

    private void ShowImage(HttpContext context,AdvertImage objAdvertImage)
    {
        if (objAdvertImage.AdvertImageId > 0)
        {

            if (context.Request.QueryString["thumb"] != null)
            {
                string thumbScale = context.Request.QueryString["thumb"];
                context.Response.Clear();
                context.Response.ContentType = objAdvertImage.ContentType;
                if (thumbScale == "1")
                {
                    //Thumbnails
                    context.Response.BinaryWrite(Common.ResizeImageFile((byte[])objAdvertImage.Image, 75));
                }
                else if (thumbScale == "10")
                {
                    //full size image
                    context.Response.BinaryWrite(Common.ResizeImageFile((byte[])objAdvertImage.Image,800));
                }
                else
                {
                    //Search results
                    context.Response.BinaryWrite(Common.ResizeImageFile((byte[])objAdvertImage.Image, 150));
                }
            }
            else
            {
                //The preview page
                context.Response.Clear();
                context.Response.ContentType = objAdvertImage.ContentType;
                context.Response.BinaryWrite(Common.ResizeImageFile((byte[])objAdvertImage.Image, 300));
            }

        }
        else
        {
            context.Response.ContentType = "image/jpg";
            context.Response.WriteFile("~/images/notfound.jpg");
        }
    }

    private void ShowAccountImage(HttpContext context, AccountImage objAccountImage)
    {
        if (objAccountImage.AccountId > 0)
        {

                context.Response.Clear();
                context.Response.ContentType = "image/jpg";
                context.Response.BinaryWrite(Common.ResizeImageFile((byte[])objAccountImage.Image, 800));

        }
        else
        {
            context.Response.ContentType = "image/jpg";
            context.Response.WriteFile("~/images/notfound.jpg");
        }
    }
    
    
    
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}