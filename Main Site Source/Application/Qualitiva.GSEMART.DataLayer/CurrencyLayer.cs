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
   public class CurrencyLayer
    {
        private static Database db = DatabaseFactory.CreateDatabase();
       /// <summary>
       /// Get all currency
       /// </summary>
       /// <returns></returns>
        public static List<Currency> GetCurrency()
        {
            List<Currency> lstCurrency = new List<Currency>();
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelCurrency");
            IDataReader dr = null;
            try
            {
                // Execute command
                dr = db.ExecuteReader(dbCommand);

                //Set Output  and add to the list 
                while (dr.Read())
                {
                    Currency objCurrency = new Currency();
                    SetReaderInfo(dr, objCurrency);
                    lstCurrency.Add(objCurrency);
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
            return lstCurrency;
        }

       public static List<Currency> GetCurrencyForPayment()
       {
           List<Currency> lstCurrency = new List<Currency>();
           //Accessing DB Layer
           DbCommand dbCommand = db.GetStoredProcCommand("prSelCurrencyForPayment");
           IDataReader dr = null;
           try
           {
               // Execute command
               dr = db.ExecuteReader(dbCommand);

               //Set Output  and add to the list 
               while (dr.Read())
               {
                   Currency objCurrency = new Currency();
                   SetReaderInfo(dr, objCurrency);
                   lstCurrency.Add(objCurrency);
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
           return lstCurrency;
       }

       public static Currency GetCurrencyById(string CurrencyId)
       {
           //Accessing DB Layer
           DbCommand dbCommand = db.GetStoredProcCommand("prSelCurrencyById");
           //Adding Input parameters   
           db.AddInParameter(dbCommand, "CurrencyID", DbType.String, CurrencyId);

           Currency objCurrency = new Currency();
           IDataReader dr = null;
           try
           {
               // Execute command 
               dr = db.ExecuteReader(dbCommand);

               //Set Output
               while (dr.Read())
               {
                   SetReaderInfo(dr, objCurrency);
               }
           }
           catch (Exception ex)
           {
               objCurrency.RespCode = 1;
               objCurrency.RespDesc = ex.ToString();
           }
           finally
           {
               dr.Close();
           }
           return objCurrency;

       }

       private static void SetReaderInfo(IDataReader dr, Currency objCurrency)
       {
           objCurrency.CurrencyId = dr["CurrencyID"].ToString();
           objCurrency.Description = dr["Description"].ToString();
           objCurrency.CurrencyValue = Convert.ToDecimal(dr["CurrencyValue"]);
           objCurrency.DecimalUnicode = dr["DecimalUnicode"].ToString();
           objCurrency.AllowPaymentYN = Convert.ToBoolean(dr["IsPaymentAllowed"].ToString());
       }
    }
}
