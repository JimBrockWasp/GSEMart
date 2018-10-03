/**
 * This is Account Layer
 * Responsible to handle all account related methods to connect to database
 */
using System;
using System.Collections.Generic;
using System.Text;
/*
using Microsoft.Practices.EnterpriseLibrary.Data;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Data.Common;
*/
using System.Configuration;
using Qualitiva.GSEMART.BusinessObject;

using System.Data;
using System.Data.SqlClient;

namespace Qualitiva.GSEMART.DataLayer
{
    public class AccountLayer
    {

        /// <summary>
        /// Check if Email already exists in database
        /// </summary>
        /// <param name="EmailAddress">Email Address</param>
        /// <returns>True or False</returns>
        public static bool IsEmailExist(string EmailAddress)
        {

            string ConnectionString = ConfigurationManager.ConnectionStrings["GSEMART_DBSERVER"].ConnectionString;
            SqlConnection Con = new SqlConnection(ConnectionString);

            SqlCommand dbCommand = null;
            SqlDataReader dr = null;

            bool returnValue = false;
            try
            {
                // Connect to the Database
                Con.Open();

                // Create the command Object
                dbCommand = Con.CreateCommand();
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.CommandText = "prCheckEmailAddressExist";
                dbCommand.Parameters.AddWithValue("EmailAddress", EmailAddress);

                // Execute command 
                dr = dbCommand.ExecuteReader();

                //Set Output
                while (dr.Read())
                {

                    returnValue = true;
                    break;
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (dr != null)
                {
                    dr.Close();
                }
                if (Con != null)
                {
                    Con.Close();
                }
            }

            return returnValue;
        }


        /// <summary>
        /// Get Account by Account ID
        /// </summary>
        /// <param name="AccountId">Account ID</param>
        /// <returns>Account</returns>
        public static Account GetAccountById(int AccountId)
        {

            string ConnectionString = ConfigurationManager.ConnectionStrings["GSEMART_DBSERVER"].ConnectionString;
            SqlConnection Con = new SqlConnection(ConnectionString);

            SqlCommand dbCommand = null;
            SqlDataReader dr = null;

            Account objAccount = new Account();


            try
            {
                // Connect to the Database
                Con.Open();

                // Create the command Object
                dbCommand = Con.CreateCommand();
                dbCommand.CommandText = "prSelAccountById";
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.Parameters.AddWithValue("AccountId", AccountId);
                
                // Execute command 
                dr = dbCommand.ExecuteReader();


                //Set Output
                while (dr.Read())
                {
                    objAccount.AccountId = Convert.ToInt32(dr["AccountID"].ToString());
                    objAccount.EmailAddress = dr["EmailAddress"].ToString();
                    objAccount.FullName = dr["FullName"].ToString();
                    objAccount.LastName = dr["LastName"].ToString();
                    objAccount.CompanyName = dr["CompanyName"].ToString();
                    objAccount.Address = dr["Address"].ToString();
                    objAccount.PostCode = dr["PostCode"].ToString();
                    objAccount.City = dr["City"].ToString();
                    objAccount.Profile = dr["Profile"].ToString();
                    objAccount.CompanyWebsite = dr["CompanyWebsite"].ToString();

                    if (dr["StateId"] != DBNull.Value)
                    {
                        State objState = new State();
                        objState.StateId = dr["StateId"].ToString();
                        objAccount.State = objState;
                    }

                    objAccount.Country = CountryLayer.GetCountryById(dr["CountryId"].ToString());
                    objAccount.Telephone = dr["Telephone"].ToString();
                    objAccount.Fax = dr["Fax"].ToString();
                    objAccount.Mobile = dr["Mobile"].ToString();
                    objAccount.Password = dr["Password"].ToString();
                    objAccount.AccountStatus = AccountLayer.GetAccountStatusById(dr["AccountStatusId"].ToString());
                    objAccount.SalesCode = dr["SalesCode"].ToString();
                    objAccount.VATNumber = dr["VATNumber"].ToString();
                    objAccount.AccountType = AccountLayer.GetAccountTypeById(Convert.ToInt32(dr["AccountTypeId"]));

                    if (dr["TenderYN"] == DBNull.Value)
                        objAccount.TenderYN = false;
                    else
                        objAccount.TenderYN = Convert.ToBoolean(dr["TenderYN"]);

                    objAccount.Discount = Convert.ToInt16(dr["Discount"].ToString());
                    objAccount.CreatedDate = Convert.ToDateTime(dr["CreatedDate"].ToString());
                    objAccount.LastModifiedDate = Convert.ToDateTime(dr["LastModifiedDate"].ToString());
                }
            }
            catch (Exception ex)
            {
                objAccount.RespCode = 1;
                objAccount.RespDesc = ex.ToString();
            }
            finally
            {
                if (dr != null)
                {
                    dr.Close();
                }
                if (Con != null)
                {
                    Con.Close();
                }
            }
            return objAccount;

        }


        /// <summary>
        /// Get All Account Records with Active Adverts
        /// </summary>
        /// <returns>List of Accounts</returns>
        public static List<Account> GetAccountsWithAdverts()
        {
            List<Account> lstAccounts = new List<Account>();

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
                dbCommand.CommandText = "prSelAccountsWithAdverts";
                dbCommand.CommandType = CommandType.StoredProcedure;
            
                // Execute command 
                dr = dbCommand.ExecuteReader();

                //Set Output
                while (dr.Read())
                {
                    Account objAccount = new Account();
                    objAccount.AccountId = Convert.ToInt32(dr["AccountID"].ToString());
                    objAccount.CompanyName = dr["CompanyName"].ToString();

                    lstAccounts.Add(objAccount);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally
            {
                if (dr != null)
                {
                    dr.Close();
                }
                if (Con != null)
                {
                    Con.Close();
                }
            }

            return lstAccounts;
        }

        /// <summary>
        /// Get particular Account Type record by Account Type ID
        /// </summary>
        /// <param name="AccountTypeId">Account Type ID</param>
        /// <returns>AccountType</returns>
        public static AccountType GetAccountTypeById(int AccountTypeId)
        {


            string ConnectionString = ConfigurationManager.ConnectionStrings["GSEMART_DBSERVER"].ConnectionString;
            SqlConnection Con = new SqlConnection(ConnectionString);

            SqlCommand dbCommand = null;
            SqlDataReader dr = null;

            AccountType objAccountType = new AccountType();
            try
            {

                // Connect to the Database
                Con.Open();

                // Create the command Object
                dbCommand = Con.CreateCommand();
                dbCommand.CommandText = "prSelAccountTypeById";
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.Parameters.AddWithValue("AccountTypeId", AccountTypeId);

                // Execute command 
                dr = dbCommand.ExecuteReader();


                //Set Output
                while (dr.Read())
                {
                    //Set Output            
                    objAccountType.AccountTypeId = Convert.ToInt32(dr["AccountTypeId"]);
                    objAccountType.AccountTypeName = dr["AccountTypeName"].ToString();
                }

            }
            catch (Exception ex)
            {
                objAccountType.RespCode = 1;
                objAccountType.RespDesc = ex.ToString();
            }
            finally
            {
                dr.Close();
            }
            return objAccountType;
        }


        public static AccountImage GetAccountImageByAccountId(int AccountId)
        {

            string ConnectionString = ConfigurationManager.ConnectionStrings["GSEMART_DBSERVER"].ConnectionString;
            SqlConnection Con = new SqlConnection(ConnectionString);

            SqlCommand dbCommand = null;
            SqlDataReader dr = null;
            
            AccountImage objAccountImage = new AccountImage();

            try
            {

                // Connect to the Database
                Con.Open();

                // Create the command Object
                dbCommand = Con.CreateCommand();
                dbCommand.CommandText = "prSelAccountImageByAccountId";
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.Parameters.AddWithValue("AccountId", AccountId);

                // Execute command 
                dr = dbCommand.ExecuteReader();

                //Set Output
                while (dr.Read())
                {
                    //Set Output            
                    objAccountImage.AccountId = Convert.ToInt32(dr["AccountId"].ToString());
                    objAccountImage.Image = (byte[])(dr["Image"]);

                }
            }
            catch (Exception ex)
            {
                objAccountImage.RespCode = 1;
                objAccountImage.RespDesc = ex.ToString();
            }
            finally
            {
                if (dr != null)
                {
                    dr.Close();
                }
                if (Con != null)
                {
                    Con.Close();
                }
            }
            return objAccountImage;
        }

        /// <summary>
        /// Get particular Account Status record by Account Status ID
        /// </summary>
        /// <param name="AccountStatusId">Account Status ID</param>
        /// <returns>AccountStatus</returns>
        public static AccountStatus GetAccountStatusById(string AccountStatusId)
        {

            string ConnectionString = ConfigurationManager.ConnectionStrings["GSEMART_DBSERVER"].ConnectionString;
            SqlConnection Con = new SqlConnection(ConnectionString);

            SqlCommand dbCommand = null;
            SqlDataReader dr = null;

            AccountStatus objAccountStatus = new AccountStatus();

            try
            {

                // Connect to the Database
                Con.Open();

                // Create the command Object
                dbCommand = Con.CreateCommand();
                dbCommand.CommandText = "prSelAccountStatusById";
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.Parameters.AddWithValue("AccountStatusId", AccountStatusId);
                
                // Execute command 
                dr = dbCommand.ExecuteReader();
                
                //Set Output
                while (dr.Read())
                {
                    //Set Output            
                    objAccountStatus.AccountStatusId = dr["AccountStatusId"].ToString();
                    objAccountStatus.Description = dr["Description"].ToString();
                }

            }
            catch (Exception ex)
            {
                objAccountStatus.RespCode = 1;
                objAccountStatus.RespDesc = ex.ToString();
            }
            finally
            {
                if (dr != null)
                {
                    dr.Close();
                }
                if (Con != null)
                {
                    Con.Close();
                }
            }
            return objAccountStatus;
        }

        /// <summary>
        /// Adding new Account
        /// </summary>
        /// <param name="objAccount">Account</param>
        /// <param name="ConfirmationCode">Email Confirmation Code</param>
        /// <returns>Account</returns>
        public static Account AddAccount(Account objAccount, string ConfirmationCode)
        {

            string ConnectionString = ConfigurationManager.ConnectionStrings["GSEMART_DBSERVER"].ConnectionString;
            SqlConnection Con = new SqlConnection(ConnectionString);

            SqlCommand dbCommand = null;

            // Connect to the Database
            Con.Open();

            // Create the command Object
            dbCommand = Con.CreateCommand();
            dbCommand.CommandText = "prInsAccount";
            dbCommand.CommandType = CommandType.StoredProcedure;
                
            
            //Adding Input parameters            
            dbCommand.Parameters.AddWithValue("@EmailAddress", objAccount.EmailAddress);
            dbCommand.Parameters.AddWithValue("FullName",  objAccount.FullName);
            dbCommand.Parameters.AddWithValue("LastName",  objAccount.LastName);
            dbCommand.Parameters.AddWithValue("CompanyName", objAccount.CompanyName);
            dbCommand.Parameters.AddWithValue("Address", objAccount.Address);
            dbCommand.Parameters.AddWithValue("PostCode", objAccount.PostCode);
            dbCommand.Parameters.AddWithValue("City", objAccount.City);
            dbCommand.Parameters.AddWithValue("StateId", objAccount.State.StateId);
            dbCommand.Parameters.AddWithValue("CountryId", objAccount.Country.CountryId);
            dbCommand.Parameters.AddWithValue("Telephone", objAccount.Telephone);
            dbCommand.Parameters.AddWithValue("Fax", objAccount.Fax);
            dbCommand.Parameters.AddWithValue("Mobile", objAccount.Mobile);
            dbCommand.Parameters.AddWithValue("Password", objAccount.Password);
            dbCommand.Parameters.AddWithValue("AccountStatusId", objAccount.AccountStatus.AccountStatusId);
            dbCommand.Parameters.AddWithValue("SalesCode", objAccount.SalesCode);
            dbCommand.Parameters.AddWithValue("VATNumber", objAccount.VATNumber);
            dbCommand.Parameters.AddWithValue("VATNumberStatusId", objAccount.VATNumberStatus.VATNumberStatusId);
            dbCommand.Parameters.AddWithValue("Discount", objAccount.Discount);
            dbCommand.Parameters.AddWithValue("ConfirmationCode", ConfirmationCode);
            dbCommand.Parameters.AddWithValue("AgreedTCYN", objAccount.AgreedTCYN);
            dbCommand.Parameters.AddWithValue("AccountTypeId", objAccount.AccountType.AccountTypeId);

            //Adding Output parameters
            dbCommand.Parameters.Add("AccountID", SqlDbType.Int);
            dbCommand.Parameters["AccountID"].Direction = ParameterDirection.Output;

            dbCommand.Parameters.Add("RespCode", SqlDbType.Int);
            dbCommand.Parameters["RespCode"].Direction = ParameterDirection.Output;
            
            dbCommand.Parameters.Add("RespMsg", SqlDbType.NVarChar, 500);
            dbCommand.Parameters["RespMsg"].Direction = ParameterDirection.Output;


            try
            {
                // Execute
                dbCommand.ExecuteNonQuery();

                //Set Output for AddAccount
                objAccount.AccountId = (int)dbCommand.Parameters["AccountId"].Value;
                objAccount.RespCode = (int)dbCommand.Parameters["RespCode"].Value;
                objAccount.RespDesc = dbCommand.Parameters["RespMsg"].Value.ToString();

            }
            catch (Exception ex)
            {
                objAccount.RespCode = 1;
                objAccount.RespDesc = ex.ToString();
            }
            finally
            {
                if (Con != null)
                {
                    Con.Close();
                }
            }
            return objAccount;
        }



        // private static Database db = DatabaseFactory.CreateDatabase();
/*
        /// <summary>
        /// Adding new Account
        /// </summary>
        /// <param name="objAccount">Account</param>
        /// <param name="ConfirmationCode">Email Confirmation Code</param>
        /// <returns>Account</returns>
        public static Account AddAccount(Account objAccount, string ConfirmationCode)
        {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prInsAccount");

            //Adding Input parameters            
            db.AddInParameter(dbCommand, "EmailAddress", DbType.String, objAccount.EmailAddress);
            db.AddInParameter(dbCommand, "FullName", DbType.String, objAccount.FullName);
            db.AddInParameter(dbCommand, "LastName", DbType.String, objAccount.LastName);
            db.AddInParameter(dbCommand, "CompanyName", DbType.String, objAccount.CompanyName);
            db.AddInParameter(dbCommand, "Address", DbType.String, objAccount.Address);
            db.AddInParameter(dbCommand, "PostCode", DbType.String, objAccount.PostCode);
            db.AddInParameter(dbCommand, "City", DbType.String, objAccount.City);
            db.AddInParameter(dbCommand, "StateId", DbType.AnsiString, objAccount.State.StateId);
            db.AddInParameter(dbCommand, "CountryId", DbType.String, objAccount.Country.CountryId);
            db.AddInParameter(dbCommand, "Telephone", DbType.String, objAccount.Telephone);
            db.AddInParameter(dbCommand, "Fax", DbType.String, objAccount.Fax);
            db.AddInParameter(dbCommand, "Mobile", DbType.String, objAccount.Mobile);
            db.AddInParameter(dbCommand, "Password", DbType.String, objAccount.Password);
            db.AddInParameter(dbCommand, "AccountStatusId", DbType.String, objAccount.AccountStatus.AccountStatusId);
            db.AddInParameter(dbCommand, "SalesCode", DbType.String, objAccount.SalesCode);
            db.AddInParameter(dbCommand, "VATNumber", DbType.String, objAccount.VATNumber);
            db.AddInParameter(dbCommand, "VATNumberStatusId", DbType.String, objAccount.VATNumberStatus.VATNumberStatusId);
            db.AddInParameter(dbCommand, "Discount", DbType.Int16, objAccount.Discount);
            db.AddInParameter(dbCommand, "ConfirmationCode", DbType.String, ConfirmationCode);
            db.AddInParameter(dbCommand, "AgreedTCYN", DbType.Boolean, objAccount.AgreedTCYN);
            db.AddInParameter(dbCommand, "AccountTypeId", DbType.Int32, objAccount.AccountType.AccountTypeId);

            //Adding Output parameters
            db.AddOutParameter(dbCommand, "AccountID", DbType.String, 25);
            db.AddOutParameter(dbCommand, "RespCode", DbType.Int32, 100);
            db.AddOutParameter(dbCommand, "RespMsg", DbType.String, 500);


            try
            {
                // Execute
                db.ExecuteNonQuery(dbCommand);
                //Set Output for AddAccount
                objAccount.AccountId = Convert.ToInt32(db.GetParameterValue(dbCommand, "AccountID"));
                objAccount.RespCode = Convert.ToInt32(db.GetParameterValue(dbCommand, "RespCode"));
                objAccount.RespDesc = db.GetParameterValue(dbCommand, "RespMsg").ToString();

            }
            catch (Exception ex)
            {
                objAccount.RespCode = 1;
                objAccount.RespDesc = ex.ToString();
            }
            return objAccount;
        }

        
        /// <summary>
        /// Update the Account logo image
        /// </summary>
        /// <param name="objAccountImage"></param>
        /// <returns></returns>
        public static AccountImage UpdateAccountImage(AccountImage objAccountImage)
        {

            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prUpdAccountImage");

            //Adding Input parameters            
            db.AddInParameter(dbCommand, "AccountId", DbType.Int32, objAccountImage.AccountId);
            db.AddInParameter(dbCommand, "Image", DbType.Binary, objAccountImage.Image);

            //Adding Output parameters
            db.AddOutParameter(dbCommand, "RespCode", DbType.Int32, 100);
            db.AddOutParameter(dbCommand, "RespMsg", DbType.String, 500);


            try
            {
                // Execute
                db.ExecuteNonQuery(dbCommand);

                //Set Output for AddAdvertImage
                objAccountImage.RespCode = Convert.ToInt32(db.GetParameterValue(dbCommand, "RespCode"));
                objAccountImage.RespDesc = db.GetParameterValue(dbCommand, "RespMsg").ToString();

            }
            catch (Exception ex)
            {
                objAccountImage.RespCode = 1;
                objAccountImage.RespDesc = ex.ToString();
            }

            return objAccountImage;
        }


        /// <summary>
        /// Update Account
        /// </summary>
        /// <param name="objAccount">Account</param>
        /// <returns>Account</returns>
        public static Account UpdateAccount(Account objAccount)
        {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prUpdAccount");

            //Adding Input parameters            
            db.AddInParameter(dbCommand, "AccountId", DbType.String, objAccount.AccountId);
            db.AddInParameter(dbCommand, "FullName", DbType.String, objAccount.FullName);
            db.AddInParameter(dbCommand, "LastName", DbType.String, objAccount.LastName);
            db.AddInParameter(dbCommand, "CompanyName", DbType.String, objAccount.CompanyName);
            db.AddInParameter(dbCommand, "Address", DbType.String, objAccount.Address);
            db.AddInParameter(dbCommand, "PostCode", DbType.String, objAccount.PostCode);
            db.AddInParameter(dbCommand, "City", DbType.String, objAccount.City);
            db.AddInParameter(dbCommand, "StateId", DbType.String, objAccount.State.StateId);
            db.AddInParameter(dbCommand, "CountryId", DbType.String, objAccount.Country.CountryId);
            db.AddInParameter(dbCommand, "Telephone", DbType.String, objAccount.Telephone);
            db.AddInParameter(dbCommand, "Fax", DbType.String, objAccount.Fax);
            db.AddInParameter(dbCommand, "Mobile", DbType.String, objAccount.Mobile);
            db.AddInParameter(dbCommand, "VATNumber", DbType.String, objAccount.VATNumber);
            db.AddInParameter(dbCommand, "VATNumberStatusId", DbType.String, objAccount.VATNumberStatus.VATNumberStatusId);
            db.AddInParameter(dbCommand, "Profile", DbType.String, objAccount.Profile);
            db.AddInParameter(dbCommand, "CompanyWebsite", DbType.String, objAccount.CompanyWebsite);

            //Adding Output parameters            
            db.AddOutParameter(dbCommand, "RespCode", DbType.Int32, 100);
            db.AddOutParameter(dbCommand, "RespMsg", DbType.String, 500);


            try
            {
                // Execute
                db.ExecuteNonQuery(dbCommand);
                //Set Output for AddAccount
                objAccount.RespCode = Convert.ToInt32(db.GetParameterValue(dbCommand, "RespCode"));
                objAccount.RespDesc = db.GetParameterValue(dbCommand, "RespMsg").ToString();

            }
            catch (Exception ex)
            {
                objAccount.RespCode = 1;
                objAccount.RespDesc = ex.ToString();
            }
            return objAccount;
        }

        /// <summary>
        /// Update Account, Used By Administrator
        /// </summary>
        /// <param name="objAccount">Account</param>
        /// <returns>Account</returns>
        public static Account UpdateAccountByAdmin(Account objAccount)
        {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prUpdAccountByAdmin");

            //Adding Input parameters            
            db.AddInParameter(dbCommand, "AccountId", DbType.String, objAccount.AccountId);
            db.AddInParameter(dbCommand, "FullName", DbType.String, objAccount.FullName);
            db.AddInParameter(dbCommand, "LastName", DbType.String, objAccount.LastName);
            db.AddInParameter(dbCommand, "CompanyName", DbType.String, objAccount.CompanyName);
            db.AddInParameter(dbCommand, "Address", DbType.String, objAccount.Address);
            db.AddInParameter(dbCommand, "PostCode", DbType.String, objAccount.PostCode);
            db.AddInParameter(dbCommand, "City", DbType.String, objAccount.City);
            db.AddInParameter(dbCommand, "StateId", DbType.String, objAccount.State.StateId);
            db.AddInParameter(dbCommand, "CountryId", DbType.String, objAccount.Country.CountryId);
            db.AddInParameter(dbCommand, "Telephone", DbType.String, objAccount.Telephone);
            db.AddInParameter(dbCommand, "Fax", DbType.String, objAccount.Fax);
            db.AddInParameter(dbCommand, "Mobile", DbType.String, objAccount.Mobile);
            db.AddInParameter(dbCommand, "SalesCode", DbType.String, objAccount.SalesCode);
            db.AddInParameter(dbCommand, "AccountStatusId", DbType.AnsiString, objAccount.AccountStatus.AccountStatusId);
            db.AddInParameter(dbCommand, "AccountTypeId", DbType.Int32, objAccount.AccountType.AccountTypeId);

            //Adding Output parameters            
            db.AddOutParameter(dbCommand, "RespCode", DbType.Int32, 100);
            db.AddOutParameter(dbCommand, "RespMsg", DbType.String, 500);


            try
            {
                // Execute
                db.ExecuteNonQuery(dbCommand);
                //Set Output for AddAccount
                objAccount.RespCode = Convert.ToInt32(db.GetParameterValue(dbCommand, "RespCode"));
                objAccount.RespDesc = db.GetParameterValue(dbCommand, "RespMsg").ToString();

            }
            catch (Exception ex)
            {
                objAccount.RespCode = 1;
                objAccount.RespDesc = ex.ToString();
            }
            return objAccount;
        }

        /// <summary>
        /// Get Account Login Information
        /// </summary>
        /// <param name="EmailAddress">Email Address</param>
        /// <param name="Password">Password</param>
        /// <returns>Account</returns>
        public static Account GetAccountByLoginInfo(string EmailAddress, string Password)
        {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelAccountByLoginInfo");
            //Adding Input parameters   
            db.AddInParameter(dbCommand, "EmailAddress", DbType.String, EmailAddress);
            db.AddInParameter(dbCommand, "Password", DbType.String, Password);

            Account objAccount = new Account();
            IDataReader dr = null;
            try
            {
                // Execute command 
                dr = db.ExecuteReader(dbCommand);

                //Set Output
                while (dr.Read())
                {
                    objAccount.AccountId = Convert.ToInt32(dr["AccountID"].ToString());
                    objAccount.EmailAddress = dr["EmailAddress"].ToString();
                    objAccount.FullName = dr["FullName"].ToString();
                    objAccount.LastName = dr["LastName"].ToString();
                    objAccount.CompanyName = dr["CompanyName"].ToString();
                    objAccount.Address = dr["Address"].ToString();
                    objAccount.PostCode = dr["PostCode"].ToString();
                    objAccount.City = dr["City"].ToString();

                    if (dr["StateId"] != DBNull.Value)
                    {
                        State objState = new State();
                        objState.StateId = dr["StateId"].ToString();
                        objAccount.State = objState;
                    }

                    objAccount.Country = CountryLayer.GetCountryById(dr["CountryId"].ToString());
                    objAccount.Telephone = dr["Telephone"].ToString();
                    objAccount.Fax = dr["Fax"].ToString();
                    objAccount.Mobile = dr["Mobile"].ToString();
                    objAccount.Password = dr["Password"].ToString();
                    objAccount.AccountStatus = AccountLayer.GetAccountStatusById(dr["AccountStatusId"].ToString());
                    objAccount.SalesCode = dr["SalesCode"].ToString();
                    objAccount.VATNumber = dr["VATNumber"].ToString();
                    objAccount.VATNumberStatus = AccountLayer.GetVATNumberStatusById(dr["VATNumberStatusId"].ToString());
                    objAccount.Discount = Convert.ToInt16(dr["Discount"].ToString());
                    objAccount.CreatedDate = Convert.ToDateTime(dr["CreatedDate"].ToString());
                    objAccount.LastModifiedDate = Convert.ToDateTime(dr["LastModifiedDate"].ToString());
                    objAccount.AccountType = AccountLayer.GetAccountTypeById(Convert.ToInt32(dr["AccountTypeId"]));
                }
            }
            catch (Exception ex)
            {
                objAccount.RespCode = 1;
                objAccount.RespDesc = ex.ToString();
            }
            finally
            {
                dr.Close();
            }
            return objAccount;
        }

        /// <summary>
        /// Get Account by Account ID
        /// </summary>
        /// <param name="AccountId">Account ID</param>
        /// <returns>Account</returns>
        public static Account GetAccountById(int AccountId)
        {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelAccountById");
            //Adding Input parameters   
            db.AddInParameter(dbCommand, "AccountID", DbType.Int32, AccountId);

            Account objAccount = new Account();
            IDataReader dr = null;
            try
            {
                // Execute command 
                dr = db.ExecuteReader(dbCommand);

                //Set Output
                while (dr.Read())
                {
                    objAccount.AccountId = Convert.ToInt32(dr["AccountID"].ToString());
                    objAccount.EmailAddress = dr["EmailAddress"].ToString();
                    objAccount.FullName = dr["FullName"].ToString();
                    objAccount.LastName = dr["LastName"].ToString();
                    objAccount.CompanyName = dr["CompanyName"].ToString();
                    objAccount.Address = dr["Address"].ToString();
                    objAccount.PostCode = dr["PostCode"].ToString();
                    objAccount.City = dr["City"].ToString();
                    objAccount.Profile = dr["Profile"].ToString();
                    objAccount.CompanyWebsite = dr["CompanyWebsite"].ToString();

                    if (dr["StateId"] != DBNull.Value)
                    {
                        State objState = new State();
                        objState.StateId = dr["StateId"].ToString();
                        objAccount.State = objState;
                    }

                    objAccount.Country = CountryLayer.GetCountryById(dr["CountryId"].ToString());
                    objAccount.Telephone = dr["Telephone"].ToString();
                    objAccount.Fax = dr["Fax"].ToString();
                    objAccount.Mobile = dr["Mobile"].ToString();
                    objAccount.Password = dr["Password"].ToString();
                    objAccount.AccountStatus = AccountLayer.GetAccountStatusById(dr["AccountStatusId"].ToString());
                    objAccount.SalesCode = dr["SalesCode"].ToString();
                    objAccount.VATNumber = dr["VATNumber"].ToString();
                    objAccount.VATNumberStatus = AccountLayer.GetVATNumberStatusById(dr["VATNumberStatusId"].ToString());
                    objAccount.AccountType = AccountLayer.GetAccountTypeById(Convert.ToInt32(dr["AccountTypeId"]));
                    
                    if (dr["TenderYN"] == DBNull.Value)
                        objAccount.TenderYN = false;
                    else
                        objAccount.TenderYN = Convert.ToBoolean(dr["TenderYN"]);

                    objAccount.Discount = Convert.ToInt16(dr["Discount"].ToString());
                    objAccount.CreatedDate = Convert.ToDateTime(dr["CreatedDate"].ToString());
                    objAccount.LastModifiedDate = Convert.ToDateTime(dr["LastModifiedDate"].ToString());
                }
            }
            catch (Exception ex)
            {
                objAccount.RespCode = 1;
                objAccount.RespDesc = ex.ToString();
            }
            finally
            {
                dr.Close();
            }
            return objAccount;

        }


        /// <summary>
        /// Get all live accounts for the suppliers page
        /// </summary>
        /// <returns></returns>
        public static List<Account> GetAllLiveAccounts()
        {
            List<Account> lstAccounts = new List<Account>();

            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelAllLiveAccounts");

            IDataReader dr = null;
            try
            {
                // Execute command 
                dr = db.ExecuteReader(dbCommand);

                //Set Output
                while (dr.Read())
                {
                    Account objAccount = new Account();
                    objAccount.AccountId = Convert.ToInt32(dr["AccountID"].ToString());
                    objAccount.EmailAddress = dr["EmailAddress"].ToString();
                    objAccount.FullName = dr["FullName"].ToString();
                    objAccount.LastName = dr["LastName"].ToString();
                    objAccount.CompanyName = dr["CompanyName"].ToString();
                    objAccount.Address = dr["Address"].ToString();
                    objAccount.PostCode = dr["PostCode"].ToString();
                    objAccount.City = dr["City"].ToString();
                    objAccount.Profile = dr["Profile"].ToString();
                    objAccount.CompanyWebsite = dr["CompanyWebsite"].ToString();

                    if (dr["StateId"] != DBNull.Value)
                    {
                        State objState = new State();
                        objState.StateId = dr["StateId"].ToString();
                        objAccount.State = objState;
                    }

                    objAccount.Country = CountryLayer.GetCountryById(dr["CountryId"].ToString());
                    objAccount.Telephone = dr["Telephone"].ToString();
                    objAccount.Fax = dr["Fax"].ToString();
                    objAccount.Mobile = dr["Mobile"].ToString();
                    objAccount.Password = dr["Password"].ToString();
                    objAccount.AccountStatus = AccountLayer.GetAccountStatusById(dr["AccountStatusId"].ToString());
                    objAccount.SalesCode = dr["SalesCode"].ToString();
                    objAccount.VATNumber = dr["VATNumber"].ToString();
                    objAccount.VATNumberStatus = AccountLayer.GetVATNumberStatusById(dr["VATNumberStatusId"].ToString());
                    objAccount.AccountType = AccountLayer.GetAccountTypeById(Convert.ToInt32(dr["AccountTypeId"]));
                    objAccount.Discount = Convert.ToInt16(dr["Discount"].ToString());

                    lstAccounts.Add(objAccount);
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

            return lstAccounts;
        }


        /// <summary>
        /// Get All Account Records
        /// </summary>
        /// <param name="EmailAddress">Email Address</param>
        /// <param name="Name">Name</param>
        /// <param name="NameCategoryId">NameCategoryId</param>
        /// <param name="CountryId">Country ID</param>
        /// <param name="AccountStatusId">Account Status ID</param>
        /// <param name="AccountTypeId">Account Type ID</param>
        /// <returns>List of Accounts</returns>
        public static List<Account> GetAllAccount(string EmailAddress, string Name, int NameCategoryId, string CountryId, string AccountStatusId, int AccountTypeId)
        {
            List<Account> lstAccounts = new List<Account>();

            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelAllAccount");
            
            //Adding Input parameters   
            db.AddInParameter(dbCommand, "EmailAddress", DbType.String, EmailAddress);
            db.AddInParameter(dbCommand, "Name", DbType.String, Name);
            db.AddInParameter(dbCommand, "NameCategoryId", DbType.Int32, NameCategoryId);
            db.AddInParameter(dbCommand, "CountryID", DbType.AnsiString, CountryId);
            db.AddInParameter(dbCommand, "AccountStatusID", DbType.AnsiString, AccountStatusId);
            db.AddInParameter(dbCommand, "AccountTypeID", DbType.Int32, AccountTypeId);

            IDataReader dr = null;
            try
            {
                // Execute command 
                dr = db.ExecuteReader(dbCommand);

                //Set Output
                while (dr.Read())
                {
                    Account objAccount = new Account();
                    objAccount.AccountId = Convert.ToInt32(dr["AccountID"].ToString());
                    objAccount.EmailAddress = dr["EmailAddress"].ToString();
                    objAccount.FullName = dr["FullName"].ToString();
                    objAccount.LastName = dr["LastName"].ToString();
                    objAccount.CompanyName = dr["CompanyName"].ToString();
                    objAccount.Address = dr["Address"].ToString();
                    objAccount.PostCode = dr["PostCode"].ToString();
                    objAccount.City = dr["City"].ToString();
                    objAccount.Profile = dr["Profile"].ToString();

                    if (dr["StateId"] != DBNull.Value)
                    {
                        State objState = new State();
                        objState.StateId = dr["StateId"].ToString();
                        objAccount.State = objState;
                    }

                    objAccount.Country = CountryLayer.GetCountryById(dr["CountryId"].ToString());
                    objAccount.Telephone = dr["Telephone"].ToString();
                    objAccount.Fax = dr["Fax"].ToString();
                    objAccount.Mobile = dr["Mobile"].ToString();
                    objAccount.Password = dr["Password"].ToString();
                    objAccount.AccountStatus = AccountLayer.GetAccountStatusById(dr["AccountStatusId"].ToString());
                    objAccount.SalesCode = dr["SalesCode"].ToString();
                    objAccount.VATNumber = dr["VATNumber"].ToString();
                    objAccount.VATNumberStatus = AccountLayer.GetVATNumberStatusById(dr["VATNumberStatusId"].ToString());
                    objAccount.AccountType = AccountLayer.GetAccountTypeById(Convert.ToInt32(dr["AccountTypeId"]));
                    objAccount.Discount = Convert.ToInt16(dr["Discount"].ToString());
                    //objAccount.CreatedDate = Convert.ToDateTime(dr["CreatedDate"].ToString());
                    //objAccount.LastModifiedDate = Convert.ToDateTime(dr["LastModifiedDate"].ToString());

                    lstAccounts.Add(objAccount);
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

            return lstAccounts;
        }


        /// <summary>
        /// Update Account's Password
        /// </summary>
        /// <param name="AccountId">Account ID</param>
        /// <param name="Password">New Password</param>
        /// <returns>ResponseInfo</returns>
        public static ResponseInfo UpdateAccountPassword(int AccountId, string Password)
        {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prUpdAccountPassword");

            //Adding Input parameters            
            db.AddInParameter(dbCommand, "AccountId", DbType.Int32, AccountId);
            db.AddInParameter(dbCommand, "Password", DbType.String, Password);
            //Adding Output parameters
            db.AddOutParameter(dbCommand, "RespCode", DbType.Int32, 100);
            db.AddOutParameter(dbCommand, "RespMsg", DbType.String, 500);

            ResponseInfo objResponseInfo = new ResponseInfo();

            try
            {
                // Execute
                db.ExecuteNonQuery(dbCommand);
                //Set Output                 
                objResponseInfo.RespCode = Convert.ToInt32(db.GetParameterValue(dbCommand, "RespCode"));
                objResponseInfo.RespDesc = db.GetParameterValue(dbCommand, "RespMsg").ToString();

            }
            catch (Exception ex)
            {
                objResponseInfo.RespCode = 1;
                objResponseInfo.RespDesc = ex.ToString();
            }

            return objResponseInfo;
        }

        /// <summary>
        /// Return password of account
        /// </summary>
        /// <param name="EmailAddress">Email Address</param>
        /// <returns>Account</returns>
        public static Account GetPassword(string EmailAddress)
        {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelPasswordByEmailAddress");

            //Adding Input parameters            
            db.AddInParameter(dbCommand, "EmailAddress", DbType.String, EmailAddress);

            Account objAccount = new Account();
            IDataReader dr = null;

            try
            {
                // Execute command 
                dr = db.ExecuteReader(dbCommand);

                //Set Output
                if (dr.Read())
                {
                    objAccount.AccountId = Convert.ToInt32(dr["AccountID"].ToString());
                    objAccount.FullName = dr["FullName"].ToString();
                    objAccount.Password = dr["Password"].ToString();
                    objAccount.EmailAddress = dr["EmailAddress"].ToString();
                    objAccount.RespCode = 0;
                }
                else
                {
                    objAccount.RespCode = 3;
                    objAccount.RespDesc = "Sorry email address not found.";
                }
            }
            catch (Exception ex)
            {
                objAccount.RespCode = 1;
                objAccount.RespDesc = ex.ToString();
            }
            return objAccount;
        }

        /// <summary>
        /// Get All references of Account Status
        /// </summary>
        /// <returns>List of Account Status</returns>
        public static List<AccountStatus> GetAccountStatus()
        {
            List<AccountStatus> lstAccountStatus = new List<AccountStatus>();

            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelAccountStatus");

            IDataReader dr = null;

            try
            {
                // Execute command
                dr = db.ExecuteReader(dbCommand);

                //Set Output  and add to the list 
                while (dr.Read())
                {
                    AccountStatus objAccountStatus = new AccountStatus();
                    objAccountStatus.AccountStatusId = dr["AccountStatusId"].ToString();
                    objAccountStatus.Description = dr["Description"].ToString();
                    lstAccountStatus.Add(objAccountStatus);
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
            return lstAccountStatus;

        }
        
        /// <summary>
        /// Get All references of Account Type
        /// </summary>
        /// <returns>List of Account Types</returns>
        public static List<AccountType> GetAccountType()
        {
            List<AccountType> lstAccountType = new List<AccountType>();

            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelAccountType");

            IDataReader dr = null;

            try
            {
                // Execute command
                dr = db.ExecuteReader(dbCommand);

                //Set Output  and add to the list 
                while (dr.Read())
                {
                    AccountType objAccountType = new AccountType();
                    objAccountType.AccountTypeId = Convert.ToInt32(dr["AccountTypeId"]);
                    objAccountType.AccountTypeName = dr["AccountTypeName"].ToString();
                    lstAccountType.Add(objAccountType);
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
            return lstAccountType;

        }

        /// <summary>
        /// Get particular Account Type record by Account Type ID
        /// </summary>
        /// <param name="AccountTypeId">Account Type ID</param>
        /// <returns>AccountType</returns>
        public static AccountType GetAccountTypeById(int AccountTypeId)
        {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelAccountTypeById");

            //Adding Input parameters    
            db.AddInParameter(dbCommand, "AccountTypeId", DbType.Int32, AccountTypeId);
            IDataReader dr = null;
            AccountType objAccountType = new AccountType();
            try
            {
                // Execute command
                dr = db.ExecuteReader(dbCommand);
                //Set Output
                while (dr.Read())
                {
                    //Set Output            
                    objAccountType.AccountTypeId = Convert.ToInt32(dr["AccountTypeId"]);
                    objAccountType.AccountTypeName = dr["AccountTypeName"].ToString();
                }

            }
            catch (Exception ex)
            {
                objAccountType.RespCode = 1;
                objAccountType.RespDesc = ex.ToString();
            }
            finally
            {
                dr.Close();
            }
            return objAccountType;
        }

        /// <summary>
        /// Get All references of VAT Numbers Status
        /// </summary>
        /// <returns>List of VAT Numbers Status</returns>
        public static List<VATNumberStatus> GetVATNumberStatus()
        {
            List<VATNumberStatus> lstVATNumberStatus = new List<VATNumberStatus>();

            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelVATNumberStatus");

            IDataReader dr = null;

            try
            {
                // Execute command
                dr = db.ExecuteReader(dbCommand);

                //Set Output  and add to the list 
                while (dr.Read())
                {
                    VATNumberStatus objVATNumberStatus = new VATNumberStatus();
                    objVATNumberStatus.VATNumberStatusId = dr["VATNumberStatusId"].ToString();
                    objVATNumberStatus.Description = dr["Description"].ToString();
                    lstVATNumberStatus.Add(objVATNumberStatus);
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
            return lstVATNumberStatus;

        }

        /// <summary>
        /// Get particular VAT Number Status by VAT Number Status ID
        /// </summary>
        /// <param name="VATNumberStatusId">VAT Number Status ID</param>
        /// <returns>VATNumberStatus</returns>
        public static VATNumberStatus GetVATNumberStatusById(string VATNumberStatusId)
        {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelVATNumberStatusById");

            //Adding Input parameters    
            db.AddInParameter(dbCommand, "VATNumberStatusId", DbType.AnsiString, VATNumberStatusId);
            IDataReader dr = null;

            VATNumberStatus objVATNumberStatus = new VATNumberStatus();

            try
            {
                // Execute command
                dr = db.ExecuteReader(dbCommand);

                //Set Output
                while (dr.Read())
                {

                    objVATNumberStatus.VATNumberStatusId = dr["VATNumberStatusId"].ToString();
                    objVATNumberStatus.Description = dr["Description"].ToString();

                }

            }
            catch (Exception ex)
            {
                objVATNumberStatus.RespCode = 1;
                objVATNumberStatus.RespDesc = ex.ToString();
            }
            finally
            {
                dr.Close();
            }

            return objVATNumberStatus;
        }

        /// <summary>
        /// Updating Account Status
        /// </summary>
        /// <param name="EmailAddress">Email Address</param>
        /// <param name="AccountStatusId">Account Status ID</param>
        /// <returns>ResponseInfo</returns>
        public static ResponseInfo UpdateAccountStatus(string EmailAddress, string AccountStatusId)
        {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prUpdAccountStatus");

            //Adding Input parameters            
            db.AddInParameter(dbCommand, "EmailAddress", DbType.String, EmailAddress);
            db.AddInParameter(dbCommand, "AccountStatusId", DbType.String, AccountStatusId);
            //Adding Output parameters
            db.AddOutParameter(dbCommand, "RespCode", DbType.Int32, 100);
            db.AddOutParameter(dbCommand, "RespMsg", DbType.String, 500);

            ResponseInfo objResponseInfo = new ResponseInfo();

            try
            {
                // Execute
                db.ExecuteNonQuery(dbCommand);
                //Set Output                 
                objResponseInfo.RespCode = Convert.ToInt32(db.GetParameterValue(dbCommand, "RespCode"));
                objResponseInfo.RespDesc = db.GetParameterValue(dbCommand, "RespMsg").ToString();

            }
            catch (Exception ex)
            {
                objResponseInfo.RespCode = 1;
                objResponseInfo.RespDesc = ex.ToString();
            }

            return objResponseInfo;
        }

        /// <summary>
        /// Get Account Confirmation Audit By Email
        /// </summary>
        /// <param name="EmailAddress">Email Address</param>
        /// <returns>AccountConfirmationAudit</returns>
        public static AccountConfirmationAudit GetAccountConfirmationAuditByEmail(string EmailAddress)
        {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelAccountConfirmationAuditByEmail");

            //Adding Input parameters            
            db.AddInParameter(dbCommand, "EmailAddress", DbType.String, EmailAddress);


            AccountConfirmationAudit objAccountConfirmationAudit = new AccountConfirmationAudit();
            IDataReader dr = null;
            try
            {
                // Execute command 
                dr = db.ExecuteReader(dbCommand);

                //Set Output
                while (dr.Read())
                {
                    objAccountConfirmationAudit.Id = Convert.ToInt32(dr["Id"].ToString());
                    objAccountConfirmationAudit.EmailAddress = dr["EmailAddress"].ToString();
                    objAccountConfirmationAudit.ConfirmationCode = dr["ConfirmationCode"].ToString();
                    objAccountConfirmationAudit.ConfirmedYN = Convert.ToBoolean(dr["ConfirmedYN"].ToString());


                }
            }
            catch (Exception ex)
            {
                objAccountConfirmationAudit.RespCode = 1;
                objAccountConfirmationAudit.RespDesc = ex.ToString();
            }
            finally
            {
                dr.Close();
            }

            return objAccountConfirmationAudit;
        }

        /// <summary>
        /// Add Account Email History
        /// </summary>
        /// <param name="objAccountEmailHistory">AccountEmailHistory</param>
        /// <returns>AccountEmailHistory</returns>
        public static AccountEmailHistory AddAccountEmailHistory(AccountEmailHistory objAccountEmailHistory)
        {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prInsAccountEmailHistory");

            //Adding Input parameters            
            db.AddInParameter(dbCommand, "AccountId", DbType.Int32, objAccountEmailHistory.AccountId);
            db.AddInParameter(dbCommand, "DateSent", DbType.DateTime, objAccountEmailHistory.DateSent);
            db.AddInParameter(dbCommand, "EmailAddress", DbType.String, objAccountEmailHistory.EmailAddress);
            db.AddInParameter(dbCommand, "Subject", DbType.String, objAccountEmailHistory.Subject);
            db.AddInParameter(dbCommand, "Message", DbType.String, objAccountEmailHistory.Message);            
            //Adding Output parameters            
            db.AddOutParameter(dbCommand, "RespCode", DbType.Int32, 100);
            db.AddOutParameter(dbCommand, "RespMsg", DbType.String, 500);


            try
            {
                // Execute
                db.ExecuteNonQuery(dbCommand);
                //Set Output for AddAccountEmailHistory                
                objAccountEmailHistory.RespCode = Convert.ToInt32(db.GetParameterValue(dbCommand, "RespCode"));
                objAccountEmailHistory.RespDesc = db.GetParameterValue(dbCommand, "RespMsg").ToString();

            }
            catch (Exception ex)
            {
                objAccountEmailHistory.RespCode = 1;
                objAccountEmailHistory.RespDesc = ex.ToString();
            }
            return objAccountEmailHistory;
        }
        */







    }
}

