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
    public class SiteHitCounterLayer
    {
        private static Database db = DatabaseFactory.CreateDatabase();

        public static SiteHitCounter AddSiteHitCounter(SiteHitCounter obj)
        {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prInsSiteHitCounter");

            //Adding Input parameters            
            
            db.AddInParameter(dbCommand, "VisitorBrowser", DbType.String, obj.VisitorBrowser);
            db.AddInParameter(dbCommand, "IPAddress", DbType.String, obj.IPAddress);
            
            db.AddOutParameter(dbCommand, "RespCode", DbType.Int32, 100);
            db.AddOutParameter(dbCommand, "RespMsg", DbType.String, 500);


            try
            {
                // Execute
                db.ExecuteNonQuery(dbCommand);
                //Set Output for AddAdvert
                obj.RespCode = Convert.ToInt32(db.GetParameterValue(dbCommand, "RespCode"));
                obj.RespDesc = db.GetParameterValue(dbCommand, "RespMsg").ToString();

            }
            catch (Exception ex)
            {
                obj.RespCode = 1;
                obj.RespDesc = ex.ToString();
            }
            return obj;
        }

        public static SiteHitCounter GetSiteHitCount()
        {
            SiteHitCounter obj = new SiteHitCounter();
            obj.HitCount = 0;

            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelSiteHitCount");

            try
            {
                obj.HitCount = Convert.ToUInt64(db.ExecuteScalar(dbCommand));
            }
            catch (Exception ex)
            {
                obj.RespCode = 1;
                obj.RespDesc = ex.ToString();
            }
            return obj;
        }

    }
}
