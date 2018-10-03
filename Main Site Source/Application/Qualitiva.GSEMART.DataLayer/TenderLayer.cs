using System;
using System.Collections.Generic;
using System.Text;
//using Microsoft.Practices.EnterpriseLibrary.Data;
using Qualitiva.GSEMART.BusinessObject;
using System.Data.Common;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Qualitiva.GSEMART.DataLayer
{
    public class TenderLayer
    {
        
        public static Tender AddTender(Tender objTender)
        {

            string ConnectionString = ConfigurationManager.ConnectionStrings["GSEMART_DBSERVER"].ConnectionString;
            SqlConnection Con = new SqlConnection(ConnectionString);

            SqlCommand dbCommand = null;

            // Connect to the Database
            Con.Open();

            // Create the command Object
            dbCommand = Con.CreateCommand();
            dbCommand.CommandText = "prInsTender";
            dbCommand.CommandType = CommandType.StoredProcedure;
            
            //Adding Input parameters            
            dbCommand.Parameters.AddWithValue("CompanyName", objTender.CompanyName);
            dbCommand.Parameters.AddWithValue("ContactName", objTender.ContactName);
            dbCommand.Parameters.AddWithValue("EmailAddress", objTender.EmailAddress);
            dbCommand.Parameters.AddWithValue("Telephone", objTender.Telephone);
            dbCommand.Parameters.AddWithValue("ExpiryDate", objTender.ExpiryDate);
            dbCommand.Parameters.AddWithValue("Subject", objTender.Subject);
            dbCommand.Parameters.AddWithValue("Notes", objTender.Notes);
            dbCommand.Parameters.AddWithValue("Country", objTender.Country);
            dbCommand.Parameters.AddWithValue("URL", objTender.URL);
            
            //Adding Output parameters
            dbCommand.Parameters.Add("TenderID", SqlDbType.Int);
            dbCommand.Parameters["TenderID"].Direction = ParameterDirection.Output;
            
            dbCommand.Parameters.Add("RespCode", SqlDbType.Int);
            dbCommand.Parameters["RespCode"].Direction = ParameterDirection.Output;
            
            dbCommand.Parameters.Add("RespMsg", SqlDbType.NVarChar, 500);
            dbCommand.Parameters["RespMsg"].Direction = ParameterDirection.Output;
            
            try
            {

                // Execute
                dbCommand.ExecuteNonQuery();

                //Set Output for AddAccount
                objTender.TenderId = (int)dbCommand.Parameters["TenderId"].Value;
                objTender.RespCode = (int)dbCommand.Parameters["RespCode"].Value;
                objTender.RespDesc = dbCommand.Parameters["RespMsg"].Value.ToString();

            }
            catch (Exception ex)
            {
                objTender.RespCode = 1;
                objTender.RespDesc = ex.ToString();
            }
            finally
            {
                if (Con != null)
                {
                    Con.Close();
                }
            }
            return objTender;
        }

        /// <summary>
        /// Get All Tender List
        /// </summary>
        /// <returns>List of Tender</returns>
        /*
        public static List<Tender> GetAllTender() {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelAllTender");

            List<Tender> lstTender = new List<Tender>();
            DataSet ds = new DataSet();

            try
            {
                // Execute command    
                ds = db.ExecuteDataSet(dbCommand);

                DataTable dataTable = ds.Tables[0]; //advert records

                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    Tender objTender = new Tender();
                    DataRow Row;

                    Row = dataTable.Rows[i];

                    objTender.TenderId = Convert.ToInt32(Row["TenderId"]);
                    objTender.CompanyName = Row["CompanyName"].ToString();
                    objTender.ContactName = Row["ContactName"].ToString();
                    objTender.NumberOfGSERequested = Row["NumberOfGSERequested"].ToString();
                    objTender.Subject = Row["Subject"].ToString();
                    objTender.Location = Row["Location"].ToString();
                    objTender.EmailAddress = Row["EmailAddress"].ToString();
                    objTender.Telephone = Row["Telephone"].ToString();
                    objTender.Mobile = Row["Mobile"].ToString();
                    objTender.Notes = Row["Notes"].ToString();
                    objTender.RequestedDate = Convert.ToDateTime(Row["RequestedDate"]);

                    if (Row["EndDate"] != DBNull.Value)
                        objTender.EndDate = Convert.ToDateTime(Row["EndDate"]);
                    else
                        objTender.EndDate = DateTime.MinValue;

                    objTender.URL = Row["URL"].ToString();
                    objTender.CreateDate = Convert.ToDateTime(Row["CreateDate"]);

                    lstTender.Add(objTender);
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


            return lstTender;
        }
         */
    }
}
