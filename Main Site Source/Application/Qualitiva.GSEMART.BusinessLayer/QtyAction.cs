using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using Qualitiva.GSEMART.DataLayer;
using Qualitiva.GSEMART.BusinessObject;

namespace Qualitiva.GSEMART.BusinessLayer
{
    public class QtyAction
    {
        public static List<Qty> getQtys(int GSETypeId)
        {
            return QtyLayer.GetQtys(GSETypeId);
        }


    }
}
