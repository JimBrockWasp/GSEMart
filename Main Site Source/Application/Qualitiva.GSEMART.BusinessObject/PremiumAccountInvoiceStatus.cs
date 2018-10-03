using System;
using System.Collections.Generic;
using System.Text;

namespace Qualitiva.GSEMART.BusinessObject
{
    public class PremiumAccountInvoiceStatus : ResponseInfo
    {

        public int PremiumAccountInvoiceStatusId { get; set; }
        public string PremiumAccountInvoiceStatusDesc { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime LastUpdate { get; set; }
    }
}
