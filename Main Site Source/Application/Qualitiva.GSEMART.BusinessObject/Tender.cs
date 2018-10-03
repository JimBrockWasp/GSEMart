using System;
using System.Collections.Generic;
using System.Text;

namespace Qualitiva.GSEMART.BusinessObject
{
    public class Tender : ResponseInfo
    {
        public int TenderId { get; set; }
        public string CompanyName { get; set; }
        public string ContactName { get; set; }
        public string Subject { get; set; }
        public string Telephone { get; set; }
        public string Mobile { get; set; }
        public string EmailAddress { get; set; }
        public string Notes { get; set; }
        public DateTime ExpiryDate { get; set; }
        public DateTime CreateDate { get; set; }
        public string URL { get; set; }
        public string Country { get; set; }




    }
}
