using System;
using System.Collections.Generic;
using System.Text;

namespace Qualitiva.GSEMART.BusinessObject
{
    public class AdvertFeature : ResponseInfo
    {
        #region "Private Members"
        private int _AdvertId;
        private string _Description;
        private string _Value;
        #endregion


        #region "Public Properties"

        // Default constructor
        public AdvertFeature() { }

        public AdvertFeature(int AdvertId, string Description, string Value)
        {
            _AdvertId = AdvertId;
            _Description = Description;
            _Value = Value;
        }


        public int AdvertId
        {
            get { return _AdvertId; }
            set { _AdvertId = value; }
        }

        public string Description
        {
            get { return _Description; }
            set { _Description = value; }
        }
        public string Value
        {
            get { return _Value; }
            set { _Value = value; }
        }

        #endregion
    }
}
