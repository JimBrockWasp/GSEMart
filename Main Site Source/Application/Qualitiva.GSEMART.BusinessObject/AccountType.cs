using System;
using System.Collections.Generic;
using System.Text;

namespace Qualitiva.GSEMART.BusinessObject
{
    public class AccountType : ResponseInfo
    {
        private int _accountTypeId;
        private string _accountTypeName;

        public int AccountTypeId {
            get { return _accountTypeId; }
            set { _accountTypeId = value; }
        }

        public string AccountTypeName
        {
            get { return _accountTypeName; }
            set { _accountTypeName = value; }
        }
    }
}

