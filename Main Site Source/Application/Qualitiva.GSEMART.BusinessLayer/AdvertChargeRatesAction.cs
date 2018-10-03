using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using Qualitiva.GSEMART.DataLayer;
using Qualitiva.GSEMART.BusinessObject;

namespace Qualitiva.GSEMART.BusinessLayer
{
    public class AdvertChargeRatesAction
    {
        public static List<AdvertChargeRates> GetAdvertChargeRates()
        {
            return AdvertChargeRatesLayer.GetAdvertChargeRates();
        }

        public static List<AdvertChargeRates> GetAdvertChargeRatesByCategoryId(string CurrencyId, string AdvertCategoryId)
        {
            return AdvertChargeRatesLayer.GetAdvertChargeRatesByCategoryId(CurrencyId, AdvertCategoryId);
        }

        public static AdvertChargeRates GetAdvertChargeRatesById(int ChargeRatesId)
        {
            return AdvertChargeRatesLayer.GetAdvertChargeRatesById(ChargeRatesId);
        }
    }
}
