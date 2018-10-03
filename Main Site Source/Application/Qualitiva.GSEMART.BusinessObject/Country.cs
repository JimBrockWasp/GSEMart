using System;
using System.Collections.Generic;
using System.Text;

namespace Qualitiva.GSEMART.BusinessObject
{
    public class Country : ResponseInfo
    {
        #region "Private Members"
        private string _CountryId;
        private string _CountryName;
        private bool _EUYN;
        private string _CurrencyId;
        private string _RegionId;
        private string _RegionDescription;


        #endregion

        #region "Public Properties"

        public string CountryId
        {
            get { return _CountryId; }
            set { _CountryId = value; }
        }

        public string CountryName
        {
            get { return _CountryName; }
            set { _CountryName = value; }
        }

        public bool EUYN
        {
            get { return _EUYN; }
            set { _EUYN = value; }
        }

        public string CurrencyId
        {
            get { return _CurrencyId; }
            set { _CurrencyId = value; }
        }

        public string RegionId
        {
            get { return _RegionId; }
            set { _RegionId = value; }
        }

        public string RegionDescription
        {
            get { return _RegionDescription; }
            set { _RegionDescription = value; }
        }

       
        #endregion
    }
}
