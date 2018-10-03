/**
 * Class for Advert Spares Layer
 */
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
    public class AdvertSparesLayer
    {
        private static Database db = DatabaseFactory.CreateDatabase();

        /// <summary>
        /// Adding Advert Spares
        /// </summary>
        /// <param name="objAdvertSpares">AdvertSpares</param>
        /// <returns>AdvertSpares</returns>
        public static AdvertSpares AddAdvertSpares(AdvertSpares objAdvertSpares)
        {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prInsAdvertSpares");

            //Adding Input parameters            
            db.AddInParameter(dbCommand, "AdvertId", DbType.Int32, objAdvertSpares.AdvertId);
            db.AddInParameter(dbCommand, "ProductId", DbType.String, objAdvertSpares.ProductId);
            db.AddInParameter(dbCommand, "Supplier", DbType.String, objAdvertSpares.Supplier);

            //Adding Output parameters
            db.AddOutParameter(dbCommand, "RespCode", DbType.Int32, 100);
            db.AddOutParameter(dbCommand, "RespMsg", DbType.String, 500);


            try
            {
                // Execute
                db.ExecuteNonQuery(dbCommand);

                //Set Output for AddAdvertSpares
                objAdvertSpares.RespCode = Convert.ToInt32(db.GetParameterValue(dbCommand, "RespCode"));
                objAdvertSpares.RespDesc = db.GetParameterValue(dbCommand, "RespMsg").ToString();

            }
            catch (Exception ex)
            {
                objAdvertSpares.RespCode = 1;
                objAdvertSpares.RespDesc = ex.ToString();
            }
            return objAdvertSpares;
        }

        /// <summary>
        /// Update Advert Spares
        /// </summary>
        /// <param name="objAdvertSpares">AdvertSpares</param>
        /// <returns>AdvertSpares</returns>
        public static AdvertSpares UpdateAdvertSpares(AdvertSpares objAdvertSpares)
        {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prUpdAdvertSpares");

            //Adding Input parameters            
            db.AddInParameter(dbCommand, "AdvertId", DbType.Int32, objAdvertSpares.AdvertId);
            db.AddInParameter(dbCommand, "ProductId", DbType.String, objAdvertSpares.ProductId);
            db.AddInParameter(dbCommand, "Supplier", DbType.String, objAdvertSpares.Supplier);

            //Adding Output parameters
            db.AddOutParameter(dbCommand, "RespCode", DbType.Int32, 100);
            db.AddOutParameter(dbCommand, "RespMsg", DbType.String, 500);

            try
            {
                // Execute
                db.ExecuteNonQuery(dbCommand);

                //Set Output for UpdateAdvertSpares
                objAdvertSpares.RespCode = Convert.ToInt32(db.GetParameterValue(dbCommand, "RespCode"));
                objAdvertSpares.RespDesc = db.GetParameterValue(dbCommand, "RespMsg").ToString();

            }
            catch (Exception ex)
            {
                objAdvertSpares.RespCode = 1;
                objAdvertSpares.RespDesc = ex.ToString();
            }
            return objAdvertSpares;
        }

    }
}
