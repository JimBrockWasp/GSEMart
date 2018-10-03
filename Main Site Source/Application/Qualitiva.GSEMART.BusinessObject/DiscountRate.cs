using System;
using System.Collections.Generic;
using System.Text;

namespace Qualitiva.GSEMART.BusinessObject
{
    public class DiscountRate : ResponseInfo
    {
        private int _discountRateId;
        private int _discountRate;
        private DateTime _lastUpdate;
        private DateTime _createDate;

        public int DiscountRateId{
            get { return _discountRateId; }
            set { _discountRateId = value; }
        }

        public int DiscountRateValue
        {
            get { return _discountRate; }
            set { _discountRate = value; }
        }

        public DateTime LastUpdate
        {
            get { return _lastUpdate; }
            set { _lastUpdate = value; }
        }

        public DateTime CreateDate
        {
            get { return _createDate; }
            set { _createDate = value; }
        }
    }
}
