using System;
using System.Collections.Generic;
using System.Text;

namespace Qualitiva.GSEMART.BusinessObject
{
    public class AdvertTransaction : ResponseInfo
    {
        public int AdvertTransactionId { get; set; }
        public string VendorTransactionCode { get; set; }
        public int AdvertId { get; set; }
        public int AccountId { get; set; }
        public AdvertChargeRates AdvertChargeRates { get; set; }
        public string CreditCardNumber { get; set; }
        public string Description { get; set; }
        public Currency Currency { get; set; }
        public decimal AmountSubmit { get; set; }
        public decimal AmountPaid { get; set; }
        public string CustomerEmailAddress { get; set; }
        public string CustomerName { get; set; }
        public int StatusCode { get; set; }
        public string TransactionCode { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime LastUpdate { get; set; }
    }
}
