using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

/// <summary>
/// Summary description for URLConstant
/// </summary>
public class URLConstant
{
    public const string Home = "~/Default.aspx";
    public const string Search = "~/GSE-Search.aspx";
    public const string AdsDetails = "~/adDetails.aspx";
    public const string EmbeddedSearch = "~/Embedded.aspx";
    public const string EmbeddedAdsDetails = "~/EmbeddedAdDetails.aspx";
    public const string Tender = "~/TenderSuccess.aspx";
    public const string SubmitTender = "~/SubmitTender.aspx";
    public const string Logout = "~/Logout.aspx";

    public const string SellerDefault = "~/content/seller/Default.aspx";
    public const string MyAdvert = "~/content/seller/Adverts.aspx";
    public const string AddAdvert = "~/content/seller/addAdverts.aspx";
    public const string MyInvoice = "~/content/seller/invoice.aspx";
    public const string AdvertDetails = "~/content/seller/AdvertDetails.aspx";

    public URLConstant()
    {
        
    }

    public static string BuildSearchURL(string category, 
                                        string country, 
                                        string query, 
                                        string sortBy, 
                                        string pageHeading, 
                                        string GSETypeId, 
                                        string ASAMembersOnlyYN)
    {

        string url = Search + "?cat=" + category + "&cnt=" + country + "&query=" + query + "&sort=" + sortBy + "&heading=" + pageHeading + "&gsetypeid=" + GSETypeId + "&asamembersonlyyn=" + ASAMembersOnlyYN;
        return url;
    }

    public static string BuildSearchURL(string country, 
                                        string GSETypeId, 
                                        string ASAMembersOnlyYN, 
                                        string sortBy, 
                                        string NewYN, 
                                        string UsedYN, 
                                        string ForSaleYN, 
                                        string ForRentYN, 
                                        string ForLeaseYN,  
                                        string QtyId1, string QtyUnitId1, string QtyValue1, 
                                        string QtyId2, string QtyUnitId2, string QtyValue2, 
                                        string SpecId1, string SpecOptionId1, 
                                        string SpecId2, string SpecOptionId2,
                                        string SpecId3, string SpecOptionId3,
                                        string Manufacturer,
                                        string AccountId,
                                        string pageHeading)
    {

        Manufacturer = System.Web.HttpUtility.UrlEncode(Manufacturer);

        string url = Search + "?cnt=" + country + "&sort=" + sortBy + "&heading=" + pageHeading + "&gtid=" + GSETypeId + "&asaonlyyn=" + ASAMembersOnlyYN
                            + "&newyn=" + NewYN + "&usedyn=" + UsedYN
                            + "&fsyn=" + ForSaleYN + "&fryn=" + ForRentYN + "&flyn=" + ForLeaseYN
                            + "&qid1=" + QtyId1 + "&quid1=" + QtyUnitId1 + "&qv1=" + QtyValue1
                            + "&qid2=" + QtyId2 + "&quid2=" + QtyUnitId2 + "&qv2=" + QtyValue2
                            + "&sid1=" + SpecId1 + "&soid1=" + SpecOptionId1
                            + "&sid2=" + SpecId2 + "&soid2=" + SpecOptionId2
                            + "&sid3=" + SpecId3 + "&soid3=" + SpecOptionId3
                            + "&man=" + Manufacturer
                            + "&acid=" + AccountId;
                           
                            
        return url;
    }

    public static string BuildEmbeddedSearchURL(string category,
                                        string country,
                                        string query,
                                        string sortBy,
                                        string pageHeading,
                                        string GSETypeId,
                                        string ASAMembersOnlyYN)
    {

        string url = EmbeddedSearch + "?cat=" + category + "&cnt=" + country + "&query=" + query + "&sort=" + sortBy + "&heading=" + pageHeading + "&gsetypeid=" + GSETypeId + "&asamembersonlyyn=" + ASAMembersOnlyYN + "&myembedded=1";
        return url;
    }

    public static string BuildEmbeddedSearchURL(string country,
                                        string GSETypeId,
                                        string ASAMembersOnlyYN,
                                        string sortBy,
                                        string NewYN,
                                        string UsedYN,
                                        string ForSaleYN,
                                        string ForRentYN,
                                        string ForLeaseYN,
                                        string QtyId1, string QtyUnitId1, string QtyValue1,
                                        string QtyId2, string QtyUnitId2, string QtyValue2,
                                        string SpecId1, string SpecOptionId1,
                                        string SpecId2, string SpecOptionId2,
                                        string SpecId3, string SpecOptionId3,
                                        string Manufacturer,
                                        string AccountId,
                                        string pageHeading)
    {

        Manufacturer = System.Web.HttpUtility.UrlEncode(Manufacturer);

        string url = EmbeddedSearch + "?cnt=" + country + "&sort=" + sortBy + "&heading=" + pageHeading + "&gtid=" + GSETypeId + "&asaonlyyn=" + ASAMembersOnlyYN
                            + "&newyn=" + NewYN + "&usedyn=" + UsedYN
                            + "&fsyn=" + ForSaleYN + "&fryn=" + ForRentYN + "&flyn=" + ForLeaseYN
                            + "&qid1=" + QtyId1 + "&quid1=" + QtyUnitId1 + "&qv1=" + QtyValue1
                            + "&qid2=" + QtyId2 + "&quid2=" + QtyUnitId2 + "&qv2=" + QtyValue2
                            + "&sid1=" + SpecId1 + "&soid1=" + SpecOptionId1
                            + "&sid2=" + SpecId2 + "&soid2=" + SpecOptionId2
                            + "&sid3=" + SpecId3 + "&soid3=" + SpecOptionId3
                            + "&man=" + Manufacturer
                            + "&acid=" + AccountId
                            + "&myembedded=1";


        return url;
    }


    public static string BuildAdsDetailURL(string category, string country, string query, string sortBy, string pageHeading, int page, string GSETypeId, string ASAMembersOnlyYN) {
        string url = AdsDetails + "?cat=" + category + "&cnt=" + country + "&query=" + query + "&sort=" + sortBy + "&heading=" + pageHeading + "&page=" + page + "&gsetypeid=" + GSETypeId + "&asamembersonlyyn=" + ASAMembersOnlyYN;
        return url;
    }

    public static string BuildAdsDetailURL(string country, string GSETypeId, string ASAMembersOnlyYN, string sortBy,
                                        string NewYN, string UsedYN,
                                        string ForSaleYN, string ForRentYN, string ForLeaseYN,
                                        string QtyId1, string QtyUnitId1, string QtyValue1,
                                        string QtyId2, string QtyUnitId2, string QtyValue2,
                                        string SpecId1, string SpecOptionId1,
                                        string SpecId2, string SpecOptionId2,
                                        string SpecId3, string SpecOptionId3,
                                        string Manufacturer,
                                        string AccountId, 
                                        string pageHeading)
    {

        Manufacturer = System.Web.HttpUtility.UrlEncode(Manufacturer);

        string url = AdsDetails + "?cat=1&cnt=" + country + "&sort=" + sortBy + "&heading=" + pageHeading + "&gtid=" + GSETypeId + "&asaonlyyn=" + ASAMembersOnlyYN
                            + "&newyn=" + NewYN + "&usedyn=" + UsedYN
                            + "&fsyn=" + ForSaleYN + "&fryn=" + ForRentYN + "&flyn=" + ForLeaseYN
                            + "&qid1=" + QtyId1 + "&quid1=" + QtyUnitId1 + "&qv1=" + QtyValue1
                            + "&qid2=" + QtyId2 + "&quid2=" + QtyUnitId2 + "&qv2=" + QtyValue2
                            + "&sid1=" + SpecId1 + "&soid1=" + SpecOptionId1
                            + "&sid2=" + SpecId2 + "&soid2=" + SpecOptionId2
                            + "&sid3=" + SpecId3 + "&soid3=" + SpecOptionId3
                            + "&man=" + Manufacturer
                            + "&acid=" + AccountId;
                            

        return url;
    }

    public static string BuildEmbeddedAdsDetailURL(string category, string country, string query, string sortBy, string pageHeading, int page, string GSETypeId, string ASAMembersOnlyYN)
    {
        string url = EmbeddedAdsDetails + "?cat=" + category + "&cnt=" + country + "&query=" + query + "&sort=" + sortBy + "&heading=" + pageHeading + "&page=" + page + "&gsetypeid=" + GSETypeId + "&asamembersonlyyn=" + ASAMembersOnlyYN + "&myembedded=1";
        return url;
    }


    public static string BuildEmbeddedAdsDetailURL(string country, string GSETypeId, string ASAMembersOnlyYN, string sortBy,
                                        string NewYN, string UsedYN,
                                        string ForSaleYN, string ForRentYN, string ForLeaseYN,
                                        string QtyId1, string QtyUnitId1, string QtyValue1,
                                        string QtyId2, string QtyUnitId2, string QtyValue2,
                                        string SpecId1, string SpecOptionId1,
                                        string SpecId2, string SpecOptionId2,
                                        string SpecId3, string SpecOptionId3,
                                        string Manufacturer,
                                        string AccountId,
                                        string pageHeading)
    {

        Manufacturer = System.Web.HttpUtility.UrlEncode(Manufacturer);

        string url = EmbeddedAdsDetails + "?cat=1&cnt=" + country + "&sort=" + sortBy + "&heading=" + pageHeading + "&gtid=" + GSETypeId + "&asaonlyyn=" + ASAMembersOnlyYN
                            + "&newyn=" + NewYN + "&usedyn=" + UsedYN
                            + "&fsyn=" + ForSaleYN + "&fryn=" + ForRentYN + "&flyn=" + ForLeaseYN
                            + "&qid1=" + QtyId1 + "&quid1=" + QtyUnitId1 + "&qv1=" + QtyValue1
                            + "&qid2=" + QtyId2 + "&quid2=" + QtyUnitId2 + "&qv2=" + QtyValue2
                            + "&sid1=" + SpecId1 + "&soid1=" + SpecOptionId1
                            + "&sid2=" + SpecId2 + "&soid2=" + SpecOptionId2
                            + "&sid3=" + SpecId3 + "&soid3=" + SpecOptionId3
                            + "&man=" + Manufacturer
                            + "&acid=" + AccountId
                            + "&myembedded=1";


        return url;
    }

}
