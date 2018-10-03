using System;
using System.Collections.Generic;
using System.Text;

namespace Qualitiva.GSEMART.BusinessObject
{
    public class InvoiceStatusCode : ResponseInfo
    {
        public int InvoiceStatusId { get; set; }
        public string InvoiceStatusDesc { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime LastUpdate { get; set; }
    }
}
