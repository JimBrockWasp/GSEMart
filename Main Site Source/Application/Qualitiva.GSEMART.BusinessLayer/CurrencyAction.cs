using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using Qualitiva.GSEMART.DataLayer;
using Qualitiva.GSEMART.BusinessObject;

namespace Qualitiva.GSEMART.BusinessLayer
{
  public class CurrencyAction
    {
        /// <summary>
       /// Get all currency
       /// </summary>
       /// <returns></returns>
        public static List<Currency> GetCurrency()
        {
            return CurrencyLayer.GetCurrency();
        }

      public static Currency GetCurrencyById(string CurrencyId)
      {
          return CurrencyLayer.GetCurrencyById(CurrencyId);
      }
    }
}
