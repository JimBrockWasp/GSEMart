using System;
using System.Collections.Generic;
using System.Text;

namespace Qualitiva.GSEMART.BusinessObject
{
    [Serializable]
    public class Currency : ResponseInfo
    {
        #region "Private Members"
        private string _currencyId;
        private string _description;
        private decimal _currencyValue;
        private string _decimalUnicode;
        private string _symbol;
        private bool _allowPaymentYN;
        #endregion

        #region "Public Properties"
        public string CurrencyId
        {
            get { return _currencyId; }
            set { _currencyId = value; }
        }

        public string Description
        {
            get { return _description; }
            set { _description = value; }
        }

        public decimal CurrencyValue
        {
            get { return _currencyValue; }
            set { _currencyValue = value; }
        }

        public string DecimalUnicode
        {
            get { return _decimalUnicode; }
            set { _decimalUnicode = value; }
        }
        
        [System.Xml.Serialization.XmlIgnore]
        public string Symbol
        {
            get { return GenerateSymbol(_decimalUnicode); }
            set { _symbol = value; }
        }

        public bool AllowPaymentYN
        {
            get { return _allowPaymentYN; }
            set { _allowPaymentYN = value; }
        }

        #endregion

        #region "Private Method"
        
        private string GenerateSymbol(string decimalUnicode)
        {
            if (decimalUnicode == "")
                return _currencyId;

            string[] codes = decimalUnicode.Split(',');
            StringBuilder sb = new StringBuilder();
            foreach (string code in codes)
            {
                sb.Append("&#" + code + ";");
            }

            return sb.ToString();
        }

        #endregion

    }
}
