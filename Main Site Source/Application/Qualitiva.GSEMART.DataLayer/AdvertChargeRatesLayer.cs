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
   public class AdvertChargeRatesLayer
    {
       private static Database db = DatabaseFactory.CreateDatabase();

       public static List<AdvertChargeRates> GetAdvertChargeRates()
       {
           List<AdvertChargeRates> lstAdvertChargeRates = new List<AdvertChargeRates>();

           //Accessing DB Layer
           DbCommand dbCommand = db.GetStoredProcCommand("prSelAdvertChargeRates");

           IDataReader dr = null;

           try
           {
               // Execute command
               dr = db.ExecuteReader(dbCommand);

               //Set Output  and add to the list 
               while (dr.Read())
               {
                   AdvertChargeRates objAdvertChargeRates = new AdvertChargeRates();
                   
                   objAdvertChargeRates.ChargeRateId = Convert.ToInt32(dr["ChargeRateId"].ToString());
                   objAdvertChargeRates.Description = dr["Description"].ToString();
                   objAdvertChargeRates.MonthCount = Convert.ToInt32(dr["MonthCount"].ToString());
                   objAdvertChargeRates.CategoryId = dr["CategoryId"].ToString();
                   objAdvertChargeRates.CurrencyId = dr["CurrencyId"].ToString();
                   objAdvertChargeRates.Rate =Convert.ToDecimal(dr["Rate"].ToString());
                   objAdvertChargeRates.FreeYN =Convert.ToBoolean(dr["FreeYN"].ToString());
                   objAdvertChargeRates.UntilYouBuyYN =Convert.ToBoolean(dr["UntilYouBuyYN"].ToString());

                   lstAdvertChargeRates.Add(objAdvertChargeRates);
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
           return lstAdvertChargeRates;

       }

       public static List<AdvertChargeRates> GetAdvertChargeRatesByCategoryId(string CurrencyId, string AdvertCategoryId) {
           List<AdvertChargeRates> lstAdvertChargeRates = new List<AdvertChargeRates>();

           //Accessing DB Layer
           DbCommand dbCommand = db.GetStoredProcCommand("prSelAdvertChargeRatesByCategoryId");

           db.AddInParameter(dbCommand, "CurrencyId", DbType.AnsiString, CurrencyId);
           db.AddInParameter(dbCommand, "AdvertCategoryId", DbType.AnsiString, AdvertCategoryId);
           
           IDataReader dr = null;
           try
           {
               // Execute command
               dr = db.ExecuteReader(dbCommand);


               //Set Output  and add to the list 
               while (dr.Read())
               {
                   AdvertChargeRates objAdvertChargeRates = new AdvertChargeRates();

                   objAdvertChargeRates.ChargeRateId = Convert.ToInt32(dr["ChargeRateId"].ToString());
                   objAdvertChargeRates.Description = dr["Description"].ToString();
                   objAdvertChargeRates.MonthCount = Convert.ToInt32(dr["MonthCount"].ToString());
                   objAdvertChargeRates.CategoryId = dr["CategoryId"].ToString();
                   objAdvertChargeRates.CurrencyId = dr["CurrencyId"].ToString();
                   objAdvertChargeRates.Rate = Convert.ToDecimal(dr["Rate"].ToString());
                   objAdvertChargeRates.FreeYN = Convert.ToBoolean(dr["FreeYN"].ToString());
                   objAdvertChargeRates.UntilYouBuyYN = Convert.ToBoolean(dr["UntilYouBuyYN"].ToString());

                   lstAdvertChargeRates.Add(objAdvertChargeRates);
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
           return lstAdvertChargeRates; 
       }

       public static AdvertChargeRates GetAdvertChargeRatesById(int ChargeRatesId)
       {
           //Accessing DB Layer
           DbCommand dbCommand = db.GetStoredProcCommand("prSelAdvertChargeRatesByID");

           //Adding Input parameters    
           db.AddInParameter(dbCommand, "ChargeRateId", DbType.Int32, ChargeRatesId);
           IDataReader dr = null;
           AdvertChargeRates objAdvertChargeRates = new AdvertChargeRates();
           try
           {
               // Execute command
               dr = db.ExecuteReader(dbCommand);
               //Set Output
               while (dr.Read())
               {
                   //Set Output            
                   objAdvertChargeRates.ChargeRateId = Convert.ToInt32(dr["ChargeRateId"].ToString());
                   objAdvertChargeRates.Description = dr["Description"].ToString();
                   objAdvertChargeRates.MonthCount = Convert.ToInt32(dr["MonthCount"].ToString());
                   objAdvertChargeRates.CategoryId = dr["CategoryId"].ToString();
                   objAdvertChargeRates.CurrencyId = dr["CurrencyId"].ToString();
                   objAdvertChargeRates.Rate = Convert.ToDecimal(dr["Rate"].ToString());
                   objAdvertChargeRates.FreeYN = Convert.ToBoolean(dr["FreeYN"].ToString());
                   objAdvertChargeRates.UntilYouBuyYN = Convert.ToBoolean(dr["UntilYouBuyYN"].ToString());
               }
           }
           catch (Exception ex)
           {
               objAdvertChargeRates.RespCode = 1;
               objAdvertChargeRates.RespDesc = ex.ToString();
           }
           finally
           {
               dr.Close();
           }
           return objAdvertChargeRates;
       }
    }
}
