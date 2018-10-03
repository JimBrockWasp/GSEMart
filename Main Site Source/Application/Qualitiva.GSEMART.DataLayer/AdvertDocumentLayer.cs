using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

using System.Configuration;
using Qualitiva.GSEMART.BusinessObject;

namespace Qualitiva.GSEMART.DataLayer
{
    public class AdvertDocumentLayer
    {

        public static List<AdvertDocument> GetAdvertDocuments(int AdvertId)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["GSEMART_DBSERVER"].ConnectionString;
            SqlConnection Con = new SqlConnection(ConnectionString);

            SqlCommand dbCommand = null;
            SqlDataReader dr = null;


            List<AdvertDocument> lstAdvertDocument = new List<AdvertDocument>();

            try
            {

                // Connect to the Database
                Con.Open();

                // Create the command Object
                dbCommand = Con.CreateCommand();
                dbCommand.CommandType = CommandType.StoredProcedure;
                dbCommand.CommandText = "DLGetDocumentsByAdvertId";
                dbCommand.Parameters.AddWithValue("AdvertId", AdvertId);

                // Execute command 
                dr = dbCommand.ExecuteReader();

                //Set Output  and add to the list 
                while (dr.Read())
                {
                    AdvertDocument objAdvertDocument = new AdvertDocument();
                    objAdvertDocument.AdvertId = AdvertId;
                    objAdvertDocument.IndexId = Convert.ToInt32(dr["IndexId"]);
                    objAdvertDocument.PhysicalPath = dr["PhysicalPath"].ToString();
                    objAdvertDocument.VirtualPath = dr["VirtualPath"].ToString();
                    objAdvertDocument.Title = dr["Title"].ToString();
                    lstAdvertDocument.Add(objAdvertDocument);
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
            return lstAdvertDocument;

        }


    }
}
