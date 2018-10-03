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
   public class AdvertAvailabilityLayer
    {
        private static Database db = DatabaseFactory.CreateDatabase();
       /// <summary>
       /// Get all AdvertAvailability
       /// </summary>
       /// <returns></returns>
        public static List<AdvertAvailability> GetAdvertAvailability()
        {
            List<AdvertAvailability> lstAdvertAvailability = new List<AdvertAvailability>();
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelAdvertAvailability");
            IDataReader dr = null;
            try
            {
                // Execute command
                dr = db.ExecuteReader(dbCommand);

                //Set Output  and add to the list 
                while (dr.Read())
                {
                    AdvertAvailability objAdvertAvailability = new AdvertAvailability();
                    SetReaderInfo(dr, objAdvertAvailability);
                    lstAdvertAvailability.Add(objAdvertAvailability);
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
            return lstAdvertAvailability;
        }


        public static AdvertAvailability GetAdvertAvailabilityById(string AdvertAvailabilityId)
       {
           //Accessing DB Layer
           DbCommand dbCommand = db.GetStoredProcCommand("prSelAdvertAvailabilityById");
           //Adding Input parameters   
           db.AddInParameter(dbCommand, "AdvertAvailabilityID", DbType.String, AdvertAvailabilityId);

           AdvertAvailability objAdvertAvailability = new AdvertAvailability();
           IDataReader dr = null;
           try
           {
               // Execute command 
               dr = db.ExecuteReader(dbCommand);

               //Set Output
               while (dr.Read())
               {
                   SetReaderInfo(dr, objAdvertAvailability);
               }
           }
           catch (Exception ex)
           {
               objAdvertAvailability.RespCode = 1;
               objAdvertAvailability.RespDesc = ex.ToString();
           }
           finally
           {
               dr.Close();
           }
           return objAdvertAvailability;

       }

       private static void SetReaderInfo(IDataReader dr, AdvertAvailability objAdvertAvailability)
       {
           objAdvertAvailability.AdvertAvailabilityId = dr["AdvertAvailabilityID"].ToString();
           objAdvertAvailability.Description = dr["Description"].ToString();
       }
    }
}
