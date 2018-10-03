using System;
using System.Collections.Generic;
using System.Text;
using Qualitiva.GSEMART.DataLayer;
using Qualitiva.GSEMART.BusinessObject;

namespace Qualitiva.GSEMART.BusinessLayer
{
    public class DiscountAction
    {
        public static List<AccountDiscountTimeBased> SetAccountDiscountTimeBased(int AccountId, List<AccountDiscountTimeBased> lstAccountDiscountTimeBased)
        {
            return DiscountLayer.SetAccountDiscountTimeBased(AccountId, lstAccountDiscountTimeBased);
        }

        public static List<AccountDiscountTimeBased> GetAccountDiscountTimeBasedByAccountId(int AccountId) {
            return DiscountLayer.GetAccountDiscountTimeBasedByAccountId(AccountId);
        }

        public static List<DiscountRate> GetDiscountRate() {
            return DiscountLayer.GetDiscountRate();
        }

        public static List<DiscountRate> SetDiscountRate(List<DiscountRate> lstDiscountRate)
        {
            return DiscountLayer.SetDiscountRate(lstDiscountRate);
        }

        public static int GetDiscountRateByDiscountRateId(int DiscountRateId)
        {
            return DiscountLayer.GetDiscountRateByDiscountRateId(DiscountRateId);
        }
    }
}
