using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using Qualitiva.GSEMART.DataLayer;
using Qualitiva.GSEMART.BusinessObject;

namespace Qualitiva.GSEMART.BusinessLayer
{
    public class AdvertAction
    {

        public static int GetTotalAdvertCountries()
        {
            return AdvertLayer.GetTotalAdvertCountries();
        }

        public static void UpdateURLClickThrough(int AdvertId)
        {
            AdvertLayer.UpdateURLClickThrough(AdvertId);
        }
        
        // Jim Brock
        //
        // Get adverts using the New filter search on quantity and specifications
        public static List<Advert> GetAdvertByFilterSearch(

            int rowPerPage,
            int rowStart,
            string CountryId,
            string RegionId,
            string SortBy,
            string GSETypeId,
            string ASAMembersOnlyYN,

            string NewYN,
            string UsedYN,
            string ForRentYN,
            string ForLeaseYN,
            string ForSaleYN,

            string QtyId1,
            string QtyUnitId1,
            string QtyValue1,

            string QtyId2,
            string QtyUnitId2,
            string QtyValue2,

            string SpecId1,
            string SpecOptionId1,

            string SpecId2,
            string SpecOptionId2,

            string SpecId3,
            string SpecOptionId3,
            string Manufacturer,
            string AccountId,
            out int totalRecord)
        {
            List<Advert> lstAdverts = AdvertLayer.GetAdvertByFilterSearch(
                    rowPerPage, rowStart, CountryId, RegionId, SortBy, GSETypeId, ASAMembersOnlyYN,
                    NewYN, UsedYN,
                    ForRentYN, ForLeaseYN, ForSaleYN,
                    QtyId1, QtyUnitId1, QtyValue1,
                    QtyId2, QtyUnitId2, QtyValue2,
                    SpecId1, SpecOptionId1,
                    SpecId2, SpecOptionId2,
                    SpecId3, SpecOptionId3,
                    Manufacturer,
                    AccountId,
                    out totalRecord);

            return lstAdverts;
        }

        public static int GetTotalAdvertQuantity(bool NewYN)
        {
            return AdvertLayer.GetTotalAdvertQuantity(NewYN);
        }

        public static void SetAdvertCounter(int AdvertId)
        {
            AdvertLayer.SetAdvertCounter(AdvertId);
        }

        public static List<AdvertDocument> GetAdvertDocuments(int AdvertId)
        {
            return AdvertDocumentLayer.GetAdvertDocuments(AdvertId);
        }

        public static Advert GetAdvertById(int AdvertId)
        {
            return AdvertLayer.GetAdvertById(AdvertId);
        }

        public static List<Advert> GetTopAdvertListing()
        {
            List<Advert> lstAdverts = AdvertLayer.GetTopAdvertListing();
            return lstAdverts;
        }

        public static AdvertImage GetAdvertImageById(int AdvertImageId)
        {
            return AdvertLayer.GetAdvertImageById(AdvertImageId);
        }

        public static List<AdvertImage>  GetAdvertImageByAdvertId(int AdvertId)
        {
            return AdvertLayer.GetAdvertImageByAdvertId(AdvertId);
        }


/*

        public static List<AdvertStatus> GetAdvertStatus()
        {
            return AdvertLayer.GetAdvertStatus();
        }

        public AdvertStatus GetAdvertStatusById(string AdvertStatusId)
        {
            return AdvertLayer.GetAdvertStatusById(AdvertStatusId);
        }
 



        public static List<AdvertFeature> GetAdvertFeatureByAdvertId(int AdvertId)
        {
            return AdvertLayer.GetAdvertFeatureByAdvertId(AdvertId);
        }


        public static List<Advert> GetAdvertByAccountId(int rowPerPage, int rowStart, int AccountId, out int totalRecord)
        {
            return AdvertLayer.GetAdvertByAccountId(rowPerPage, rowStart, AccountId, out totalRecord);
        }

        public static AdvertImage AddAdvertImage(AdvertImage objAdvertImage)
        {
            return AdvertLayer.AddAdvertImage(objAdvertImage);
        }


        

        public static List<Advert> GetAdvertBySearch(int rowPerPage, int rowStart, string CategoryId, string CountryId, string Location, string SearchAllFor, string SearchCurrencyID, decimal PriceFrom, decimal PriceTo, string SortBy, int GSETypeId, bool ASAMembersOnlyYN, out int totalRecord)
        {
            List<Advert> lstAdverts = AdvertLayer.GetAdvertBySearch(rowPerPage, rowStart, CategoryId, CountryId, Location, SearchAllFor, SearchCurrencyID, PriceFrom, PriceTo, SortBy,GSETypeId, ASAMembersOnlyYN, out totalRecord);
            _sqlExecutionTime = AdvertLayer.SqlExecutionTime;
            _scriptExecutionTime = AdvertLayer.ScriptExecutionTime;
            return lstAdverts;
        }


        public static List<Advert> GetAllAdvertListing(bool NewYN, bool UsedYN)
        {
            List<Advert> lstAdverts = AdvertLayer.GetAllAdvertListing(NewYN, UsedYN);
            return lstAdverts;
        }





        /// <summary>
        /// Places the Advert
        /// </summary>
        /// <param name="objAdvert"></param>
        /// <param name="objAdvertGSE"></param>
        /// <param name="objAdvertSpares"></param>
        /// <param name="objAdvertTool"></param>
        /// <returns></returns>
        public static Advert PlaceAdvert(Advert objAdvert)
        {
            return AdvertLayer.PlaceAdvert(objAdvert);
        }

        /// <summary>
        /// Function to Update Advert
        /// </summary>
        /// <param name="objAdvert"></param>
        /// <returns></returns>
        public static Advert UpdateAdvert(Advert objAdvert)
        {
            return AdvertLayer.UpdateAdvert(objAdvert);
        }

        public static void UpdateAdvertStatus(Advert objAdvert)
        {
            AdvertLayer.UpdateAdvertStatus(objAdvert);
        }





        public static int TotalNumberOfAdvertInMonth(int AccountId, string AdvertCategory, int Month) {
            return AdvertLayer.TotalNumberOfAdvertInMonth(AccountId, AdvertCategory, Month);
        }

        public static DateTime GetAdvertSoldDate(int AdvertId)
        {
            return AdvertLayer.GetAdvertSoldDate(AdvertId);
        }

        public static AdvertTransaction SetAdvertTransaction(AdvertTransaction objAdvertTransaction)
        {
            return AdvertLayer.SetAdvertTransaction(objAdvertTransaction);
        }

        public static void UpdateAdvertTransaction(AdvertTransaction objAdvertTransaction)
        {
            AdvertLayer.UpdateAdvertTransaction(objAdvertTransaction);
        }

        public static void SetAdvertInvoice(AdvertInvoice objAdvertInvoice)
        {
            AdvertLayer.SetAdvertInvoice(objAdvertInvoice);
        }

        public static DataSet GetAllInvoiceByAccountId(int AccountId)
        {
            return AdvertLayer.GetAllInvoiceByAccountId(AccountId);
        }

        public static AdvertTransaction GetLastTransactionByAdvertId(int AdvertId)
        {
            return AdvertLayer.GetLastTransactionByAdvertId(AdvertId);
        }

        public static int GetTotalInvoiceByAdvertId(int AdvertId) {
            return AdvertLayer.GetTotalInvoiceByAdvertId(AdvertId);
        }

        public static AdvertInvoice prSelLastCreditCardInvoiceByAdvertId(int AdvertId)
        {
            return AdvertLayer.prSelLastCreditCardInvoiceByAdvertId(AdvertId);
        }

        public static void UpdateAdvertExpiryDate(Advert objAdvert) {
            AdvertLayer.UpdateAdvertExpiryDate(objAdvert);
        }

        public static AdvertInvoice GetInvoiceByAdvertInvoiceId(int AdvertInvoiceId){
            return AdvertLayer.GetInvoiceByAdvertInvoiceId(AdvertInvoiceId);
        }

        public static bool ValidateAdvertInvoiceAdvertId(int AccountId, int AdvertInvoiceId){
            return AdvertLayer.ValidateAdvertInvoiceAdvertId(AccountId, AdvertInvoiceId);
        }
 
 */
    }
}