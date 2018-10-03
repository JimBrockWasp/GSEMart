using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Data;
using System.Data.Common;
using System.Configuration;
using System.Transactions;
using Qualitiva.GSEMART.BusinessObject;

namespace Qualitiva.GSEMART.DataLayer
{
    public class NodeLayer
    {

        private static Database db = DatabaseFactory.CreateDatabase("GSEMART_DOCINDEX");
        private static TimeSpan _sqlExecutionTime;
        private static TimeSpan _scriptExecutionTime;

        public static TimeSpan SqlExecutionTime
        {
            get { return _sqlExecutionTime; }
            set { _sqlExecutionTime = value; }
        }

        public static TimeSpan ScriptExecutionTime
        {
            get { return _scriptExecutionTime; }
            set { _scriptExecutionTime = value; }
        }


        /// <summary>
        /// Get a data node to store the document to
        /// </summary>
        /// <returns></returns>
        public static Node GetNode()
        {

            bool nodeFoundYN = false;
            Node documentNode = new Node();
            
            try
            {

                DbCommand dbCommand = db.GetStoredProcCommand("DLGetDocumentsByPASIdentifier");
                IDataReader dr = null;

                // Execute command
                dr = dbCommand.ExecuteReader();

                //Set Output
                while (dr.Read())
                {

                    documentNode.dataNodeId = Convert.ToInt32(dr["DataNodeId"]);
                    documentNode.physicalPath= dr["physicalPath"].ToString();
                    nodeFoundYN = true;
                }

                // Close the reader
                dr.Close();

            }
            catch (Exception ex)
            {
                throw ex;
            }

            if (nodeFoundYN == false)
            {
                throw new Exception("Node Not Found");
            }

            // Return the data node
            return documentNode;


        }


    }
}
