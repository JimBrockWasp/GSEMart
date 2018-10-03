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
    public class DocumentIndexLayer
    {
        private static Database db = DatabaseFactory.CreateDatabase();


        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public static void InsertIndex(
                int ObjectId,
                int DataNodeId,
                string DocumentType,
                string DocumentTitle,
                string IndexFileName
            )
        {

            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("DLInsertIndex");
  
            db.AddInParameter(dbCommand,"ObjectId", DbType.Int32, ObjectId);
            db.AddInParameter(dbCommand,"DocumentType",DbType.String, DocumentType);
            db.AddInParameter(dbCommand, "Title", DbType.String, DocumentTitle);
            db.AddInParameter(dbCommand, "DataNodeId", DbType.Int32, DataNodeId);
            db.AddInParameter(dbCommand, "FileName", DbType.String, IndexFileName);

            db.ExecuteNonQuery(dbCommand);
            
        }
    }

}

