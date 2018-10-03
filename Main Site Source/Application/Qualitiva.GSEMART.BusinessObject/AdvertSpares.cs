using System;
using System.Collections.Generic;
using System.Text;

namespace Qualitiva.GSEMART.BusinessObject
{
   public class AdvertSpares : ResponseInfo
    {
        #region "Private Members"
        private int _advertId;
        private string _productId;
        private string _supplier;
        #endregion

        #region "Public Properties"
        public int AdvertId
        {
            get { return _advertId; }
            set { _advertId = value; }
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
        #endregion
    }
}
