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
   public class AdvertGSELayer
    {
       private static Database db = DatabaseFactory.CreateDatabase();

       public static AdvertGSE AddAdvertGSE(AdvertGSE objAdvertGSE)
       {
           //Accessing DB Layer
           DbCommand dbCommand = db.GetStoredProcCommand("prInsAdvertGSE");

           //Adding Input parameters            
           db.AddInParameter(dbCommand, "AdvertId", DbType.Int32, objAdvertGSE.AdvertId);
           db.AddInParameter(dbCommand, "Manufacturer", DbType.String, objAdvertGSE.Manufacturer);
           db.AddInParameter(dbCommand, "DateofRegistration", DbType.DateTime, objAdvertGSE.DateofRegistration);
           db.AddInParameter(dbCommand, "Year", DbType.String, objAdvertGSE.Year);
           db.AddInParameter(dbCommand, "GSETypeId", DbType.Int32, objAdvertGSE.GSETypeId);
           db.AddInParameter(dbCommand, "AdvertAvailabilityId", DbType.String, objAdvertGSE.AvailabilityId);
           db.AddInParameter(dbCommand, "ForSaleYN", DbType.Boolean, objAdvertGSE.ForSaleYN);
           db.AddInParameter(dbCommand, "ForRentYN", DbType.Boolean, objAdvertGSE.ForRentYN);
           db.AddInParameter(dbCommand, "ForLeaseYN", DbType.Boolean, objAdvertGSE.ForLeaseYN);
           
           //Adding Output parameters
           db.AddOutParameter(dbCommand, "RespCode", DbType.Int32, 100);
           db.AddOutParameter(dbCommand, "RespMsg", DbType.String, 500);


           try
           {
               // Execute
               db.ExecuteNonQuery(dbCommand);
               //Set Output for AddAdvertImage
               objAdvertGSE.RespCode = Convert.ToInt32(db.GetParameterValue(dbCommand, "RespCode"));
               objAdvertGSE.RespDesc = db.GetParameterValue(dbCommand, "RespMsg").ToString();

               // Now Update the Specifications
               UpdateAdvertGSESpecifications(objAdvertGSE);

               // Now Update the Qtys
               UpdateAdvertGSEQtys(objAdvertGSE);


           }
           catch (Exception ex)
           {
               objAdvertGSE.RespCode = 1;
               objAdvertGSE.RespDesc = ex.ToString();
           }
           return objAdvertGSE;
       }

       public static AdvertGSE UpdateAdvertGSE(AdvertGSE objAdvertGSE) {
           //Accessing DB Layer
           DbCommand dbCommand = db.GetStoredProcCommand("prUpdAdvertGSE");

           //Adding Input parameters            
           db.AddInParameter(dbCommand, "AdvertId", DbType.Int32, objAdvertGSE.AdvertId);
           db.AddInParameter(dbCommand, "Manufacturer", DbType.String, objAdvertGSE.Manufacturer);
           db.AddInParameter(dbCommand, "DateofRegistration", DbType.DateTime, objAdvertGSE.DateofRegistration);
           db.AddInParameter(dbCommand, "Year", DbType.String, objAdvertGSE.Year);
           db.AddInParameter(dbCommand, "GSETypeId", DbType.Int32, objAdvertGSE.GSETypeId);
           db.AddInParameter(dbCommand, "AdvertAvailabilityId", DbType.String, objAdvertGSE.AvailabilityId);
           db.AddInParameter(dbCommand, "ForSaleYN", DbType.Boolean, objAdvertGSE.ForSaleYN);
           db.AddInParameter(dbCommand, "ForRentYN", DbType.Boolean, objAdvertGSE.ForRentYN);
           db.AddInParameter(dbCommand, "ForLeaseYN", DbType.Boolean, objAdvertGSE.ForLeaseYN);

           //Adding Output parameters
           db.AddOutParameter(dbCommand, "RespCode", DbType.Int32, 100);
           db.AddOutParameter(dbCommand, "RespMsg", DbType.String, 500);


           try
           {
               // Execute
               db.ExecuteNonQuery(dbCommand);
               //Set Output for AddAdvertImage
               objAdvertGSE.RespCode = Convert.ToInt32(db.GetParameterValue(dbCommand, "RespCode"));
               objAdvertGSE.RespDesc = db.GetParameterValue(dbCommand, "RespMsg").ToString();

               // Now Update the Specifications
               UpdateAdvertGSESpecifications(objAdvertGSE);

               // Now Update the Qtys
               UpdateAdvertGSEQtys(objAdvertGSE);
           }
           catch (Exception ex)
           {
               objAdvertGSE.RespCode = 1;
               objAdvertGSE.RespDesc = ex.ToString();
           }




           return objAdvertGSE;
       }

       public static void UpdateAdvertGSESpecifications(AdvertGSE objAdvertGSE)
       {
           //Accessing DB Layer
           DbCommand dbCommand = db.GetStoredProcCommand("prUpdAdvertGSESpecifications");

           //Adding Input parameters            
           db.AddInParameter(dbCommand, "AdvertId", DbType.Int32, objAdvertGSE.AdvertId);
           db.AddInParameter(dbCommand, "SpecId1", DbType.String, objAdvertGSE.SpecId1);
           db.AddInParameter(dbCommand, "SpecId2", DbType.String, objAdvertGSE.SpecId2);
           db.AddInParameter(dbCommand, "SpecId3", DbType.String, objAdvertGSE.SpecId3);
           db.AddInParameter(dbCommand, "SpecOptionId1", DbType.String, objAdvertGSE.SpecOptionId1);
           db.AddInParameter(dbCommand, "SpecOptionId2", DbType.String, objAdvertGSE.SpecOptionId2);
           db.AddInParameter(dbCommand, "SpecOptionId3", DbType.String, objAdvertGSE.SpecOptionId3);

           //Adding Output parameters
           db.AddOutParameter(dbCommand, "RespCode", DbType.Int32, 100);
           db.AddOutParameter(dbCommand, "RespMsg", DbType.String, 500);


           try
           {
               // Execute
               db.ExecuteNonQuery(dbCommand);

               //Set Output for AddAdvertImage
               objAdvertGSE.RespCode = Convert.ToInt32(db.GetParameterValue(dbCommand, "RespCode"));
               objAdvertGSE.RespDesc = db.GetParameterValue(dbCommand, "RespMsg").ToString();
           }
           catch (Exception ex)
           {
               objAdvertGSE.RespCode = 1;
               objAdvertGSE.RespDesc = ex.ToString();
           }

           return;
       }
       public static void UpdateAdvertGSEQtys(AdvertGSE objAdvertGSE)
       {
           //Accessing DB Layer
           DbCommand dbCommand = db.GetStoredProcCommand("prUpdAdvertGSEQtys");

           //Adding Input parameters            
           db.AddInParameter(dbCommand, "AdvertId", DbType.Int32, objAdvertGSE.AdvertId);
           db.AddInParameter(dbCommand, "QtyId1", DbType.String, objAdvertGSE.QtyId1);
           db.AddInParameter(dbCommand, "MetricValue1", DbType.Single, objAdvertGSE.QtyValue1);
           db.AddInParameter(dbCommand, "QtyId2", DbType.String, objAdvertGSE.QtyId2);
           db.AddInParameter(dbCommand, "MetricValue2", DbType.Single, objAdvertGSE.QtyValue2);

           //Adding Output parameters
           db.AddOutParameter(dbCommand, "RespCode", DbType.Int32, 100);
           db.AddOutParameter(dbCommand, "RespMsg", DbType.String, 500);


           try
           {
               // Execute
               db.ExecuteNonQuery(dbCommand);

               //Set Output for AddAdvertImage
               objAdvertGSE.RespCode = Convert.ToInt32(db.GetParameterValue(dbCommand, "RespCode"));
               objAdvertGSE.RespDesc = db.GetParameterValue(dbCommand, "RespMsg").ToString();
           }
           catch (Exception ex)
           {
               objAdvertGSE.RespCode = 1;
               objAdvertGSE.RespDesc = ex.ToString();
           }

           return;
       }
    }
}
