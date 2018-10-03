using System;
using System.Collections.Generic;
using System.Text;

namespace Qualitiva.GSEMART.BusinessObject
{
    public class AccountImage : ResponseInfo
    {
        #region "Private Members"
        private int _AccountId;
        private byte[] _Image;
        #endregion


        #region "Public Properties"

        public int AccountId
        {
            get { return _AccountId; }
            set { _AccountId = value; }
        }
        public byte[] Image
        {
            get { return _Image; }
            set { _Image = value; }
        }

        #endregion
    }
}
