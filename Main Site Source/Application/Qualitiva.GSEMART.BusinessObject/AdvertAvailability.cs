using System;
using System.Collections.Generic;
using System.Text;

namespace Qualitiva.GSEMART.BusinessObject
{
    [Serializable]
    public class AdvertAvailability : ResponseInfo
    {
        #region "Private Members"
        private string _AdvertAvailabilityId;
        private string _description;
        #endregion

        #region "Public Properties"
        public string AdvertAvailabilityId
        {
            get { return _AdvertAvailabilityId; }
            set { _AdvertAvailabilityId = value; }
        }

        public string Description
        {
            get { return _description; }
            set { _description = value; }
        }

       #endregion


    }
}
