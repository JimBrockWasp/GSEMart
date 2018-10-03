using System;
using System.Collections.Generic;
using System.Text;
/*
using Microsoft.Practices.EnterpriseLibrary.Data;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Data;
*/
using System.Data.Common;
using System.Configuration;
using System.Data.SqlClient;
using Qualitiva.GSEMART.BusinessObject;

namespace Qualitiva.GSEMART.DataLayer
{
    public class ManufacturerLayer
    {
        
        public static List<Manufacturer> GetManufacturers()
        {
            List<Manufacturer> lstManufacturer = new List<Manufacturer>();

            
            string ConnectionString = ConfigurationManager.ConnectionStrings["GSEMART_DBSERVER"].ConnectionString;
            SqlConnection Con = new SqlConnection(ConnectionString);

            SqlCommand dbCommand = null;
            

            //Accessing DB Layer
            //DbCommand dbCommand = db.GetStoredProcCommand("prSelManufacturers");

            SqlDataReader dr = null;

            try
            {

                // Connect to the Database
                Con.Open();

                // Create the command Object
                dbCommand = Con.CreateCommand();
                dbCommand.CommandText = "prSelManufacturers";
            
                // Execute command
                dr = dbCommand.ExecuteReader();


                //Set Output  and add to the list 
                while (dr.Read())
                {
                    Manufacturer objManufacturer = new Manufacturer();
                    objManufacturer.ManufacturerName = dr["Manufacturer"].ToString();
                    lstManufacturer.Add(objManufacturer);
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
            return lstManufacturer;

        }


    }
}
