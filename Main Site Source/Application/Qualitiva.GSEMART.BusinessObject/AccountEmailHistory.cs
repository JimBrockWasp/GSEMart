using System;
using System.Collections.Generic;
using System.Text;

namespace Qualitiva.GSEMART.BusinessObject
{
    public class AccountEmailHistory : ResponseInfo
    {
        #region "Private Members"
        private int _AccountId;
        private DateTime _DateSent;
        private string _EmailAddress;
        private string _Subject;
        private string _Message;
        #endregion


        #region "Public Properties"

        public int AccountId
        {
            get { return _AccountId; }
            set { _AccountId = value; }
        }

        public DateTime DateSent
        {
            get { return _DateSent; }
            set { _DateSent = value; }
        }


        public string EmailAddress
        {
            get { return _EmailAddress; }
            set { _EmailAddress = value; }
        }
        public string Subject
        {
            get { return _Subject; }
            set { _Subject = value; }
        }
        public string Message
        {
            get { return _Message; }
            set { _Message = value; }
        }

        #endregion
    }
}
