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
    public class QtyLayer
    {
        private static Database db = DatabaseFactory.CreateDatabase();

        public static List<Qty> GetQtys(int GSETypeId)
        {
            List<Qty> lstQty = new List<Qty>();

            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelQtysByGSETypeId");
            db.AddInParameter(dbCommand, "GSETypeID", DbType.String, GSETypeId);

            IDataReader dr = null;

            try
            {
                // Execute command
                dr = db.ExecuteReader(dbCommand);

                //Set Output  and add to the list 
                while (dr.Read())
                {
                    Qty objQty = new Qty();
                    objQty.QtyId = dr["QuantityId"].ToString();
                    objQty.Description = dr["Description"].ToString();
                    objQty.GSETypeId = Convert.ToInt32(dr["GSETypeId"]);
                    objQty.MetricUnitDescription = dr["MetricUnitDescription"].ToString();

                    if (!String.IsNullOrEmpty(dr["ImperialUnitDescription"].ToString())){
                        objQty.ImperialUnitDescription = dr["ImperialUnitDescription"].ToString();
                        objQty.MetricConversionRatio = Convert.ToSingle(dr["MetricConversionRatio"]);
                    }

                    lstQty.Add(objQty);
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
            return lstQty;

        }
    }
}
