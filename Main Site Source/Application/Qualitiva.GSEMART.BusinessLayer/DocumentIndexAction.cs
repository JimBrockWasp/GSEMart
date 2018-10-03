using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using Qualitiva.GSEMART.DataLayer;
using Qualitiva.GSEMART.BusinessObject;

namespace Qualitiva.GSEMART.BusinessLayer
{
    public class DocumentIndexAction
    {
        public static void InsertIndex(
                int ObjectId,
                int DataNodeId,
                string DocumentType,
                string DocumentTitle,
                string IndexFileName
            
            )
        {
            DocumentIndexLayer.InsertIndex(
                ObjectId,
                DataNodeId,
                DocumentType,
                DocumentTitle,
                IndexFileName);
        }

    }
}
