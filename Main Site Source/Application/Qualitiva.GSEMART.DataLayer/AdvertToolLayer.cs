/**
 * Class for Advert Tool Layer
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
    public class AdvertToolLayer
    {
        private static Database db = DatabaseFactory.CreateDatabase();

        /// <summary>
        /// Add Advert Tool
        /// </summary>
        /// <param name="objAdvertTool">AdvertTool</param>
        /// <returns>AdvertTool</returns>
        public static AdvertTool AddAdvertTool(AdvertTool objAdvertTool)
        {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prInsAdvertTool");

            //Adding Input parameters            
            db.AddInParameter(dbCommand, "AdvertId", DbType.Int32, objAdvertTool.AdvertId);
            db.AddInParameter(dbCommand, "Manufacturer", DbType.String, objAdvertTool.Manufacturer);
            db.AddInParameter(dbCommand, "ProductId", DbType.String, objAdvertTool.ProductId);
            db.AddInParameter(dbCommand, "Supplier", DbType.String, objAdvertTool.Supplier);
            db.AddInParameter(dbCommand, "Year", DbType.String, objAdvertTool.Year);

            //Adding Output parameters
            db.AddOutParameter(dbCommand, "RespCode", DbType.Int32, 100);
            db.AddOutParameter(dbCommand, "RespMsg", DbType.String, 500);


            try
            {
                // Execute
                db.ExecuteNonQuery(dbCommand);

                //Set Output for AddAdvertTool
                objAdvertTool.RespCode = Convert.ToInt32(db.GetParameterValue(dbCommand, "RespCode"));
                objAdvertTool.RespDesc = db.GetParameterValue(dbCommand, "RespMsg").ToString();

            }
            catch (Exception ex)
            {
                objAdvertTool.RespCode = 1;
                objAdvertTool.RespDesc = ex.ToString();
            }
            return objAdvertTool;
        }

        /// <summary>
        /// Update Advert Tool
        /// </summary>
        /// <param name="objAdvertTool">AdvertTool</param>
        /// <returns>AdvertTool</returns>
        public static AdvertTool UpdateAdvertTool(AdvertTool objAdvertTool)
        {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prUpdAdvertTool");

            //Adding Input parameters            
            db.AddInParameter(dbCommand, "AdvertId", DbType.Int32, objAdvertTool.AdvertId);
            db.AddInParameter(dbCommand, "Manufacturer", DbType.String, objAdvertTool.Manufacturer);
            db.AddInParameter(dbCommand, "ProductId", DbType.String, objAdvertTool.ProductId);
            db.AddInParameter(dbCommand, "Supplier", DbType.String, objAdvertTool.Supplier);
            db.AddInParameter(dbCommand, "Year", DbType.String, objAdvertTool.Year);

            //Adding Output parameters
            db.AddOutParameter(dbCommand, "RespCode", DbType.Int32, 100);
            db.AddOutParameter(dbCommand, "RespMsg", DbType.String, 500);

            try
            {
                // Execute
                db.ExecuteNonQuery(dbCommand);

                //Set Output for UpdateAdvertTool
                objAdvertTool.RespCode = Convert.ToInt32(db.GetParameterValue(dbCommand, "RespCode"));
                objAdvertTool.RespDesc = db.GetParameterValue(dbCommand, "RespMsg").ToString();

            }
            catch (Exception ex)
            {
                objAdvertTool.RespCode = 1;
                objAdvertTool.RespDesc = ex.ToString();
            }
            return objAdvertTool;
        }

    }
}
