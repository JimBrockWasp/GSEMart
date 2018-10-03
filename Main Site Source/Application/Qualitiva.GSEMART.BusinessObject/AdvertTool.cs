using System;
using System.Collections.Generic;
using System.Text;

namespace Qualitiva.GSEMART.BusinessObject
{
   public class AdvertTool : ResponseInfo
    {
        #region "Private Members"
        private int _advertId;
        private string _manufacturer;
        private string _productId;
        private string _supplier;
        private string _year;
        #endregion

        #region "Public Properties"
        public int AdvertId
        {
            get { return _advertId; }
            set { _advertId = value; }
        }

        public string Manufacturer
        {
            get { return _manufacturer; }
            set { _manufacturer = value; }
        }

        public string ProductId
        {
            get { return _productId; }
            set { _productId = value; }
        }

        public string Supplier
        {
            get { return _supplier; }
            set { _supplier = value; }
        }

        public string Year
        {
            get { return _year; }
            set { _year = value; }
        }
        #endregion
    }
}
