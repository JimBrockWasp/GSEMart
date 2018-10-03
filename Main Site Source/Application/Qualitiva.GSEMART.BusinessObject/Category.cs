using System;
using System.Collections.Generic;
using System.Text;

namespace Qualitiva.GSEMART.BusinessObject
{
    public class Category : ResponseInfo
    {
        #region "Private Members"
        private string _CategoryId;
        private string _Description;
        #endregion

        #region "Public Properties"

        public string CategoryId
        {
            get { return _CategoryId; }
            set { _CategoryId = value; }
        }

        public string Description
        {
            get { return _Description; }
            set { _Description = value; }
        }

        #endregion
    }
}
