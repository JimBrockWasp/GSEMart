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
    public class LogOnTypeLayer
    {
         private static Database db = DatabaseFactory.CreateDatabase();


        public static LogOnType GetLogOnTypeById(int Id)
        {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelLogOnTypeById");
            //Adding Input parameters   
            db.AddInParameter(dbCommand, "Id", DbType.Int16, Id);

            LogOnType objLogOnType = new LogOnType();
            IDataReader dr = null;
            try
            {
                // Execute command 
                dr = db.ExecuteReader(dbCommand);

                //Set Output
                while (dr.Read())
                {
                    objLogOnType.Id = Convert.ToInt32(dr["Id"].ToString());
                    objLogOnType.Code = dr["Code"].ToString();
                    objLogOnType.Description = dr["Description"].ToString();
                }
            }
            catch (Exception ex)
            {
                objLogOnType.RespCode = 1;
                objLogOnType.RespDesc = ex.ToString();
            }
            finally
            {
                dr.Close();
            }
            return objLogOnType;
        }

        public static LogOnType GetLogOnTypeByCode(string Code)
        {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelLogOnTypeByCode");
            //Adding Input parameters   
            db.AddInParameter(dbCommand, "Code", DbType.AnsiString, Code);

            LogOnType objLogOnType = new LogOnType();
            IDataReader dr = null;
            try
            {
                // Execute command 
                dr = db.ExecuteReader(dbCommand);

                //Set Output
                while (dr.Read())
                {
                    objLogOnType.Id = Convert.ToInt32(dr["Id"].ToString());
                    objLogOnType.Code = dr["Code"].ToString();
                    objLogOnType.Description = dr["Description"].ToString();
                }
            }
            catch (Exception ex)
            {
                objLogOnType.RespCode = 1;
                objLogOnType.RespDesc = ex.ToString();
            }
            finally
            {
                dr.Close();
            }
            return objLogOnType;
        }
    }
}
