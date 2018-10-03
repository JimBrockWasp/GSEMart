using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using Qualitiva.GSEMART.DataLayer;
using Qualitiva.GSEMART.BusinessObject;

namespace Qualitiva.GSEMART.BusinessLayer
{
    public class DataNodeAction
    {
        public static DataNode GetDataNode()
        {
            return DataNodeLayer.GetDataNode();
        }

    }
}
