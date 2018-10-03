using System;
using System.Collections.Generic;
using System.Text;

namespace Qualitiva.GSEMART.BusinessObject
{
    public class AccountConfirmationAudit:ResponseInfo
    {
        #region "Private Members"
        private int _Id;
        private string _EmailAddress;
        private string _ConfirmationCode;
        private bool _ConfirmedYN;
        #endregion

        #region "Public Properties"

        public int Id
        {
            get { return _Id; }
            set { _Id = value; }
        }

        public string EmailAddress
        {
            get { return _EmailAddress; }
            set { _EmailAddress = value; }
        }

        public string ConfirmationCode
        {
            get { return _ConfirmationCode; }
            set { _ConfirmationCode = value; }
        }

        public bool ConfirmedYN
        {
            get { return _ConfirmedYN; }
            set { _ConfirmedYN = value; }
        }


        #endregion
    }
}
