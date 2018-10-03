using System;
using System.Collections.Generic;
using System.Text;

using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

using System.Configuration;
// using System.Transactions;
using Qualitiva.GSEMART.BusinessObject;

namespace Qualitiva.GSEMART.DataLayer
{
    public class AdvertLayer
    {

        public static int GetTotalAdvertCountries()
        {
            int total = 0;

            string ConnectionString = ConfigurationManager.ConnectionStrings["GSEMART_DBSERVER"].ConnectionString;
            SqlConnection Con = new SqlConnection(ConnectionString);

            SqlCommand dbCommand = null;
            SqlDataReader dr = null;

            try
            {
                // Connect to the Database
                Con.Open();

                // Create the command Object
                dbCommand = Con.CreateCommand();
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.CommandText = "prSelTotalAdvertCountries";
                
                // Execute command 
                dr = dbCommand.ExecuteReader();

                //Set Output
                while (dr.Read())
                {
                    total = Convert.ToInt32(dr["total"]);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally
            {
                if (dr != null) { dr.Close(); }
                if (Con != null) { Con.Close(); }
            }

            return total;
        }



        /// <summary>
        /// Function to increase Advert's URL Click Through
        /// </summary>
        /// <param name="AdvertId">Advert Id</param>
        public static void UpdateURLClickThrough(int AdvertId)
        {

            string ConnectionString = ConfigurationManager.ConnectionStrings["GSEMART_DBSERVER"].ConnectionString;
            SqlConnection Con = new SqlConnection(ConnectionString);

            SqlCommand dbCommand = null;
            SqlDataReader dr = null;

            try
            {

                // Connect to the Database
                Con.Open();

                // Create the command Object
                dbCommand = Con.CreateCommand();
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.CommandText = "prUpdAdvertURLClickThrough";
                dbCommand.Parameters.AddWithValue("AdvertId", AdvertId);

                // Execute command 
                dr = dbCommand.ExecuteReader();

            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally
            {
                if (dr != null) { dr.Close(); }
                if (Con != null) { Con.Close(); }
            }
        }


        /// <summary>
        /// Function to increase Advert's counter
        /// </summary>
        /// <param name="AdvertId">Advert Id</param>
        public static void SetAdvertCounter(int AdvertId)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["GSEMART_DBSERVER"].ConnectionString;
            SqlConnection Con = new SqlConnection(ConnectionString);

            SqlCommand dbCommand = null;
            SqlDataReader dr = null;

            try
            {

                // Connect to the Database
                Con.Open();

                // Create the command Object
                dbCommand = Con.CreateCommand();
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.CommandText = "prUpdAdvertCounter";
                dbCommand.Parameters.AddWithValue("AdvertId", AdvertId);

                // Execute command 
                dr = dbCommand.ExecuteReader();

                
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally
            {
                if (dr != null) { dr.Close(); }
                if (Con != null) { Con.Close(); }
            }
        }


        private static void SetReaderInfoFromRowWithFeatures(SqlDataReader dataRow, Advert objAdvert)
        {
            objAdvert.AdvertId = Convert.ToInt32(dataRow["AdvertID"].ToString());
            objAdvert.AccountId = Convert.ToInt32(dataRow["AccountId"].ToString());
            objAdvert.Title = dataRow["Title"].ToString();
            objAdvert.ShortDescription = dataRow["ShortDescription"].ToString();
            objAdvert.LongDescription = dataRow["LongDescription"].ToString();
            objAdvert.ASAMemberYN = Convert.ToBoolean(dataRow["ASAMemberYN"].ToString());
            objAdvert.NewYN = Convert.ToBoolean(dataRow["NewYN"].ToString());

            Category objCategory = new Category();
            objCategory.CategoryId = dataRow["CategoryId"].ToString();
            objCategory.Description = dataRow["CatDesc"].ToString();
            objAdvert.Category = objCategory;
            // objAdvert.Age = Convert.ToInt32(dataRow["Age"].ToString());

            switch (objAdvert.Category.CategoryId)
            {
                case "GS":
                    AdvertGSE objGSE = new AdvertGSE();
                    objGSE.Manufacturer = dataRow["Manufacturer"].ToString();
                    // objGSE.DateofRegistration = Convert.ToDateTime(dataRow["DateofRegistration"].ToString());
                    objGSE.Year = dataRow["Year"].ToString();
                    objGSE.AvailabilityId = dataRow["AdvertAvailabilityId"].ToString();
                    objGSE.AvailabilityDescription = dataRow["AvailabilityDescription"].ToString();
                    objGSE.ForSaleYN = Convert.ToBoolean(dataRow["ForSaleYN"]);
                    objGSE.ForRentYN = Convert.ToBoolean(dataRow["ForRentYN"]);
                    objGSE.ForLeaseYN = Convert.ToBoolean(dataRow["ForLeaseYN"]);

                    objGSE.QtyId1 = dataRow["QtyId1"].ToString();
                    objGSE.QtyDescription1 = dataRow["QtyDescription1"].ToString();
                    objGSE.QtyUnitId1 = dataRow["QtyUnitId1"].ToString();
                    objGSE.QtyUnitDescription1 = dataRow["QtyUnitDescription1"].ToString();
                    objGSE.QtyValue1 = Convert.ToSingle(dataRow["QtyValue1"].ToString());

                    objGSE.QtyId2 = dataRow["QtyId2"].ToString();
                    objGSE.QtyDescription2 = dataRow["QtyDescription2"].ToString();
                    objGSE.QtyUnitId2 = dataRow["QtyUnitId2"].ToString();
                    objGSE.QtyUnitDescription2 = dataRow["QtyUnitDescription2"].ToString();
                    objGSE.QtyValue2 = Convert.ToSingle(dataRow["QtyValue2"].ToString());

                    objGSE.SpecId1 = dataRow["SpecId1"].ToString();
                    objGSE.SpecDescription1 = dataRow["SpecDescription1"].ToString();
                    objGSE.SpecOptionId1 = dataRow["SpecOptionId1"].ToString();
                    objGSE.SpecOptionDescription1 = dataRow["SpecOptionDescription1"].ToString();

                    objGSE.SpecId2 = dataRow["SpecId2"].ToString();
                    objGSE.SpecDescription2 = dataRow["SpecDescription2"].ToString();
                    objGSE.SpecOptionId2 = dataRow["SpecOptionId2"].ToString();
                    objGSE.SpecOptionDescription2 = dataRow["SpecOptionDescription2"].ToString();

                    objGSE.SpecId3 = dataRow["SpecId3"].ToString();
                    objGSE.SpecDescription3 = dataRow["SpecDescription3"].ToString();
                    objGSE.SpecOptionId3 = dataRow["SpecOptionId3"].ToString();
                    objGSE.SpecOptionDescription3 = dataRow["SpecOptionDescription3"].ToString();

                    objAdvert.AdvertGSE = objGSE;
                    break;

                case "SP":
                    AdvertSpares obj = new AdvertSpares();
                    obj.ProductId = dataRow["ProductId"].ToString();
                    obj.Supplier = dataRow["Supplier"].ToString();
                    objAdvert.AdvertSpares = obj;
                    break;
                case "TL":
                    AdvertTool objAdTool = new AdvertTool();
                    objAdTool.Manufacturer = dataRow["Manufacturer"].ToString();
                    objAdTool.ProductId = dataRow["ProductId"].ToString();
                    objAdTool.Supplier = dataRow["Supplier"].ToString();
                    objAdTool.Year = dataRow["Year"].ToString();
                    objAdvert.AdvertTool = objAdTool;
                    break;
            }

            AdvertStatus objAdvertStatus = new AdvertStatus();
            objAdvertStatus.AdvertStatusId = dataRow["AdvertStatusId"].ToString();
            objAdvertStatus.Description = dataRow["StatusDesc"].ToString();
            objAdvert.AdvertStatus = objAdvertStatus;

            Country objCountry = new Country();
            objCountry.CountryId = dataRow["CountryId"].ToString();
            objCountry.CountryName = dataRow["CountryName"].ToString();
            objCountry.EUYN = Convert.ToBoolean(dataRow["EUYN"]);
            objCountry.CurrencyId = dataRow["CurrencyId"].ToString();
            objAdvert.Country = objCountry;

            Currency objCurrency = new Currency();
            objCurrency.CurrencyId = dataRow["CurrencyID"].ToString();
            objCurrency.Description = dataRow["CurrencyDesc"].ToString();
            objCurrency.DecimalUnicode = dataRow["DecimalUnicode"].ToString();
            objAdvert.Currency = objCurrency;

            objAdvert.Location = dataRow["Location"].ToString();
            objAdvert.ShowPriceYN = Convert.ToBoolean(dataRow["ShowPriceYN"].ToString());
            if (objAdvert.ShowPriceYN == false)
            {
                objAdvert.Price = 0;
                objAdvert.PriceInEuro = 0;
            }
            else
            {
                objAdvert.Price = Convert.ToDecimal(dataRow["Price"].ToString());
                objAdvert.PriceInEuro = Convert.ToDecimal(dataRow["PriceInEuro"]);
            }
            objAdvert.Quantity = Convert.ToInt32(dataRow["Quantity"]);
            objAdvert.ContactName = dataRow["ContactName"].ToString();
            objAdvert.Telephone = dataRow["Telephone"].ToString();
            objAdvert.Fax = dataRow["Fax"].ToString();
            objAdvert.Mobile = dataRow["Mobile"].ToString();
            objAdvert.EmailAddress = dataRow["EmailAddress"].ToString();
            objAdvert.URL = dataRow["URL"].ToString();

            if (dataRow["ExpiryDate"] != DBNull.Value)
            {
                objAdvert.ExpiryDate = Convert.ToDateTime(dataRow["ExpiryDate"].ToString());
            }
            objAdvert.CreatedDate = Convert.ToDateTime(dataRow["CreatedDate"].ToString());
            objAdvert.LastModifiedDate = Convert.ToDateTime(dataRow["LastModifiedDate"].ToString());

            objAdvert.Owner = dataRow["Owner"].ToString();
            objAdvert.Counter = Convert.ToInt32(dataRow["Counter"]);
            objAdvert.UserAccountTypeId = Convert.ToInt32(dataRow["UserAccountTypeID"]);

            //Adding image data if there is an image
            if (dataRow["AdvertImageId"] != DBNull.Value)
            {
                AdvertImage objAdvertImage = new AdvertImage();

                objAdvertImage.AdvertImageId = Convert.ToInt32(dataRow["AdvertImageId"]);
                objAdvertImage.AdvertId = Convert.ToInt32(dataRow["AdvertImageAdvertId"]);
                objAdvertImage.Description = dataRow["Description"].ToString();
                objAdvertImage.ContentType = dataRow["ContentType"].ToString();
                objAdvertImage.CreatedDate = Convert.ToDateTime(dataRow["ImageCreatedDate"].ToString());
                objAdvertImage.InUseYN = Convert.ToBoolean(dataRow["InUseYN"].ToString());
                objAdvertImage.IsDefaultYN = Convert.ToBoolean(dataRow["IsDefaultYN"].ToString());

                objAdvert.AdvertImage.Add(objAdvertImage);
            }
        }




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

            string ConnectionString = ConfigurationManager.ConnectionStrings["GSEMART_DBSERVER"].ConnectionString;
            SqlConnection Con = new SqlConnection(ConnectionString);

            SqlCommand dbCommand = null;
            SqlDataReader dr = null;

            List<Advert> lstAdvert = new List<Advert>();
            DataSet ds = new DataSet();

            try
            {

                // Connect to the Database
                Con.Open();

                // Create the command Object
                dbCommand = Con.CreateCommand();
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.CommandText = "prSelAdvertByFilterSearch";
                
                //Adding Input parameters
                dbCommand.Parameters.AddWithValue( "RowsPerPage", rowPerPage);
                dbCommand.Parameters.AddWithValue( "RowStart", rowStart);
                dbCommand.Parameters.AddWithValue( "CountryId", CountryId);
                dbCommand.Parameters.AddWithValue( "RegionId", RegionId);
                dbCommand.Parameters.AddWithValue( "GSETypeId", GSETypeId);
                dbCommand.Parameters.AddWithValue( "ASAMembersOnlyYN", ASAMembersOnlyYN);
                dbCommand.Parameters.AddWithValue( "SortBy", SortBy);

                dbCommand.Parameters.AddWithValue( "NewYN", NewYN);
                dbCommand.Parameters.AddWithValue( "UsedYN", UsedYN);
                dbCommand.Parameters.AddWithValue( "ForRentYN", ForRentYN);
                dbCommand.Parameters.AddWithValue( "ForLeaseYN", ForLeaseYN);
                dbCommand.Parameters.AddWithValue( "ForSaleYN", ForSaleYN);

                dbCommand.Parameters.AddWithValue( "QtyId1", QtyId1);
                dbCommand.Parameters.AddWithValue( "QtyUnitId1", QtyUnitId1);
                dbCommand.Parameters.AddWithValue( "QtyValue1", QtyValue1);

                dbCommand.Parameters.AddWithValue( "QtyId2", QtyId2);
                dbCommand.Parameters.AddWithValue( "QtyUnitId2", QtyUnitId2);
                dbCommand.Parameters.AddWithValue( "QtyValue2", QtyValue2);

                dbCommand.Parameters.AddWithValue( "SpecId1", SpecId1);
                dbCommand.Parameters.AddWithValue( "SpecOptionId1", SpecOptionId1);

                dbCommand.Parameters.AddWithValue( "SpecId2", SpecId2);
                dbCommand.Parameters.AddWithValue( "SpecOptionId2", SpecOptionId2);

                dbCommand.Parameters.AddWithValue( "SpecId3", SpecId3);
                dbCommand.Parameters.AddWithValue( "SpecOptionId3", SpecOptionId3);

                dbCommand.Parameters.AddWithValue( "Manufacturer", Manufacturer);
                dbCommand.Parameters.AddWithValue( "AccountId", AccountId);
                
                totalRecord = 0;


                // Execute command 
                dr = dbCommand.ExecuteReader();

                while (dr.Read())
                {
                    Advert objAdvert = new Advert();
                    AdvertLayer.SetReaderInfoFromRowWithFeatures(dr, objAdvert);
                    lstAdvert.Add(objAdvert);

                }

                // Next Result is the total number of recrods
                dr.NextResult();
                while (dr.Read())
                {
                    // Get the total number of records in the search for paging
                    totalRecord = Convert.ToInt32(dr["TotalRecords"].ToString());
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally
            {
                if (dr != null) { dr.Close(); }
                if (Con != null) { Con.Close(); }
            }

            return lstAdvert;
        }


        public static List<AdvertImage> GetAdvertImageByAdvertId(int AdvertId)
        {

            string ConnectionString = ConfigurationManager.ConnectionStrings["GSEMART_DBSERVER"].ConnectionString;
            SqlConnection Con = new SqlConnection(ConnectionString);

            SqlCommand dbCommand = null;
            SqlDataReader dr = null;

            List<AdvertImage> lstAdvertImage = new List<AdvertImage>();

            try
            {

                // Connect to the Database
                Con.Open();

                // Create the command Object
                dbCommand = Con.CreateCommand();
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.CommandText = "prSelAdvertImageByAdvertId";
                dbCommand.Parameters.AddWithValue("AdvertId", AdvertId);

                // Execute command 
                dr = dbCommand.ExecuteReader();

                
                //Set Output  and add to the list 
                while (dr.Read())
                {
                    AdvertImage objAdvertImage = new AdvertImage();
                    objAdvertImage.AdvertImageId = Convert.ToInt32(dr["AdvertImageId"].ToString());
                    objAdvertImage.AdvertId = Convert.ToInt32(dr["AdvertId"].ToString());
                    objAdvertImage.Description = dr["Description"].ToString();
                    objAdvertImage.Image = (byte[])(dr["Image"]);
                    objAdvertImage.ContentType = dr["ContentType"].ToString();
                    objAdvertImage.CreatedDate = Convert.ToDateTime(dr["CreatedDate"].ToString());
                    objAdvertImage.InUseYN = Convert.ToBoolean(dr["InUseYN"].ToString());
                    objAdvertImage.IsDefaultYN = Convert.ToBoolean(dr["IsDefaultYN"].ToString());
                    lstAdvertImage.Add(objAdvertImage);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally
            {
                if (dr != null) { dr.Close(); }
                if (Con != null) { Con.Close(); }
            }

            return lstAdvertImage;
        }



        public static int GetTotalAdvertQuantity(bool NewYN)
        {
            int total = 0;

            string ConnectionString = ConfigurationManager.ConnectionStrings["GSEMART_DBSERVER"].ConnectionString;
            SqlConnection Con = new SqlConnection(ConnectionString);

            SqlCommand dbCommand = null;
            SqlDataReader dr = null;

            try
            {

                // Connect to the Database
                Con.Open();

                // Create the command Object
                dbCommand = Con.CreateCommand();
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.CommandText = "prSelTotalAdvertQuantity";
                dbCommand.Parameters.AddWithValue("NewYN", NewYN);

                // Execute command 
                dr = dbCommand.ExecuteReader();

                //Set Output
                while (dr.Read())
                {
                    total = Convert.ToInt32(dr["total"]);
                }

            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally
            {
                if (dr != null) { dr.Close(); }
                if (Con != null) { Con.Close(); }
            }

            return total;
        }

        
        public static List<AdvertFeature> GetAdvertFeatureByAdvertId(int AdvertId)
        {


            string ConnectionString = ConfigurationManager.ConnectionStrings["GSEMART_DBSERVER"].ConnectionString;
            SqlConnection Con = new SqlConnection(ConnectionString);

            SqlCommand dbCommand = null;
            SqlDataReader dr = null;

            List<AdvertFeature> lstAdvertFeature = new List<AdvertFeature>();

            try
            {

                // Connect to the Database
                Con.Open();

                // Create the command Object
                dbCommand = Con.CreateCommand();
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.CommandText = "prSelAdvertFeatureByAdvertId";
                dbCommand.Parameters.AddWithValue("AdvertId", AdvertId);

                // Execute command 
                dr = dbCommand.ExecuteReader();

                //Set Output  and add to the list 
                while (dr.Read())
                {
                    AdvertFeature objAdvertFeature = new AdvertFeature();
                    objAdvertFeature.Description = dr["Description"].ToString();
                    objAdvertFeature.Value = dr["Value"].ToString();

                    lstAdvertFeature.Add(objAdvertFeature);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally
            {
                if (dr != null) { dr.Close(); }
                if (Con != null) { Con.Close(); }
            }

            return lstAdvertFeature;
        }

        public static AdvertImage GetAdvertImageById(int AdvertImageId)
        {

            string ConnectionString = ConfigurationManager.ConnectionStrings["GSEMART_DBSERVER"].ConnectionString;
            SqlConnection Con = new SqlConnection(ConnectionString);

            SqlCommand dbCommand = null;
            SqlDataReader dr = null;

            AdvertImage objAdvertImage = new AdvertImage();
            
            
            try
            {

                // Connect to the Database
                Con.Open();

                // Create the command Object
                dbCommand = Con.CreateCommand();
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.CommandText = "prSelAdvertImageById";
                dbCommand.Parameters.AddWithValue("AdvertImageId", AdvertImageId);

                // Execute command 
                dr = dbCommand.ExecuteReader();

                //Set Output
                while (dr.Read())
                {
                    //Set Output            
                    objAdvertImage.AdvertImageId = Convert.ToInt32(dr["AdvertImageId"].ToString());
                    objAdvertImage.AdvertId = Convert.ToInt32(dr["AdvertId"].ToString());
                    objAdvertImage.Description = dr["Description"].ToString();
                    objAdvertImage.Image = (byte[])(dr["Image"]);
                    objAdvertImage.ContentType = dr["ContentType"].ToString();
                    objAdvertImage.CreatedDate = Convert.ToDateTime(dr["CreatedDate"].ToString());
                    objAdvertImage.InUseYN = Convert.ToBoolean(dr["InUseYN"].ToString());
                }
            }
            catch (Exception ex)
            {
                objAdvertImage.RespCode = 1;
                objAdvertImage.RespDesc = ex.ToString();
            }
            finally
            {
                if (dr != null) { dr.Close(); }
                if (Con != null) { Con.Close(); }
            }
            return objAdvertImage;
        }





        public static void GetAdvertSpecsByAdvertId(int AdvertId, Advert objAdvert)
        {

            string ConnectionString = ConfigurationManager.ConnectionStrings["GSEMART_DBSERVER"].ConnectionString;
            SqlConnection Con = new SqlConnection(ConnectionString);

            SqlCommand dbCommand = null;
            SqlDataReader dr = null;

            try
            {

                // Connect to the Database
                Con.Open();

                // Create the command Object
                dbCommand = Con.CreateCommand();
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.CommandText = "prSelAdvertSpecsByAdvertId";
                dbCommand.Parameters.AddWithValue("AdvertID", AdvertId);

                // Execute command 
                dr = dbCommand.ExecuteReader();

                
                int cnt = 0;

                //Set Output  and add to the list 
                while (dr.Read())
                {
                    switch (cnt)
                    {
                        case 0:
                            objAdvert.AdvertGSE.SpecId1 = dr["SpecificationId"].ToString();
                            objAdvert.AdvertGSE.SpecDescription1 = dr["SpecificationDescription"].ToString();
                            objAdvert.AdvertGSE.SpecOptionId1 = dr["SpecificationOptionId"].ToString();
                            objAdvert.AdvertGSE.SpecOptionDescription1 = dr["SpecificationOptionDescription"].ToString();
                            break;

                        case 1:
                            objAdvert.AdvertGSE.SpecId2 = dr["SpecificationId"].ToString();
                            objAdvert.AdvertGSE.SpecDescription2 = dr["SpecificationDescription"].ToString();
                            objAdvert.AdvertGSE.SpecOptionId2 = dr["SpecificationOptionId"].ToString();
                            objAdvert.AdvertGSE.SpecOptionDescription2 = dr["SpecificationOptionDescription"].ToString();
                            break;

                        case 2:
                            objAdvert.AdvertGSE.SpecId3 = dr["SpecificationId"].ToString();
                            objAdvert.AdvertGSE.SpecDescription3 = dr["SpecificationDescription"].ToString();
                            objAdvert.AdvertGSE.SpecOptionId3 = dr["SpecificationOptionId"].ToString();
                            objAdvert.AdvertGSE.SpecOptionDescription3 = dr["SpecificationOptionDescription"].ToString();
                            break;

                        default:
                            break;
                    }

                    // Increment the counter
                    cnt++;

                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally
            {
                if (dr != null) { dr.Close(); }
                if (Con != null) { Con.Close(); }
            }

        }

        public static void GetAdvertQtysByAdvertId(int AdvertId, Advert objAdvert)
        {

            string ConnectionString = ConfigurationManager.ConnectionStrings["GSEMART_DBSERVER"].ConnectionString;
            SqlConnection Con = new SqlConnection(ConnectionString);

            SqlCommand dbCommand = null;
            SqlDataReader dr = null;

            try
            {

                // Connect to the Database
                Con.Open();

                // Create the command Object
                dbCommand = Con.CreateCommand();
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.CommandText = "prSelAdvertQtysByAdvertId";
                dbCommand.Parameters.AddWithValue("AdvertID", AdvertId);

                // Execute command 
                dr = dbCommand.ExecuteReader();


                int cnt = 0;

                //Set Output  and add to the list 
                while (dr.Read())
                {
                    switch (cnt)
                    {
                        case 0:
                            objAdvert.AdvertGSE.QtyId1 = dr["QuantityId"].ToString();
                            objAdvert.AdvertGSE.QtyDescription1 = dr["QuantityDescription"].ToString();
                            if (dr["MetricValue"] != DBNull.Value)
                            {
                                objAdvert.AdvertGSE.QtyValue1 = Convert.ToSingle(dr["MetricValue"]);
                            }
                            else
                            {
                                objAdvert.AdvertGSE.QtyValue1 = -1;
                            }

                            break;

                        case 1:
                            objAdvert.AdvertGSE.QtyId2 = dr["QuantityId"].ToString();
                            objAdvert.AdvertGSE.QtyDescription2 = dr["QuantityDescription"].ToString();
                            if (dr["MetricValue"] != DBNull.Value)
                            {
                                objAdvert.AdvertGSE.QtyValue2 = Convert.ToSingle(dr["MetricValue"]);
                            }
                            else
                            {
                                objAdvert.AdvertGSE.QtyValue2 = -1;
                            }
                            break;

                        default:
                            break;
                    }

                    // Increment the counter
                    cnt++;

                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally
            {
                if (dr != null) { dr.Close(); }
                if (Con != null) { Con.Close(); }
            }

        }


        public static Advert GetAdvertById(int AdvertId)
        {

            string ConnectionString = ConfigurationManager.ConnectionStrings["GSEMART_DBSERVER"].ConnectionString;
            SqlConnection Con = new SqlConnection(ConnectionString);

            SqlCommand dbCommand = null;
            SqlDataReader dr = null;

            Advert objAdvert = new Advert();
 
            try
            {

                // Connect to the Database
                Con.Open();

                // Create the command Object
                dbCommand = Con.CreateCommand();
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.CommandText = "prSelAdvertById";
                dbCommand.Parameters.AddWithValue("AdvertID", AdvertId);

                // Execute command 
                dr = dbCommand.ExecuteReader();

                //Set Output
                while (dr.Read())
                {
                    AdvertLayer.SetReaderInfo(dr, objAdvert);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally
            {
                if (dr != null) { dr.Close(); }
                if (Con != null) { Con.Close(); }
            }

            // Go get the specs for this advert as well
            GetAdvertSpecsByAdvertId(AdvertId, objAdvert);
            GetAdvertQtysByAdvertId(AdvertId, objAdvert);
            return objAdvert;

        }


        public static List<Advert> GetTopAdvertListing()
        {

            string ConnectionString = ConfigurationManager.ConnectionStrings["GSEMART_DBSERVER"].ConnectionString;
            SqlConnection Con = new SqlConnection(ConnectionString);

            SqlCommand dbCommand = null;
            SqlDataReader dr = null;

            List<Advert> lstAdvert = new List<Advert>();
            
            try
            {

                // Connect to the Database
                Con.Open();

                // Create the command Object
                dbCommand = Con.CreateCommand();
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.CommandText = "prSelTopAdvertListing";
                
                // Execute command 
                dr = dbCommand.ExecuteReader();

                while (dr.Read())
                {

                    Advert objAdvert = new Advert();
                    AdvertLayer.SetReaderInfoFromRow(dr, objAdvert);
                    lstAdvert.Add(objAdvert);
                
                }

            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally
            {
                if (dr != null){dr.Close();}
                if (Con != null){Con.Close();}
            }

            return lstAdvert;
        }

        private static void SetReaderInfo(SqlDataReader dr, Advert objAdvert)
        {
            objAdvert.AdvertId = Convert.ToInt32(dr["AdvertID"].ToString());
            objAdvert.AccountId = Convert.ToInt32(dr["AccountId"].ToString());
            objAdvert.Title = dr["Title"].ToString();
            objAdvert.ShortDescription = dr["ShortDescription"].ToString();
            objAdvert.LongDescription = dr["LongDescription"].ToString();
            objAdvert.ASAMemberYN = Convert.ToBoolean(dr["ASAMemberYN"].ToString());
            objAdvert.NewYN = Convert.ToBoolean(dr["NewYN"].ToString());

            Category objCategory = new Category();
            objCategory.CategoryId = dr["CategoryId"].ToString();
            objCategory.Description = dr["CatDesc"].ToString();
            objAdvert.Category = objCategory;
            //objAdvert.Age = Convert.ToInt32(dr["Age"].ToString());
            switch (objAdvert.Category.CategoryId)
            {
                case "GS":
                    AdvertGSE objGSE = new AdvertGSE();
                    objGSE.Manufacturer = dr["Manufacturer"].ToString();
                    // objGSE.DateofRegistration = Convert.ToDateTime(dr["DateofRegistration"].ToString());
                    objGSE.Year = dr["Year"].ToString();
                    objGSE.GSETypeId = Convert.ToInt32(dr["GSETypeId"]);

                    objAdvert.AdvertGSE = objGSE;
                    objAdvert.AdvertGSE.GSETypeDescription = dr["GSETypeDescription"].ToString();
                    objAdvert.AdvertGSE.AvailabilityId = dr["AdvertAvailabilityId"].ToString();
                    objAdvert.AdvertGSE.AvailabilityDescription = dr["AvailabilityDescription"].ToString();
                    objAdvert.AdvertGSE.ForSaleYN = Convert.ToBoolean(dr["ForSaleYN"]);
                    objAdvert.AdvertGSE.ForRentYN = Convert.ToBoolean(dr["ForRentYN"]);
                    objAdvert.AdvertGSE.ForLeaseYN = Convert.ToBoolean(dr["ForLeaseYN"]);

                    // Get the feature list
                    objGSE.AdvertFeature = GetAdvertFeatureByAdvertId(objAdvert.AdvertId);

                    break;

                case "SP":
                    AdvertSpares obj = new AdvertSpares();
                    obj.ProductId = dr["ProductId"].ToString();
                    obj.Supplier = dr["Supplier"].ToString();
                    objAdvert.AdvertSpares = obj;
                    break;
                case "TL":
                    AdvertTool objAdTool = new AdvertTool();
                    objAdTool.Manufacturer = dr["Manufacturer"].ToString();
                    objAdTool.ProductId = dr["ProductId"].ToString();
                    objAdTool.Supplier = dr["Supplier"].ToString();
                    objAdTool.Year = dr["Year"].ToString();
                    objAdvert.AdvertTool = objAdTool;
                    break;
            }

            AdvertStatus objAdvertStatus = new AdvertStatus();
            objAdvertStatus.AdvertStatusId = dr["AdvertStatusId"].ToString();
            objAdvertStatus.Description = dr["StatusDesc"].ToString();
            objAdvert.AdvertStatus = objAdvertStatus;

            Country objCountry = new Country();
            objCountry.CountryId = dr["CountryId"].ToString();
            objCountry.CountryName = dr["CountryName"].ToString();
            objCountry.EUYN = Convert.ToBoolean(dr["EUYN"]);
            objCountry.CurrencyId = dr["CurrencyId"].ToString();
            objAdvert.Country = objCountry;

            Currency objCurrency = new Currency();
            objCurrency.CurrencyId = dr["CurrencyID"].ToString();
            objCurrency.Description = dr["CurrencyDesc"].ToString();
            objCurrency.DecimalUnicode = dr["DecimalUnicode"].ToString();
            objAdvert.Currency = objCurrency;

            //objAdvert.Category = CategoryLayer.GetCategoryById(dr["CategoryId"].ToString());
            //objAdvert.AdvertStatus = AdvertLayer.GetAdvertStatusById(dr["AdvertStatusId"].ToString());
            //objAdvert.Country = CountryLayer.GetCountryById(dr["CountryId"].ToString());
            //objAdvert.Currency = CurrencyLayer.GetCurrencyById(dr["CurrencyId"].ToString());

            objAdvert.Location = dr["Location"].ToString();
            objAdvert.ShowPriceYN = Convert.ToBoolean(dr["ShowPriceYN"].ToString());
            if (objAdvert.ShowPriceYN == true)
            {
                objAdvert.Price = Convert.ToDecimal(dr["Price"].ToString());
                objAdvert.PriceInEuro = Convert.ToDecimal(dr["PriceInEuro"]);
            }
            else
            {
                objAdvert.Price = 0;
                objAdvert.PriceInEuro = 0;
            }
            objAdvert.Quantity = Convert.ToInt32(dr["Quantity"]);
            objAdvert.ContactName = dr["ContactName"].ToString();
            objAdvert.Telephone = dr["Telephone"].ToString();
            objAdvert.Fax = dr["Fax"].ToString();
            objAdvert.Mobile = dr["Mobile"].ToString();
            objAdvert.EmailAddress = dr["EmailAddress"].ToString();
            objAdvert.URL = dr["URL"].ToString();

            if (dr["ExpiryDate"] != DBNull.Value)
            {
                objAdvert.ExpiryDate = Convert.ToDateTime(dr["ExpiryDate"].ToString());
            }
            objAdvert.CreatedDate = Convert.ToDateTime(dr["CreatedDate"].ToString());
            objAdvert.LastModifiedDate = Convert.ToDateTime(dr["LastModifiedDate"].ToString());

            objAdvert.Owner = dr["Owner"].ToString();
            objAdvert.Counter = Convert.ToInt32(dr["Counter"]);
            objAdvert.UserAccountTypeId = Convert.ToInt32(dr["UserAccountTypeID"]);
            objAdvert.GUID = dr["GUID"].ToString();

        }

        private static void SetReaderInfoFromRow(SqlDataReader dataRow, Advert objAdvert)
        {
            objAdvert.AdvertId = Convert.ToInt32(dataRow["AdvertID"].ToString());
            objAdvert.AccountId = Convert.ToInt32(dataRow["AccountId"].ToString());
            objAdvert.Title = dataRow["Title"].ToString();
            objAdvert.ShortDescription = dataRow["ShortDescription"].ToString();
            objAdvert.LongDescription = dataRow["LongDescription"].ToString();
            objAdvert.ASAMemberYN = Convert.ToBoolean(dataRow["ASAMemberYN"].ToString());
            objAdvert.NewYN = Convert.ToBoolean(dataRow["NewYN"].ToString());

            Category objCategory = new Category();
            objCategory.CategoryId = dataRow["CategoryId"].ToString();
            objCategory.Description = dataRow["CatDesc"].ToString();
            objAdvert.Category = objCategory;
            //objAdvert.Age = Convert.ToInt32(dataRow["Age"].ToString());
            switch (objAdvert.Category.CategoryId)
            {
                case "GS":
                    AdvertGSE objGSE = new AdvertGSE();
                    objGSE.Manufacturer = dataRow["Manufacturer"].ToString();
                    // objGSE.DateofRegistration = Convert.ToDateTime(dataRow["DateofRegistration"].ToString());
                    objGSE.Year = dataRow["Year"].ToString();
                    objGSE.AvailabilityId = dataRow["AdvertAvailabilityId"].ToString();
                    objGSE.AvailabilityDescription = dataRow["AvailabilityDescription"].ToString();
                    objGSE.ForSaleYN = Convert.ToBoolean(dataRow["ForSaleYN"]);
                    objGSE.ForRentYN = Convert.ToBoolean(dataRow["ForRentYN"]);
                    objGSE.ForLeaseYN = Convert.ToBoolean(dataRow["ForLeaseYN"]);
                    objAdvert.AdvertGSE = objGSE;
                    break;

                case "SP":
                    AdvertSpares obj = new AdvertSpares();
                    obj.ProductId = dataRow["ProductId"].ToString();
                    obj.Supplier = dataRow["Supplier"].ToString();
                    objAdvert.AdvertSpares = obj;
                    break;
                case "TL":
                    AdvertTool objAdTool = new AdvertTool();
                    objAdTool.Manufacturer = dataRow["Manufacturer"].ToString();
                    objAdTool.ProductId = dataRow["ProductId"].ToString();
                    objAdTool.Supplier = dataRow["Supplier"].ToString();
                    objAdTool.Year = dataRow["Year"].ToString();
                    objAdvert.AdvertTool = objAdTool;
                    break;
            }

            AdvertStatus objAdvertStatus = new AdvertStatus();
            objAdvertStatus.AdvertStatusId = dataRow["AdvertStatusId"].ToString();
            objAdvertStatus.Description = dataRow["StatusDesc"].ToString();
            objAdvert.AdvertStatus = objAdvertStatus;

            Country objCountry = new Country();
            objCountry.CountryId = dataRow["CountryId"].ToString();
            objCountry.CountryName = dataRow["CountryName"].ToString();
            objCountry.EUYN = Convert.ToBoolean(dataRow["EUYN"]);
            objCountry.CurrencyId = dataRow["CurrencyId"].ToString();
            objAdvert.Country = objCountry;

            Currency objCurrency = new Currency();
            objCurrency.CurrencyId = dataRow["CurrencyID"].ToString();
            objCurrency.Description = dataRow["CurrencyDesc"].ToString();
            objCurrency.DecimalUnicode = dataRow["DecimalUnicode"].ToString();
            objAdvert.Currency = objCurrency;

            objAdvert.Location = dataRow["Location"].ToString();
            objAdvert.ShowPriceYN = Convert.ToBoolean(dataRow["ShowPriceYN"].ToString());

            if (objAdvert.ShowPriceYN == true)
            {
                objAdvert.Price = Convert.ToDecimal(dataRow["Price"].ToString());
                objAdvert.PriceInEuro = Convert.ToDecimal(dataRow["PriceInEuro"]);
            }
            else
            {
                objAdvert.Price = 0;
                objAdvert.PriceInEuro = 0;
            }
            objAdvert.Quantity = Convert.ToInt32(dataRow["Quantity"]);
            objAdvert.ContactName = dataRow["ContactName"].ToString();
            objAdvert.Telephone = dataRow["Telephone"].ToString();
            objAdvert.Fax = dataRow["Fax"].ToString();
            objAdvert.Mobile = dataRow["Mobile"].ToString();
            objAdvert.EmailAddress = dataRow["EmailAddress"].ToString();
            objAdvert.URL = dataRow["URL"].ToString();

            if (dataRow["ExpiryDate"] != DBNull.Value)
            {
                objAdvert.ExpiryDate = Convert.ToDateTime(dataRow["ExpiryDate"].ToString());
            }

            objAdvert.CreatedDate = Convert.ToDateTime(dataRow["CreatedDate"].ToString());
            objAdvert.LastModifiedDate = Convert.ToDateTime(dataRow["LastModifiedDate"].ToString());

            objAdvert.Owner = dataRow["Owner"].ToString();
            objAdvert.Counter = Convert.ToInt32(dataRow["Counter"]);
            objAdvert.UserAccountTypeId = Convert.ToInt32(dataRow["UserAccountTypeID"]);

            //Adding image data if there is an image
            if (dataRow["AdvertImageId"] != DBNull.Value)
            {
                AdvertImage objAdvertImage = new AdvertImage();

                objAdvertImage.AdvertImageId = Convert.ToInt32(dataRow["AdvertImageId"]);
                objAdvertImage.AdvertId = Convert.ToInt32(dataRow["AdvertImageAdvertId"]);
                objAdvertImage.Description = dataRow["Description"].ToString();
                objAdvertImage.ContentType = dataRow["ContentType"].ToString();
                objAdvertImage.CreatedDate = Convert.ToDateTime(dataRow["ImageCreatedDate"].ToString());
                objAdvertImage.InUseYN = Convert.ToBoolean(dataRow["InUseYN"].ToString());
                objAdvertImage.IsDefaultYN = Convert.ToBoolean(dataRow["IsDefaultYN"].ToString());

                objAdvert.AdvertImage.Add(objAdvertImage);
            }
        }

/*
        public static List<AdvertStatus> GetAdvertStatus()
        {
            List<AdvertStatus> lstAdvertStatus = new List<AdvertStatus>();

            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelAdvertStatus");

            IDataReader dr = null;

            try
            {
                // Execute command
                dr = db.ExecuteReader(dbCommand);

                //Set Output  and add to the list 
                while (dr.Read())
                {
                    AdvertStatus objAdvertStatus = new AdvertStatus();
                    objAdvertStatus.AdvertStatusId = dr["AdvertStatusId"].ToString();
                    objAdvertStatus.Description = dr["Description"].ToString();
                    lstAdvertStatus.Add(objAdvertStatus);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally
            {
                dr.Close();
            }

            
            return lstAdvertStatus;

        }

        public static AdvertStatus GetAdvertStatusById(string AdvertStatusId)
        {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelAdvertStatusById");

            //Adding Input parameters    
            db.AddInParameter(dbCommand, "AdvertStatusId", DbType.AnsiString, AdvertStatusId);
            IDataReader dr = null;
            AdvertStatus objAdvertStatus = new AdvertStatus();
            try
            {
                // Execute command
                dr = db.ExecuteReader(dbCommand);
                //Set Output
                while (dr.Read())
                {
                    //Set Output            
                    objAdvertStatus.AdvertStatusId = dr["AdvertStatusId"].ToString();
                    objAdvertStatus.Description = dr["Description"].ToString();
                }
            }
            catch (Exception ex)
            {
                objAdvertStatus.RespCode = 1;
                objAdvertStatus.RespDesc = ex.ToString();
            }
            finally
            {
                dr.Close();
            }
            return objAdvertStatus;
        }






        
        public static void UpdateAdvertStatus(Advert objAdvert)
        {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prUpdAdvertStatus");
            //Adding Input parameters   
            db.AddInParameter(dbCommand, "AdvertID", DbType.Int32, objAdvert.AdvertId);
            db.AddInParameter(dbCommand, "AdvertStatusId", DbType.String, objAdvert.AdvertStatus.AdvertStatusId);
            db.ExecuteNonQuery(dbCommand);
        }

        /// <summary>
        /// Get Advert Sold Date
        /// </summary>
        /// <param name="AdvertId">Advert ID</param>
        /// <returns>Sold Date in DateTime</returns>
        public static DateTime GetAdvertSoldDate(int AdvertId){
            DateTime dtSoldOut = new DateTime();
            IDataReader dr = null;

            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelAdvertSoldDate");
            
            db.AddInParameter(dbCommand, "AdvertId", DbType.Int32, AdvertId);

            try
            {
                // Execute command
                dr = db.ExecuteReader(dbCommand);

                //Set Output
                while (dr.Read())
                {
                    //Set Output            
                    dtSoldOut = Convert.ToDateTime(dr["SoldOut"]);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally {
                dr.Close();
            }
            
            return dtSoldOut;
        }

        public static List<Advert> GetAdvertByAccountId(int rowPerPage, int rowStart, int AccountId, out int totalRecord)
        {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelAdvertByAccountId");
            
            //Adding Input parameters
            db.AddInParameter(dbCommand, "RowsPerPage", DbType.Int32, rowPerPage);
            db.AddInParameter(dbCommand, "RowStart", DbType.Int32, rowStart);
            db.AddInParameter(dbCommand, "AccountId", DbType.Int32, AccountId);

            List<Advert> lstAdvert = new List<Advert>();
            DataSet ds = new DataSet();

            try
            {
                // Execute command
                ds = db.ExecuteDataSet(dbCommand);

                DataTable dataTable = ds.Tables[0]; //advert records

                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    Advert objAdvert = new Advert();
                    DataRow AdvertDataRow;

                    AdvertDataRow = dataTable.Rows[i];
                    AdvertLayer.SetReaderInfoFromRow(AdvertDataRow, objAdvert);

                    //Adding AdvertTransaction Status Code
                    if (AdvertDataRow["StatusCode"] != DBNull.Value)
                    {
                        AdvertTransaction objAdvertTransaction = new AdvertTransaction();
                        objAdvertTransaction.StatusCode = Convert.ToInt32(AdvertDataRow["StatusCode"]);
                        objAdvert.AdvertTransaction = objAdvertTransaction;
                    }

                    lstAdvert.Add(objAdvert);
                }

                //returning total number of records, for paging purposes
                if (ds.Tables[1].Rows[0]["totalResult"] != null)
                    totalRecord = Convert.ToInt32(ds.Tables[1].Rows[0]["totalResult"]);
                else
                    totalRecord = 0;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally
            {
                ds.Clear();
            }

            return lstAdvert;

        }


        // Jim Brock
        // The new filter search for adverts including New equipment and searching by quantities and specifications
        //
        //
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
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelAdvertByFilterSearch");

            //Adding Input parameters
            db.AddInParameter(dbCommand, "RowsPerPage", DbType.Int32, rowPerPage);
            db.AddInParameter(dbCommand, "RowStart", DbType.Int32, rowStart);
            db.AddInParameter(dbCommand, "CountryId", DbType.String, CountryId);
            db.AddInParameter(dbCommand, "RegionId", DbType.String, RegionId);
            db.AddInParameter(dbCommand, "GSETypeId", DbType.Int32, GSETypeId);
            db.AddInParameter(dbCommand, "ASAMembersOnlyYN", DbType.Boolean, ASAMembersOnlyYN);
            db.AddInParameter(dbCommand, "SortBy", DbType.String, SortBy);

            db.AddInParameter(dbCommand, "NewYN", DbType.Boolean, NewYN);
            db.AddInParameter(dbCommand, "UsedYN", DbType.Boolean, UsedYN);
            db.AddInParameter(dbCommand, "ForRentYN", DbType.Boolean, ForRentYN);
            db.AddInParameter(dbCommand, "ForLeaseYN", DbType.Boolean, ForLeaseYN);
            db.AddInParameter(dbCommand, "ForSaleYN", DbType.Boolean, ForSaleYN);

            db.AddInParameter(dbCommand, "QtyId1", DbType.String, QtyId1);
            db.AddInParameter(dbCommand, "QtyUnitId1", DbType.String, QtyUnitId1);
            db.AddInParameter(dbCommand, "QtyValue1", DbType.Single, QtyValue1);

            db.AddInParameter(dbCommand, "QtyId2", DbType.String, QtyId2);
            db.AddInParameter(dbCommand, "QtyUnitId2", DbType.String, QtyUnitId2);
            db.AddInParameter(dbCommand, "QtyValue2", DbType.Single, QtyValue2);

            db.AddInParameter(dbCommand, "SpecId1", DbType.String, SpecId1);
            db.AddInParameter(dbCommand, "SpecOptionId1", DbType.String,SpecOptionId1);

            db.AddInParameter(dbCommand, "SpecId2", DbType.String, SpecId2);
            db.AddInParameter(dbCommand, "SpecOptionId2", DbType.String, SpecOptionId2);

            db.AddInParameter(dbCommand, "SpecId3", DbType.String, SpecId3);
            db.AddInParameter(dbCommand, "SpecOptionId3", DbType.String, SpecOptionId3);

            db.AddInParameter(dbCommand, "Manufacturer", DbType.String, Manufacturer);
            db.AddInParameter(dbCommand, "AccountId", DbType.Int32, AccountId);
                       

            List<Advert> lstAdvert = new List<Advert>();
            DataSet ds = new DataSet();

            try
            {
                // Execute command    
                DateTime a = DateTime.Now;
                ds = db.ExecuteDataSet(dbCommand);
                DateTime b = DateTime.Now;
                _sqlExecutionTime = b - a;

                DataTable dataTable = ds.Tables[0]; //advert records

                DateTime c = DateTime.Now;
                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    Advert objAdvert = new Advert();
                    DataRow AdvertDataRow;

                    AdvertDataRow = dataTable.Rows[i];
                    AdvertLayer.SetReaderInfoFromRowWithFeatures(AdvertDataRow, objAdvert);
                    lstAdvert.Add(objAdvert);
                }
                DateTime d = DateTime.Now;
                _scriptExecutionTime = d - c;

                //returning total number of records, for paging purposes
                if (ds.Tables[1].Rows[0]["totalResult"] != null)
                    totalRecord = Convert.ToInt32(ds.Tables[1].Rows[0]["totalResult"]);
                else
                    totalRecord = 0;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally
            {
                ds.Clear();
            }

            return lstAdvert;
        }



        public static List<Advert> GetAdvertBySearch(int rowPerPage, int rowStart, string CategoryId, string CountryId, string Location, string SearchAllFor, string SearchCurrencyID, decimal PriceFrom, decimal PriceTo, string SortBy, int GSETypeId, bool ASAMembersOnlyYN, out int totalRecord)
        {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelAdvertBySearch");

            if (SearchAllFor == null || SearchAllFor == "")
            {
                SearchAllFor = "\"\"";
            }

            //Adding Input parameters
            db.AddInParameter(dbCommand, "RowsPerPage", DbType.Int32, rowPerPage);
            db.AddInParameter(dbCommand, "RowStart", DbType.Int32, rowStart);
            db.AddInParameter(dbCommand, "CategoryId", DbType.String, CategoryId);
            db.AddInParameter(dbCommand, "CountryId", DbType.String, CountryId);
            db.AddInParameter(dbCommand, "Location", DbType.String, Location);
            db.AddInParameter(dbCommand, "SearchAllFor", DbType.String, SearchAllFor);
            db.AddInParameter(dbCommand, "SearchCurrencyID", DbType.String, SearchCurrencyID);
            db.AddInParameter(dbCommand, "PriceFrom", DbType.Currency, PriceFrom);
            db.AddInParameter(dbCommand, "PriceTo", DbType.Currency, PriceTo);
            db.AddInParameter(dbCommand, "SortBy", DbType.String, SortBy);
            db.AddInParameter(dbCommand, "GSETypeId", DbType.Int32, GSETypeId);
            db.AddInParameter(dbCommand, "ASAMembersOnlyYN", DbType.Boolean, ASAMembersOnlyYN);


            List<Advert> lstAdvert = new List<Advert>();
            DataSet ds = new DataSet();

            try
            {
                // Execute command    
                DateTime a = DateTime.Now;
                ds = db.ExecuteDataSet(dbCommand);
                DateTime b = DateTime.Now;
                _sqlExecutionTime = b - a;
                
                DataTable dataTable = ds.Tables[0]; //advert records
                
                DateTime c = DateTime.Now;
                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    Advert objAdvert = new Advert();
                    DataRow AdvertDataRow;

                    AdvertDataRow = dataTable.Rows[i];
                    AdvertLayer.SetReaderInfoFromRow(AdvertDataRow, objAdvert);
                    lstAdvert.Add(objAdvert);
                }
                DateTime d = DateTime.Now;
                _scriptExecutionTime = d - c;

                //returning total number of records, for paging purposes
                if (ds.Tables[1].Rows[0]["totalResult"] != null)
                    totalRecord = Convert.ToInt32(ds.Tables[1].Rows[0]["totalResult"]);
                else
                    totalRecord = 0;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally
            {
                ds.Clear();
            }

            return lstAdvert;
        }

        
        public static List<Advert> GetAllAdvertListing(bool NewYN, bool UsedYN)
        {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelAllAdvertListing");

            db.AddInParameter(dbCommand, "NewYN", DbType.Boolean, NewYN);
            db.AddInParameter(dbCommand, "UsedYN", DbType.Boolean, UsedYN);


            List<Advert> lstAdvert = new List<Advert>();
            DataSet ds = new DataSet();

            try
            {
                // Execute command    
                ds = db.ExecuteDataSet(dbCommand);

                DataTable dataTable = ds.Tables[0]; //advert records

                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    Advert objAdvert = new Advert();
                    DataRow AdvertDataRow;

                    AdvertDataRow = dataTable.Rows[i];

                    objAdvert.AdvertId = Convert.ToInt32(AdvertDataRow["AdvertId"]);
                    objAdvert.Title = AdvertDataRow["Title"].ToString();
                    objAdvert.ContactName = AdvertDataRow["ContactName"].ToString();
                    objAdvert.Quantity = Convert.ToInt32(AdvertDataRow["Quantity"]);
                    objAdvert.Owner = AdvertDataRow["Owner"].ToString();
                    objAdvert.Country.CountryName = AdvertDataRow["CountryName"].ToString();
                    objAdvert.NewYN = Convert.ToBoolean(AdvertDataRow["NewYN"]);

                    lstAdvert.Add(objAdvert);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally
            {
                ds.Clear();
            }

            return lstAdvert;
        }






        private static void SetReaderInfoFromRow(DataRow dataRow, Advert objAdvert)
        {
            objAdvert.AdvertId = Convert.ToInt32(dataRow["AdvertID"].ToString());
            objAdvert.AccountId = Convert.ToInt32(dataRow["AccountId"].ToString());
            objAdvert.Title = dataRow["Title"].ToString();
            objAdvert.ShortDescription = dataRow["ShortDescription"].ToString();
            objAdvert.LongDescription = dataRow["LongDescription"].ToString();
            objAdvert.ASAMemberYN = Convert.ToBoolean(dataRow["ASAMemberYN"].ToString());
            objAdvert.NewYN = Convert.ToBoolean(dataRow["NewYN"].ToString());

            Category objCategory = new Category();
            objCategory.CategoryId = dataRow["CategoryId"].ToString();
            objCategory.Description = dataRow["CatDesc"].ToString();
            objAdvert.Category = objCategory;
            //objAdvert.Age = Convert.ToInt32(dataRow["Age"].ToString());
            switch (objAdvert.Category.CategoryId)
            {
                case "GS":
                    AdvertGSE objGSE = new AdvertGSE();
                    objGSE.Manufacturer = dataRow["Manufacturer"].ToString();
                    // objGSE.DateofRegistration = Convert.ToDateTime(dataRow["DateofRegistration"].ToString());
                    objGSE.Year = dataRow["Year"].ToString();
                    objGSE.AvailabilityId = dataRow["AdvertAvailabilityId"].ToString();
                    objGSE.AvailabilityDescription = dataRow["AvailabilityDescription"].ToString();
                    objGSE.ForSaleYN = Convert.ToBoolean(dataRow["ForSaleYN"]);
                    objGSE.ForRentYN = Convert.ToBoolean(dataRow["ForRentYN"]);
                    objGSE.ForLeaseYN = Convert.ToBoolean(dataRow["ForLeaseYN"]);
                    objAdvert.AdvertGSE = objGSE;
                    break;

                case "SP":
                    AdvertSpares obj = new AdvertSpares();
                    obj.ProductId = dataRow["ProductId"].ToString();
                    obj.Supplier = dataRow["Supplier"].ToString();
                    objAdvert.AdvertSpares = obj;
                    break;
                case "TL":
                    AdvertTool objAdTool = new AdvertTool();
                    objAdTool.Manufacturer = dataRow["Manufacturer"].ToString();
                    objAdTool.ProductId = dataRow["ProductId"].ToString();
                    objAdTool.Supplier = dataRow["Supplier"].ToString();
                    objAdTool.Year = dataRow["Year"].ToString();
                    objAdvert.AdvertTool = objAdTool;
                    break;
            }

            AdvertStatus objAdvertStatus = new AdvertStatus();
            objAdvertStatus.AdvertStatusId = dataRow["AdvertStatusId"].ToString();
            objAdvertStatus.Description = dataRow["StatusDesc"].ToString();
            objAdvert.AdvertStatus = objAdvertStatus;

            Country objCountry = new Country();
            objCountry.CountryId = dataRow["CountryId"].ToString();
            objCountry.CountryName = dataRow["CountryName"].ToString();
            objCountry.EUYN = Convert.ToBoolean(dataRow["EUYN"]);
            objCountry.CurrencyId = dataRow["CurrencyId"].ToString();
            objAdvert.Country = objCountry;

            Currency objCurrency = new Currency();
            objCurrency.CurrencyId = dataRow["CurrencyID"].ToString();
            objCurrency.Description = dataRow["CurrencyDesc"].ToString();
            objCurrency.DecimalUnicode = dataRow["DecimalUnicode"].ToString();
            objAdvert.Currency = objCurrency;

            objAdvert.Location = dataRow["Location"].ToString();
            objAdvert.ShowPriceYN = Convert.ToBoolean(dataRow["ShowPriceYN"].ToString());

            if (objAdvert.ShowPriceYN == true){
                objAdvert.Price = Convert.ToDecimal(dataRow["Price"].ToString());
                objAdvert.PriceInEuro = Convert.ToDecimal(dataRow["PriceInEuro"]);
            }
            else{
                objAdvert.Price = 0;
                objAdvert.PriceInEuro = 0;
            }
            objAdvert.Quantity = Convert.ToInt32(dataRow["Quantity"]);
            objAdvert.ContactName = dataRow["ContactName"].ToString();
            objAdvert.Telephone = dataRow["Telephone"].ToString();
            objAdvert.Fax = dataRow["Fax"].ToString();
            objAdvert.Mobile = dataRow["Mobile"].ToString();
            objAdvert.EmailAddress = dataRow["EmailAddress"].ToString();
            objAdvert.URL = dataRow["URL"].ToString();

            if (dataRow["ExpiryDate"] != DBNull.Value)
            {
                objAdvert.ExpiryDate = Convert.ToDateTime(dataRow["ExpiryDate"].ToString());
            }

            objAdvert.CreatedDate = Convert.ToDateTime(dataRow["CreatedDate"].ToString());
            objAdvert.LastModifiedDate = Convert.ToDateTime(dataRow["LastModifiedDate"].ToString());

            objAdvert.Owner = dataRow["Owner"].ToString();
            objAdvert.Counter = Convert.ToInt32(dataRow["Counter"]);
            objAdvert.UserAccountTypeId = Convert.ToInt32(dataRow["UserAccountTypeID"]);

            //Adding image data if there is an image
            if (dataRow["AdvertImageId"] != DBNull.Value)
            {
                AdvertImage objAdvertImage = new AdvertImage();

                objAdvertImage.AdvertImageId = Convert.ToInt32(dataRow["AdvertImageId"]);
                objAdvertImage.AdvertId = Convert.ToInt32(dataRow["AdvertImageAdvertId"]);
                objAdvertImage.Description = dataRow["Description"].ToString();
                objAdvertImage.ContentType = dataRow["ContentType"].ToString();
                objAdvertImage.CreatedDate = Convert.ToDateTime(dataRow["ImageCreatedDate"].ToString());
                objAdvertImage.InUseYN = Convert.ToBoolean(dataRow["InUseYN"].ToString());
                objAdvertImage.IsDefaultYN = Convert.ToBoolean(dataRow["IsDefaultYN"].ToString());
                
                objAdvert.AdvertImage.Add(objAdvertImage);
            }
        }

        /// <summary>
        /// Function to Add Advert Images
        /// </summary>
        /// <param name="objAdvertImage">AdvertImage</param>
        /// <returns>AdvertImage</returns>
        public static AdvertImage AddAdvertImage(AdvertImage objAdvertImage)
        {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prInsAdvertImage");

            //Adding Input parameters            
            db.AddInParameter(dbCommand, "AdvertId", DbType.Int32, objAdvertImage.AdvertId);
            db.AddInParameter(dbCommand, "Description", DbType.String, objAdvertImage.Description);
            db.AddInParameter(dbCommand, "Image", DbType.Binary, objAdvertImage.Image);
            db.AddInParameter(dbCommand, "ContentType", DbType.String, objAdvertImage.ContentType);
            //db.AddInParameter(dbCommand, "CreatedDate", DbType.DateTime, objAdvertImage.CreatedDate);
            db.AddInParameter(dbCommand, "InUseYN", DbType.Boolean, objAdvertImage.InUseYN);
            db.AddInParameter(dbCommand, "IsDefaultYN", DbType.Boolean, objAdvertImage.IsDefaultYN);

            //Adding Output parameters
            db.AddOutParameter(dbCommand, "AdvertImageID", DbType.Int32, 25);
            db.AddOutParameter(dbCommand, "RespCode", DbType.Int32, 100);
            db.AddOutParameter(dbCommand, "RespMsg", DbType.String, 500);


            try
            {
                // Execute
                db.ExecuteNonQuery(dbCommand);
                //Set Output for AddAdvertImage
                objAdvertImage.AdvertImageId = Convert.ToInt32(db.GetParameterValue(dbCommand, "AdvertImageID"));
                objAdvertImage.RespCode = Convert.ToInt32(db.GetParameterValue(dbCommand, "RespCode"));
                objAdvertImage.RespDesc = db.GetParameterValue(dbCommand, "RespMsg").ToString();

            }
            catch (Exception ex)
            {
                objAdvertImage.RespCode = 1;
                objAdvertImage.RespDesc = ex.ToString();
            }
            return objAdvertImage;
        }

        /// <summary>
        /// Insert new advert
        /// </summary>
        /// <param name="objAdvert">Advert</param>
        /// <returns>Advert</returns>
        public static Advert PlaceAdvert(Advert objAdvert)
        {
            Advert objAdv = new Advert();

            try
            {

                using (TransactionScope ts = new TransactionScope())
                {
                    //Add Main Advert details
                    objAdv = AddAdvertInfo(objAdvert);
                    if (objAdv.RespCode != 0)
                    {
                        throw new Exception(objAdv.RespDesc);
                    }
                    else
                    {
                        //Add additional Advert details depend on category
                        switch (objAdv.Category.CategoryId)
                        {
                            case "GS":
                                objAdvert.AdvertGSE.AdvertId = objAdv.AdvertId;
                                AdvertGSE objAdvGSE = AdvertGSELayer.AddAdvertGSE(objAdvert.AdvertGSE);
                                if (objAdvGSE.RespCode != 0)
                                {
                                    throw new Exception(objAdvGSE.RespDesc);
                                }
                                break;
                            case "SP":
                                objAdvert.AdvertSpares.AdvertId = objAdv.AdvertId;
                                AdvertSpares objAdvSpares = AdvertSparesLayer.AddAdvertSpares(objAdvert.AdvertSpares);
                                if (objAdvSpares.RespCode != 0)
                                {
                                    throw new Exception(objAdvSpares.RespDesc);
                                }
                                break;
                            case "TL":
                                objAdvert.AdvertTool.AdvertId = objAdv.AdvertId;
                                AdvertTool objAdvTool = AdvertToolLayer.AddAdvertTool(objAdvert.AdvertTool);
                                if (objAdvTool.RespCode != 0)
                                {
                                    throw new Exception(objAdvTool.RespDesc);
                                }
                                break;
                        }

                        //Add Advert Images

                        foreach (AdvertImage objAdvertImage in objAdvert.AdvertImage)
                        {
                            objAdvertImage.AdvertId = objAdv.AdvertId;
                            AdvertImage objAdvImage = AddAdvertImage(objAdvertImage);
                            if (objAdvImage.RespCode != 0)
                            {
                                throw new Exception(objAdvImage.RespDesc);
                            }
                        }
                    }
                    ts.Complete();

                    objAdv.RespCode = 0;
                    objAdv.RespDesc = "Advert placed successfully.";
                }
            }
            catch (Exception ex)
            {
                objAdv.RespCode = 1;
                objAdv.RespDesc = ex.ToString();
            }
            return objAdv;
        }

        /// <summary>
        /// Update existing advert
        /// </summary>
        /// <param name="objAdvert">Advert</param>
        /// <returns>Advert</returns>
        public static Advert UpdateAdvert(Advert objAdvert)
        {
            Advert objAdv = new Advert();

            try
            {
                using (TransactionScope ts = new TransactionScope())
                {
                    #region Add Main Advert details
                    objAdv = UpdateAdvertInfo(objAdvert);
                    
                    if (objAdv.RespCode != 0)
                    {
                        throw new Exception(objAdv.RespDesc);
                    }
                    else
                    {
                        #region Add additional Advert details depend on category
                        switch (objAdv.Category.CategoryId)
                        {
                            case "GS":
                                objAdvert.AdvertGSE.AdvertId = objAdv.AdvertId;
                                AdvertGSE objAdvGSE = AdvertGSELayer.UpdateAdvertGSE(objAdvert.AdvertGSE);
                                if (objAdvGSE.RespCode != 0)
                                {
                                    throw new Exception(objAdvGSE.RespDesc);
                                }
                                break;
                            case "SP":
                                objAdvert.AdvertSpares.AdvertId = objAdv.AdvertId;
                                AdvertSpares objAdvSpares = AdvertSparesLayer.UpdateAdvertSpares(objAdvert.AdvertSpares);
                                if (objAdvSpares.RespCode != 0)
                                {
                                    throw new Exception(objAdvSpares.RespDesc);
                                }
                                break;
                            case "TL":
                                objAdvert.AdvertTool.AdvertId = objAdv.AdvertId;
                                AdvertTool objAdvTool = AdvertToolLayer.UpdateAdvertTool(objAdvert.AdvertTool);
                                if (objAdvTool.RespCode != 0)
                                {
                                    throw new Exception(objAdvTool.RespDesc);
                                }
                                break;
                        }
                        #endregion

                        #region Deleting Existing Advert Images
                        //deleting previous Advert Images first before adding them back (still under transaction, so no worry :D)
                        DeleteAdvertImageByAdvertId(objAdv.AdvertId);
                        #endregion

                        #region Re-Adding Adver Images
                        //Add Advert Images
                        foreach (AdvertImage objAdvertImage in objAdvert.AdvertImage)
                        {
                            objAdvertImage.AdvertId = objAdv.AdvertId;
                            AdvertImage objAdvImage = AddAdvertImage(objAdvertImage);
                            if (objAdvImage.RespCode != 0)
                            {
                                throw new Exception(objAdvImage.RespDesc);
                            }
                        }
                        #endregion
                    }
                    #endregion
                    
                    ts.Complete();

                    objAdv.RespCode = 0;
                    objAdv.RespDesc = "Advert updated successfully.";
                }
            }
            catch (Exception ex)
            {
                objAdv.RespCode = 1;
                objAdv.RespDesc = ex.ToString();
            }
            return objAdv;
        }

        /// <summary>
        /// Function to delete advert image
        /// </summary>
        /// <param name="AdvertId"></param>
        /// <returns></returns>
        private static AdvertImage DeleteAdvertImageByAdvertId(int AdvertId) {
            AdvertImage advertImage = new AdvertImage();

            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prDelAdvertImage");

            //Adding Input parameters
            db.AddInParameter(dbCommand, "AdvertId", DbType.Int32, AdvertId);

            db.AddOutParameter(dbCommand, "RespCode", DbType.Int32, 100);
            db.AddOutParameter(dbCommand, "RespMsg", DbType.String, 500);

            try
            {
                // Execute
                db.ExecuteNonQuery(dbCommand);

                //Set Output for AddAdvert
                advertImage.RespCode = Convert.ToInt32(db.GetParameterValue(dbCommand, "RespCode"));
                advertImage.RespDesc = db.GetParameterValue(dbCommand, "RespMsg").ToString();

            }
            catch (Exception ex)
            {
                advertImage.RespCode = 1;
                advertImage.RespDesc = ex.ToString();
            }

            return advertImage;
        }

        /// <summary>
        /// Add Advert
        /// </summary>
        /// <param name="objAdvert">Advert</param>
        /// <returns>Advert</returns>
        public static Advert AddAdvertInfo(Advert objAdvert)
        {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prInsAdvert");

            //Adding Input parameters            
            db.AddInParameter(dbCommand, "AccountId", DbType.Int32, objAdvert.AccountId);
            db.AddInParameter(dbCommand, "Title", DbType.String, objAdvert.Title);
            db.AddInParameter(dbCommand, "ShortDescription", DbType.String, FixCrLf(objAdvert.ShortDescription));
            db.AddInParameter(dbCommand, "LongDescription", DbType.String, FixCrLf(objAdvert.LongDescription));
            db.AddInParameter(dbCommand, "CategoryId", DbType.String, objAdvert.Category.CategoryId);
            db.AddInParameter(dbCommand, "AdvertStatusId", DbType.String, objAdvert.AdvertStatus.AdvertStatusId);
            db.AddInParameter(dbCommand, "CountryId", DbType.String, objAdvert.Country.CountryId);
            db.AddInParameter(dbCommand, "Location", DbType.String, objAdvert.Location);
            db.AddInParameter(dbCommand, "ShowPriceYN", DbType.Boolean, objAdvert.ShowPriceYN);
            db.AddInParameter(dbCommand, "CurrencyId", DbType.String, objAdvert.Currency.CurrencyId);
            db.AddInParameter(dbCommand, "Price", DbType.Currency, objAdvert.Price);
            db.AddInParameter(dbCommand, "Quantity", DbType.Int32, objAdvert.Quantity);
            db.AddInParameter(dbCommand, "Age", DbType.Int32, objAdvert.Age);
            db.AddInParameter(dbCommand, "ContactName", DbType.String, objAdvert.ContactName);
            db.AddInParameter(dbCommand, "Telephone", DbType.String, objAdvert.Telephone);
            db.AddInParameter(dbCommand, "Fax", DbType.String, objAdvert.Fax);
            db.AddInParameter(dbCommand, "Mobile", DbType.String, objAdvert.Mobile);
            db.AddInParameter(dbCommand, "URL", DbType.String, objAdvert.URL);
            db.AddInParameter(dbCommand, "EmailAddress", DbType.String, objAdvert.EmailAddress);
            db.AddInParameter(dbCommand, "Address", DbType.String, objAdvert.Address);
            db.AddInParameter(dbCommand, "ExpiryDate", DbType.DateTime, objAdvert.ExpiryDate);
            db.AddInParameter(dbCommand, "AgreedTCYN", DbType.Boolean, objAdvert.AgreedTCYN);
            db.AddInParameter(dbCommand, "Owner", DbType.String, objAdvert.Owner);
            db.AddInParameter(dbCommand, "FullText", DbType.String, objAdvert.FullText);
            db.AddInParameter(dbCommand, "UserAccountTypeId", DbType.Int32, objAdvert.UserAccountTypeId);
            db.AddInParameter(dbCommand, "GUID", DbType.String, objAdvert.GUID);
            db.AddInParameter(dbCommand, "NewYN", DbType.Boolean, objAdvert.NewYN);

            //Adding Output parameters
            db.AddOutParameter(dbCommand, "AdvertId", DbType.Int32, 25);
            db.AddOutParameter(dbCommand, "RespCode", DbType.Int32, 100);
            db.AddOutParameter(dbCommand, "RespMsg", DbType.String, 500);


            try
            {
                // Execute
                db.ExecuteNonQuery(dbCommand);
                //Set Output for AddAdvert
                objAdvert.AdvertId = Convert.ToInt32(db.GetParameterValue(dbCommand, "AdvertId"));
                objAdvert.RespCode = Convert.ToInt32(db.GetParameterValue(dbCommand, "RespCode"));
                objAdvert.RespDesc = db.GetParameterValue(dbCommand, "RespMsg").ToString();

            }
            catch (Exception ex)
            {
                objAdvert.RespCode = 1;
                objAdvert.RespDesc = ex.ToString();
            }
            return objAdvert;
        }

        /// <summary>
        /// Update Advert
        /// </summary>
        /// <param name="objAdvert">Advert</param>
        /// <returns>Advert</returns>
        public static Advert UpdateAdvertInfo(Advert objAdvert)
        {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prUpdAdvert");

            //Adding Input parameters
            db.AddInParameter(dbCommand, "AdvertId", DbType.Int32, objAdvert.AdvertId);
            db.AddInParameter(dbCommand, "AccountId", DbType.Int32, objAdvert.AccountId);
            db.AddInParameter(dbCommand, "Title", DbType.String, objAdvert.Title);
            db.AddInParameter(dbCommand, "ShortDescription", DbType.String, FixCrLf(objAdvert.ShortDescription));
            db.AddInParameter(dbCommand, "LongDescription", DbType.String, FixCrLf(objAdvert.LongDescription));
            db.AddInParameter(dbCommand, "CategoryId", DbType.String, objAdvert.Category.CategoryId);
            db.AddInParameter(dbCommand, "CountryId", DbType.String, objAdvert.Country.CountryId);
            db.AddInParameter(dbCommand, "Location", DbType.String, objAdvert.Location);
            db.AddInParameter(dbCommand, "ShowPriceYN", DbType.Boolean, objAdvert.ShowPriceYN);
            if (objAdvert.Currency.CurrencyId == String.Empty)
                objAdvert.Currency.CurrencyId = null;
            db.AddInParameter(dbCommand, "CurrencyId", DbType.String, objAdvert.Currency.CurrencyId);
            db.AddInParameter(dbCommand, "Price", DbType.Currency, objAdvert.Price);
            db.AddInParameter(dbCommand, "Quantity", DbType.Int32, objAdvert.Quantity);
            db.AddInParameter(dbCommand, "Age", DbType.Int32, objAdvert.Age);
            db.AddInParameter(dbCommand, "ContactName", DbType.String, objAdvert.ContactName);
            db.AddInParameter(dbCommand, "Telephone", DbType.String, objAdvert.Telephone);
            db.AddInParameter(dbCommand, "Fax", DbType.String, objAdvert.Fax);
            db.AddInParameter(dbCommand, "Mobile", DbType.String, objAdvert.Mobile);
            db.AddInParameter(dbCommand, "URL", DbType.String, objAdvert.URL);
            db.AddInParameter(dbCommand, "EmailAddress", DbType.String, objAdvert.EmailAddress);
            db.AddInParameter(dbCommand, "Address", DbType.String, objAdvert.Address);
            db.AddInParameter(dbCommand, "ExpiryDate", DbType.DateTime, objAdvert.ExpiryDate);
            db.AddInParameter(dbCommand, "AgreedTCYN", DbType.Boolean, objAdvert.AgreedTCYN);
            db.AddInParameter(dbCommand, "FullText", DbType.String, objAdvert.FullText);
            db.AddInParameter(dbCommand, "UserAccountTypeId", DbType.Int32, objAdvert.UserAccountTypeId);
            db.AddInParameter(dbCommand, "NewYN", DbType.Boolean, objAdvert.NewYN);
            db.AddInParameter(dbCommand, "GUID", DbType.String, objAdvert.GUID);

            //Adding Output parameters
            db.AddOutParameter(dbCommand, "OutAdvertId", DbType.Int32, 25);
            db.AddOutParameter(dbCommand, "RespCode", DbType.Int32, 100);
            db.AddOutParameter(dbCommand, "RespMsg", DbType.String, 500);

            try
            {
                // Execute
                db.ExecuteNonQuery(dbCommand);
                //Set Output for AddAdvert
                objAdvert.AdvertId = Convert.ToInt32(db.GetParameterValue(dbCommand, "OutAdvertId"));
                objAdvert.RespCode = Convert.ToInt32(db.GetParameterValue(dbCommand, "RespCode"));
                objAdvert.RespDesc = db.GetParameterValue(dbCommand, "RespMsg").ToString();

            }
            catch (Exception ex)
            {
                objAdvert.RespCode = 1;
                objAdvert.RespDesc = ex.ToString();
            }
            return objAdvert;
        }

        /// <summary>
        /// Fixing line break issue for textarea
        /// </summary>
        /// <param name="value">string</param>
        /// <returns>modified string</returns>
        private static string FixCrLf(string value)
        {
            if (!String.IsNullOrEmpty(value))
            {
                return value.Replace(Environment.NewLine, "<br />");
            }
            else
            {
                return string.Empty;
            }

        }
        


        /// <summary>
        /// Get total number of valid advert posted in month
        /// </summary>
        /// <param name="month">Month in integer</param>
        /// <returns>Total advert in integer</returns>
        public static int TotalNumberOfAdvertInMonth(int AccountId, string AdvertCategory, int Month)
        {
            int total = 0;

            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelTotalNumberOfAdvertInMonth");

            //Adding Input parameters            
            db.AddInParameter(dbCommand, "AccountId", DbType.Int32, AccountId);
            db.AddInParameter(dbCommand, "AdvertCategory", DbType.AnsiString, AdvertCategory);
            db.AddInParameter(dbCommand, "Month", DbType.Int32, Month);

            //Adding Input parameters            
            db.AddOutParameter(dbCommand, "Total", DbType.Int32, 25);

            try
            {
                // Execute
                db.ExecuteNonQuery(dbCommand);

                //Set Output for AddAdvert
                total = Convert.ToInt32(db.GetParameterValue(dbCommand, "Total"));
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return total;
        }

        /// <summary>
        /// Insert Advert Transaction to database
        /// </summary>
        /// <param name="objAdvertTransaction">AdvertTransaction</param>
        /// <returns>AdvertTransaction</returns>
        public static AdvertTransaction SetAdvertTransaction(AdvertTransaction objAdvertTransaction)
        {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prInsAdvertTransaction");

            //Adding Input parameters            
            db.AddInParameter(dbCommand, "VendorTransactionCode", DbType.String, objAdvertTransaction.VendorTransactionCode);
            db.AddInParameter(dbCommand, "AdvertId", DbType.Int32, objAdvertTransaction.AdvertId);
            db.AddInParameter(dbCommand, "AccountId", DbType.Int32, objAdvertTransaction.AccountId);
            db.AddInParameter(dbCommand, "ChargeRateId", DbType.Int32, objAdvertTransaction.AdvertChargeRates.ChargeRateId);
            db.AddInParameter(dbCommand, "CreditCardNumber", DbType.String, objAdvertTransaction.CreditCardNumber);
            db.AddInParameter(dbCommand, "Description", DbType.String, objAdvertTransaction.Description);
            db.AddInParameter(dbCommand, "CurrencyId", DbType.String, objAdvertTransaction.Currency.CurrencyId);
            db.AddInParameter(dbCommand, "AmountSubmit", DbType.Decimal, objAdvertTransaction.AmountSubmit);
            db.AddInParameter(dbCommand, "CustomerEmailAddress", DbType.String, objAdvertTransaction.CustomerEmailAddress);
            db.AddInParameter(dbCommand, "CustomerName", DbType.String, objAdvertTransaction.CustomerName);
            db.AddInParameter(dbCommand, "TransactionCode", DbType.String, objAdvertTransaction.TransactionCode);

            db.AddOutParameter(dbCommand, "AdvertTransactionId", DbType.Int32, 25);

            try
            {
                // Execute command
                db.ExecuteReader(dbCommand);

                objAdvertTransaction.AdvertTransactionId = Convert.ToInt32(db.GetParameterValue(dbCommand, "AdvertTransactionId"));
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }

            return objAdvertTransaction;
        }

        /// <summary>
        /// Update Advert Transaction to database
        /// </summary>
        /// <param name="objAdvertTransaction">AdvertTransaction</param>
        public static void UpdateAdvertTransaction(AdvertTransaction objAdvertTransaction) {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prUpdAdvertTransaction");

            //Adding Input parameters            
            db.AddInParameter(dbCommand, "VendorTransactionCode", DbType.String, objAdvertTransaction.VendorTransactionCode);
            db.AddInParameter(dbCommand, "AdvertId", DbType.Int32, objAdvertTransaction.AdvertId);
            db.AddInParameter(dbCommand, "AccountId", DbType.Int32, objAdvertTransaction.AccountId);
            db.AddInParameter(dbCommand, "CreditCardNumber", DbType.String, objAdvertTransaction.CreditCardNumber);
            db.AddInParameter(dbCommand, "AmountPaid", DbType.Decimal, objAdvertTransaction.AmountPaid);
            db.AddInParameter(dbCommand, "StatusCode", DbType.Int32, objAdvertTransaction.StatusCode);
            db.AddInParameter(dbCommand, "TransactionCode", DbType.String, objAdvertTransaction.TransactionCode);

            try
            {
                // Execute command
                db.ExecuteReader(dbCommand);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }

        /// <summary>
        /// Insert Advert Invoice to database
        /// </summary>
        /// <param name="objAdvertInvoice">AdvertInvoice</param>
        public static void SetAdvertInvoice(AdvertInvoice objAdvertInvoice) {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prInsAdvertInvoice");

            //Adding Input parameters            
            db.AddInParameter(dbCommand, "AdvertId", DbType.Int32, objAdvertInvoice.AdvertId);
            db.AddInParameter(dbCommand, "AccountId", DbType.Int32, objAdvertInvoice.AccountId);
            db.AddInParameter(dbCommand, "CurrencyId", DbType.String, objAdvertInvoice.Currency.CurrencyId);
            db.AddInParameter(dbCommand, "Net", DbType.Decimal, objAdvertInvoice.Net);
            db.AddInParameter(dbCommand, "Vat", DbType.Decimal, objAdvertInvoice.Vat);
            db.AddInParameter(dbCommand, "Amount", DbType.Decimal, objAdvertInvoice.Amount);
            db.AddInParameter(dbCommand, "Description", DbType.String, objAdvertInvoice.Description);
            db.AddInParameter(dbCommand, "AdvertTransactionId", DbType.Int32, objAdvertInvoice.AdvertTransaction.AdvertTransactionId);
            db.AddInParameter(dbCommand, "InvoiceStatusId", DbType.Int32, objAdvertInvoice.InvoiceStatusCode.InvoiceStatusId);
            db.AddInParameter(dbCommand, "MonthCount", DbType.Int32, objAdvertInvoice.MonthCount);

            if (objAdvertInvoice.PremiumAccountInvoiceStatus != null)
                db.AddInParameter(dbCommand, "PremiumAccountInvoiceStatusId", DbType.Int32, objAdvertInvoice.PremiumAccountInvoiceStatus.PremiumAccountInvoiceStatusId);

            try
            {
                // Execute command
                db.ExecuteReader(dbCommand);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }

        /// <summary>
        /// Get All Invoice by AccountId
        /// </summary>
        /// <param name="AccountId">Account ID</param>
        /// <returns>List of AdvertInvoice</returns>
        public static DataSet GetAllInvoiceByAccountId(int AccountId) {
            List<AdvertInvoice> lstInvoices = new List<AdvertInvoice>();

            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelAllInvoiceByAccountId");

            db.AddInParameter(dbCommand, "AccountId", DbType.Int32, AccountId);

            DataSet ds = new DataSet();
            try
            {
                ds = db.ExecuteDataSet(dbCommand);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            
            return ds;
        }

        /// <summary>
        /// Get the last transaction record by advert Id
        /// </summary>
        /// <param name="AdvertId"></param>
        /// <returns></returns>
        public static AdvertTransaction GetLastTransactionByAdvertId(int AdvertId) {
            AdvertTransaction objAdvertTransaction = new AdvertTransaction();

            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelLastTransactionByAdvertId");
            //Adding Input parameters   
            db.AddInParameter(dbCommand, "AdvertID", DbType.Int32, AdvertId);

            IDataReader dr = null;
            try
            {
                // Execute command 
                dr = db.ExecuteReader(dbCommand);

                //Set Output
                while (dr.Read())
                {
                    objAdvertTransaction.AdvertTransactionId = Convert.ToInt32(dr["AdvertTransactionId"]);
                    objAdvertTransaction.VendorTransactionCode = dr["VendorTransactionCode"].ToString();
                    objAdvertTransaction.AdvertId = Convert.ToInt32(dr["AdvertId"]);
                    objAdvertTransaction.AccountId = Convert.ToInt32(dr["AccountId"]);

                    AdvertChargeRates objAdvertChargeRates = new AdvertChargeRates();
                    objAdvertChargeRates.ChargeRateId = Convert.ToInt32(dr["ChargeRateId"]);
                    objAdvertTransaction.AdvertChargeRates = objAdvertChargeRates;

                    objAdvertTransaction.Description = dr["Description"].ToString();
                    
                    Currency objCurrency = new Currency();
                    objCurrency.CurrencyId = dr["CurrencyId"].ToString();
                    objAdvertTransaction.Currency = objCurrency;

                    objAdvertTransaction.AmountSubmit = Convert.ToDecimal(dr["AmountSubmit"]);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally
            {
                dr.Close();
            }

            return objAdvertTransaction;
        }

        /// <summary>
        /// Get total invoice by advert Id
        /// </summary>
        /// <param name="AdvertId">Advert ID</param>
        /// <returns>Total Invoice</returns>
        public static int GetTotalInvoiceByAdvertId(int AdvertId) {
            int total = 0;

            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelTotalInvoiceByAdvertId");

            //Adding Input parameters
            db.AddInParameter(dbCommand, "AdvertID", DbType.Int32, AdvertId);

            IDataReader dr = null;
            try
            {
                // Execute command 
                dr = db.ExecuteReader(dbCommand);

                //Set Output
                while (dr.Read())
                {
                    total = Convert.ToInt32(dr["total"]);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally
            {
                dr.Close();
            }

            return total;
        }

        /// <summary>
        /// Get the last invoice record by advert Id
        /// </summary>
        /// <param name="AdvertId">Advert ID</param>
        /// <returns>AdvertInvoice</returns>
        public static AdvertInvoice prSelLastCreditCardInvoiceByAdvertId(int AdvertId)
        {
            AdvertInvoice objAdvertInvoice = new AdvertInvoice();

            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelLastCreditCardInvoiceByAdvertId");
            //Adding Input parameters   
            db.AddInParameter(dbCommand, "AdvertID", DbType.Int32, AdvertId);

            IDataReader dr = null;
            try
            {
                // Execute command 
                dr = db.ExecuteReader(dbCommand);

                //Set Output
                while (dr.Read())
                {
                    objAdvertInvoice.AdvertInvoiceId = Convert.ToInt32(dr["AdvertInvoiceId"]);
                    objAdvertInvoice.AdvertId = Convert.ToInt32(dr["AdvertId"]);
                    objAdvertInvoice.AccountId = Convert.ToInt32(dr["AccountId"]);
                    
                    AdvertTransaction objAdvertTransaction = new AdvertTransaction();
                    objAdvertTransaction.AdvertTransactionId = Convert.ToInt32(dr["AdvertTransactionId"]);
                    objAdvertInvoice.AdvertTransaction = objAdvertTransaction;

                    InvoiceStatusCode objInvoiceStatusCode = new InvoiceStatusCode();
                    objInvoiceStatusCode.InvoiceStatusId = Convert.ToInt32(dr["InvoiceStatusId"]);
                    objAdvertInvoice.InvoiceStatusCode = objInvoiceStatusCode;

                    objAdvertInvoice.MonthCount = Convert.ToInt32(dr["MonthCount"]);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally
            {
                dr.Close();
            }

            return objAdvertInvoice;
        }

        /// <summary>
        /// Updating Advert Expiry Date
        /// </summary>
        /// <param name="objAdvert">Advert</param>
        /// <returns>Advert</returns>
        public static void UpdateAdvertExpiryDate(Advert objAdvert) {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prUpdExpiryDateByAdvertId");
            
            //Adding Input parameters   
            db.AddInParameter(dbCommand, "AdvertID", DbType.Int32, objAdvert.AdvertId);
            db.AddInParameter(dbCommand, "ExpiryDate", DbType.DateTime, objAdvert.ExpiryDate);

            IDataReader dr = null;
            try
            {
                // Execute command 
                dr = db.ExecuteReader(dbCommand);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally
            {
                dr.Close();
            }

        }

        /// <summary>
        /// Get Invoice By Advert Invoice ID
        /// </summary>
        /// <param name="AdvertInvoiceId">Advert Invoice ID</param>
        /// <returns>AdvertInvoice</returns>
        public static AdvertInvoice GetInvoiceByAdvertInvoiceId(int AdvertInvoiceId) {
            AdvertInvoice objAdvertInvoice = new AdvertInvoice();

            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelInvoiceByAdvertInvoiceId");
            
            //Adding Input parameters   
            db.AddInParameter(dbCommand, "AdvertInvoiceId", DbType.Int32, AdvertInvoiceId);

            IDataReader dr = null;
            try
            {
                // Execute command 
                dr = db.ExecuteReader(dbCommand);

                //Set Output
                while (dr.Read())
                {
                    objAdvertInvoice.AdvertInvoiceId = Convert.ToInt32(dr["AdvertInvoiceId"]);
                    objAdvertInvoice.AdvertId = Convert.ToInt32(dr["AdvertId"]);
                    objAdvertInvoice.AccountId = Convert.ToInt32(dr["AccountId"]);

                    Currency objCurrency = new Currency();
                    objCurrency.CurrencyId = dr["CurrencyId"].ToString();
                    objAdvertInvoice.Currency = objCurrency;

                    objAdvertInvoice.Net = Convert.ToDecimal(dr["Net"]);
                    objAdvertInvoice.Vat = Convert.ToDecimal(dr["Vat"]);
                    objAdvertInvoice.Amount = Convert.ToDecimal(dr["Amount"]);
                    objAdvertInvoice.Description = dr["Description"].ToString();

                    InvoiceStatusCode objInvoiceStatusCode = new InvoiceStatusCode();
                    objInvoiceStatusCode.InvoiceStatusId = Convert.ToInt32(dr["InvoiceStatusId"]);
                    objAdvertInvoice.InvoiceStatusCode = objInvoiceStatusCode;

                    objAdvertInvoice.MonthCount = Convert.ToInt32(dr["MonthCount"]);
                    objAdvertInvoice.CreateDate = Convert.ToDateTime(dr["CreateDate"]);
                    objAdvertInvoice.LastUpdate = Convert.ToDateTime(dr["LastUpdate"]);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally
            {
                dr.Close();
            }

            return objAdvertInvoice;
        }

        /// <summary>
        /// Validate Advert Invoice By using Account ID & AdvertInvoice ID
        /// </summary>
        /// <param name="AccountId">Account ID</param>
        /// <param name="AdvertInvoiceId">AdvertInvoice ID</param>
        /// <returns>True or False</returns>
        public static bool ValidateAdvertInvoiceAdvertId(int AccountId, int AdvertInvoiceId){
            bool validate = false;

            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prValidateAdvertInvoiceAdvertId");

            //Adding Input parameters   
            db.AddInParameter(dbCommand, "AccountId", DbType.Int32, AccountId);
            db.AddInParameter(dbCommand, "AdvertInvoiceId", DbType.Int32, AdvertInvoiceId);

            IDataReader dr = null;
            try
            {
                // Execute command 
                dr = db.ExecuteReader(dbCommand);

                //Set Output
                while (dr.Read())
                {
                    if (Convert.ToInt32(dr["Total"]) == 1)
                    {
                        validate = true;
                    }
                    else {
                        validate = false;
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally
            {
                dr.Close();
            }

            return validate;
        }
 */

    }
}