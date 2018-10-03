using System;
using System.Collections.Generic;
using System.Text;

namespace Qualitiva.GSEMART.BusinessObject
{
    public class AdvertInvoice: ResponseInfo
    {
        public int AdvertInvoiceId { get; set; }
        public int AdvertId { get; set; }
        public int AccountId { get; set; }
        public Currency Currency { get; set; }
        public decimal Net { get; set; }
        public decimal Vat { get; set; }
        public decimal Amount { get; set; }
        public string Description { get; set; }
        public AdvertTransaction AdvertTransaction { get; set; }
        public InvoiceStatusCode InvoiceStatusCode { get; set; }
        public PremiumAccountInvoiceStatus PremiumAccountInvoiceStatus { get; set; }
        public int MonthCount { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime LastUpdate { get; set; }
    }
}
