using System;
using System.Collections.Generic;
using System.Text;

namespace Qualitiva.GSEMART.BusinessObject
{
    public class AdvertChargeRates : ResponseInfo
    {
        #region "Private Members"
        private int _chargeRateId;
        private string _description;
        private int _monthCount;
        private string _categoryId;
        private string _currencyId;
        private decimal _rate;
        private bool _freeYN;
        private bool _untilYouBuyYN;
        #endregion

        #region "Public Properties"
        public int ChargeRateId
        {
            get { return _chargeRateId; }
            set { _chargeRateId = value; }
        }

        public string Description
        {
            get { return _description; }
            set { _description = value; }
        }

        public int MonthCount
        {
            get { return _monthCount; }
            set { _monthCount = value; }
        }

        public string CategoryId
        {
            get { return _categoryId; }
            set { _categoryId = value; }
        }

        public string CurrencyId
        {
            get { return _currencyId; }
            set { _currencyId = value; }
        }

        public decimal Rate
        {
            get { return _rate; }
            set { _rate = value; }
        }

        public bool FreeYN
        {
            get { return _freeYN; }
            set { _freeYN = value; }
        }

        public bool UntilYouBuyYN
        {
            get { return _untilYouBuyYN; }
            set { _untilYouBuyYN = value; }
        }
        #endregion
    }
}
