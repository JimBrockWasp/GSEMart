using System;
using System.Collections.Generic;
using System.Text;

namespace Qualitiva.GSEMART.BusinessObject
{
    public class SpecOption
    {

        #region "Private Members"

        private string _SpecId;
        private string _SpecOptionId;
        private string _Description;

        #endregion

        #region "Public Members"

        public string SpecId
        {
            get { return _SpecId; }
            set { _SpecId = value; }
        }

        public string SpecOptionId
        {
            get { return _SpecOptionId; }
            set { _SpecOptionId = value; }
        }

        public string Description
        {
            get { return _Description; }
            set { _Description = value; }
        }

        #endregion
    }
}
