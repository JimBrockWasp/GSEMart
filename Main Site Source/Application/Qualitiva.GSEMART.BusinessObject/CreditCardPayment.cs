/**
 * This is Credit Card Payment Class
 * Field which required to submit to payment gateway for credit card transaction
 */
using System;
using System.Collections.Generic;
using System.Text;

namespace Qualitiva.GSEMART.BusinessObject
{
    public class CreditCardPayment
    {
        public string VendorTxCode { get; set; }
        public string ReferrerID { get; set; }
        public decimal Amount { get; set; }
        public string Currency { get; set; }
        public string Description { get; set; }
        public string SuccessURL { get; set; }
        public string FailureURL { get; set; }
        public string CustomerName { get; set; }
        public string CustomerEMail { get; set; }
        public string VendorEMail { get; set; }
        public bool SendEMail { get; set; }
        public string EMailMessage { get; set; }
        public string BillingSurname { get; set; }
        public string BillingFirstNames { get; set; }
        public string BillingAddress1 { get; set; }
        public string BillingCity { get; set; }
        public string BillingPostCode { get; set; }
        public string BillingState { get; set; }
        public string BillingCountry { get; set; }
        public string BillingPhone { get; set; }
        public bool DeliverySameAsBilling { get; set; }
        public string DeliverySurname { get; set; }
        public string DeliveryFirstNames { get; set; }
        public string DeliveryAddress1 { get; set; }
        public string DeliveryCity { get; set; }
        public string DeliveryPostCode { get; set; }
        public string DeliveryState { get; set; }
        public string DeliveryCountry { get; set; }
        public string DeliveryPhone { get; set; }
        public bool AllowGiftAid { get; set; }
        public bool ApplyAVSCV2 { get; set; }
        public bool Apply3DSecure { get; set; }

        /// <summary>
        /// Function to generate credit card unecrypted data
        /// </summary>
        /// <returns></returns>
        public string GenerateCreditCardPaymentData() {
            string strData = String.Empty;
            string strBasket = String.Empty;

            strData = "VendorTxCode=" + VendorTxCode;
            strData = strData + "&ReferrerID=" + ReferrerID;
            strData = strData + "&Amount=" + Math.Round(Amount, 2).ToString();
            strData = strData + "&Currency=" + Currency;
            strData = strData + "&Description=" + Description;
            strData = strData + "&SuccessURL=" + SuccessURL;
            strData = strData + "&FailureURL=" + FailureURL;
            strData = strData + "&CustomerName=" + CustomerName;
            strData = strData + "&CustomerEMail=" + CustomerEMail;
            strData = strData + "&VendorEMail=" + VendorEMail;
            
            if (SendEMail == true)
                strData = strData + "&SendEMail=1";
            else
                strData = strData + "&SendEMail=0";
            
            strData = strData + "&eMailMessage=" + EMailMessage;
            strData = strData + "&BillingSurname=" + BillingSurname;
            strData = strData + "&BillingFirstnames=" + BillingFirstNames;
            strData = strData + "&BillingAddress1=" + BillingAddress1;
            strData = strData + "&BillingCity=" + BillingCity;
            strData = strData + "&BillingPostCode=" + BillingPostCode;
            strData = strData + "&BillingState=" + BillingState;
            strData = strData + "&BillingCountry=" + BillingCountry;
            strData = strData + "&BillingPhone=" + BillingPhone;

            if (DeliverySameAsBilling == true)
            {
                strData = strData + "&DeliverySurname=" + BillingSurname;
                strData = strData + "&DeliveryFirstnames=" + BillingFirstNames;
                strData = strData + "&DeliveryAddress1=" + BillingAddress1;
                strData = strData + "&DeliveryCity=" + BillingCity;
                strData = strData + "&DeliveryPostCode=" + BillingPostCode;
                strData = strData + "&DeliveryState=" + BillingState;
                strData = strData + "&DeliveryCountry=" + BillingCountry;
                strData = strData + "&DeliveryPhone=" + BillingPhone;
            }
            else {
                strData = strData + "&DeliverySurname=" + DeliverySurname;
                strData = strData + "&DeliveryFirstnames=" + DeliveryFirstNames;
                strData = strData + "&DeliveryAddress1=" + DeliveryAddress1;
                strData = strData + "&DeliveryCity=" + DeliveryCity;
                strData = strData + "&DeliveryPostCode=" + DeliveryPostCode;
                strData = strData + "&DeliveryState=" + DeliveryState;
                strData = strData + "&DeliveryCountry=" + DeliveryCountry;
                strData = strData + "&DeliveryPhone=" + DeliveryPhone;
            }

            strBasket = "1:" + Description + ":1:" + Math.Round(Amount, 2).ToString() + "::" + Math.Round(Amount, 2).ToString() + ":" + Math.Round(Amount, 2).ToString();
            strData = strData + "&Basket=" + strBasket;
            
            if (AllowGiftAid == true)
                strData = strData + "&AllowGiftAid=1";
            else
                strData = strData + "&AllowGiftAid=0";

            if (ApplyAVSCV2 == true)
                strData = strData + "&ApplyAVSCV2=1";
            else
                strData = strData + "&ApplyAVSCV2=0";

            if (Apply3DSecure == true)
                strData = strData + "&Apply3DSecure=1";
            else
                strData = strData + "&Apply3DSecure=0";

            return strData;
        }
    }
}
