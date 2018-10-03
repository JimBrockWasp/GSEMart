/**
 * This is Account Layer
 * Responsible to handle all account related methods to connect to database
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
    public class DataNodeLayer
    {
        private static Database db = DatabaseFactory.CreateDatabase();


        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public static DataNode GetDataNode()
        {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("DLGetNode");


            DataNode objDataNode = new DataNode();
            IDataReader dr = null;
            try
            {
                // Execute command 
                dr = db.ExecuteReader(dbCommand);

                //Set Output
                while (dr.Read())
                {

                    objDataNode.DataNodeId = Convert.ToInt32(dr["DataNodeID"].ToString());
                    objDataNode.PhysicalPath = dr["PhysicalPath"].ToString();

                }

            }
            catch (Exception ex)
            {
                objDataNode.RespCode = 1;
                objDataNode.RespDesc = ex.ToString();
            }
            finally
            {
                dr.Close();
            }
            return objDataNode;

        }
    }

}

