using System;
using System.Collections.Generic;
using System.Text;
using Qualitiva.GSEMART.BusinessObject;
using Qualitiva.GSEMART.DataLayer;

namespace Qualitiva.GSEMART.BusinessLayer
{
    public class TenderAction
    {
        //public static List<Tender> GetAllTender()
        //{
        //    return TenderLayer.GetAllTender();
        //}

        public static Tender AddTender(Tender objTender){
            return TenderLayer.AddTender(objTender);
        }

    }
}
