using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Data;
using System.Data.Common;
using System.Configuration;
using Qualitiva.GSEMART.BusinessObject;

namespace Qualitiva.GSEMART.DataLayer
{
    public class CountryLayer
    {
        private static Database db = DatabaseFactory.CreateDatabase();

        public static List<Country> GetCountry()
        {
            List<Country> lstCountry = new List<Country>();

            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelCountry");

            IDataReader dr = null;

            try
            {
                // Execute command
                dr = db.ExecuteReader(dbCommand);

                //Set Output  and add to the list 
                while (dr.Read())
                {
                    Country objCountry = new Country();
                    objCountry.CountryId = dr["CountryId"].ToString();
                    objCountry.CountryName = dr["CountryName"].ToString();
                    objCountry.EUYN = Convert.ToBoolean(dr["EUYN"]);
                    objCountry.CurrencyId = dr["CurrencyId"].ToString();
                    lstCountry.Add(objCountry);
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
            return lstCountry;

        }


        public static Country GetCountryById(string CountryId)
        {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelCountryById");

            //Adding Input parameters    
            db.AddInParameter(dbCommand, "CountryId", DbType.AnsiString, CountryId);

            IDataReader dr = null;
            Country objCountry = new Country();
            try
            {
                // Execute command
                dr = db.ExecuteReader(dbCommand);

                //Set Output
                while (dr.Read())
                {

                    objCountry.CountryId = dr["CountryId"].ToString();
                    objCountry.CountryName = dr["CountryName"].ToString();
                    objCountry.EUYN = Convert.ToBoolean(dr["EUYN"]);
                    objCountry.CurrencyId = dr["CurrencyId"].ToString();
                }

            }
            catch (Exception ex)
            {
                objCountry.RespCode = 1;
                objCountry.RespDesc = ex.ToString();
            }
            finally
            {
                dr.Close();
            }
            return objCountry;
        }

        public static Boolean IsCountryEUYN(string CountryId)
        {
            DbCommand dbCommand = db.GetStoredProcCommand("prIsCountryEUYN");
            db.AddInParameter(dbCommand, "CountryId", DbType.AnsiString, CountryId);
            object bln = (object)db.ExecuteScalar(dbCommand);
            return Convert.ToBoolean(bln);
        }

    }
}
