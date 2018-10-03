using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using Qualitiva.GSEMART.DataLayer;
using Qualitiva.GSEMART.BusinessObject;

namespace Qualitiva.GSEMART.BusinessLayer
{
  public class GSETypeAction
    {
        /// <summary>
       /// Get all currency
       /// </summary>
       /// <returns></returns>
        public static List<GSEType> GetGSEType()
        {
            return GSETypeLayer.GetGSEType();
        }

      public static GSEType GetCurrencyById(string GSETypeId)
      {
          return GSETypeLayer.GetGSETypeById(GSETypeId);
      }
    }
}
