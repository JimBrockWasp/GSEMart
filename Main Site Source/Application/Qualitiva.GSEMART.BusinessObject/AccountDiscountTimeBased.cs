using System;
using System.Collections.Generic;
using System.Text;

namespace Qualitiva.GSEMART.BusinessObject
{
    public class AccountDiscountTimeBased : ResponseInfo
    {

        private int _accountDiscountTimeBasedId;
        private int _accountId;
        private DateTime _fromDate;
        private DateTime _toDate;
        private int _discountRate;
        private DateTime _lastUpdate;
        private DateTime _createDate;


        public int AccountDiscountTimeBasedId {
            get { return _accountDiscountTimeBasedId;  }
            set { _accountDiscountTimeBasedId = value; }
        }

        public int AccountId
        {
            get { return _accountId; }
            set { _accountId = value; }
        }

        public DateTime FromDate
        {
            get { return _fromDate; }
            set { _fromDate = value; }
        }

        public DateTime ToDate
        {
            get { return _toDate; }
            set { _toDate = value; }
        }

        public int DiscountRate
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
