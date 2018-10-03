using System;
using System.Collections.Generic;
using System.Text;

namespace Qualitiva.GSEMART.BusinessObject
{
    [Serializable]
    public class GSEType : ResponseInfo
    {
        #region "Private Members"
        private string _GSETypeId;
        private string _description;
        #endregion

        #region "Public Properties"
        public string GSETypeId
        {
            get { return _GSETypeId; }
            set { _GSETypeId = value; }
        }

        public string Description
        {
            get { return _description; }
            set { _description = value; }
        }

       #endregion


    }
}
