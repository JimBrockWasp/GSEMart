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
   public class GSETypeLayer
    {
        private static Database db = DatabaseFactory.CreateDatabase();
       /// <summary>
       /// Get all GSEType
       /// </summary>
       /// <returns></returns>
        public static List<GSEType> GetGSEType()
        {
            List<GSEType> lstGSEType = new List<GSEType>();
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelGSEType");
            IDataReader dr = null;
            try
            {
                // Execute command
                dr = db.ExecuteReader(dbCommand);

                //Set Output  and add to the list 
                while (dr.Read())
                {
                    GSEType objGSEType = new GSEType();
                    SetReaderInfo(dr, objGSEType);
                    lstGSEType.Add(objGSEType);
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
            return lstGSEType;
        }


       public static GSEType GetGSETypeById(string GSETypeId)
       {
           //Accessing DB Layer
           DbCommand dbCommand = db.GetStoredProcCommand("prSelGSETypeById");
           //Adding Input parameters   
           db.AddInParameter(dbCommand, "GSETypeID", DbType.String, GSETypeId);

           GSEType objGSEType = new GSEType();
           IDataReader dr = null;
           try
           {
               // Execute command 
               dr = db.ExecuteReader(dbCommand);

               //Set Output
               while (dr.Read())
               {
                   SetReaderInfo(dr, objGSEType);
               }
           }
           catch (Exception ex)
           {
               objGSEType.RespCode = 1;
               objGSEType.RespDesc = ex.ToString();
           }
           finally
           {
               dr.Close();
           }
           return objGSEType;

       }

       private static void SetReaderInfo(IDataReader dr, GSEType objGSEType)
       {
           objGSEType.GSETypeId = dr["GSETypeID"].ToString();
           objGSEType.Description = dr["Description"].ToString();
       }
    }
}
