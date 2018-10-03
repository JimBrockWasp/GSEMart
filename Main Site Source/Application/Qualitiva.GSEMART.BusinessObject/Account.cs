using System;
using System.Collections.Generic;
using System.Text;


namespace Qualitiva.GSEMART.BusinessObject
{
    public class Account : ResponseInfo
    {
        #region "Private Members"
        private int _AccountId;
        private string _EmailAddress;
        private string _FullName;
        private string _LastName;
        private string _CompanyName;
        private string _Address;
        private string _PostCode;
        private string _City;
        private State _State;
        private Country _Country;
        private string _Telephone;
        private string _Fax;
        private string _Mobile;
        private string _Password;
        private AccountStatus _AccountStatus;
        private string _SalesCode;
        private string _VATNumber;
        private VATNumberStatus _VATNumberStatus;
        private Int16 _Discount;
        private DateTime _CreatedDate;
        private DateTime _LastModifiedDate;
        private bool _agreedTCYN;
        private AccountType _accountType;
        private bool _TenderYN;
        private string _Profile;
        private string _CompanyWebsite;
        #endregion

        #region "Public Properties"

        public int AccountId
        {
            get { return _AccountId; }
            set { _AccountId = value; }
        }

        public string EmailAddress
        {
            get { return _EmailAddress; }
            set { _EmailAddress = value; }
        }
        public string FullName
        {
            get { return _FullName; }
            set { _FullName = value; }
        }
        public string LastName
        {
            get { return _LastName; }
            set { _LastName = value; }
        }
        public string CompanyName
        {
            get { return _CompanyName; }
            set { _CompanyName = value; }
        }
        public string Address
        {
            get { return _Address; }
            set { _Address = value; }
        }
        public string PostCode
        {
            get { return _PostCode; }
            set { _PostCode = value; }
        }
        public string City
        {
            get { return _City; }
            set { _City = value; }
        }
        public State State
        {
            get { return _State; }
            set { _State = value; }
        }
        public Country Country
        {
            get { return _Country; }
            set { _Country = value; }
        }
        public string Telephone
        {
            get { return _Telephone; }
            set { _Telephone = value; }
        }
        public string Fax
        {
            get { return _Fax; }
            set { _Fax = value; }
        }
        public string Mobile
        {
            get { return _Mobile; }
            set { _Mobile = value; }
        }
        public string Password
        {
            get { return _Password; }
            set { _Password = value; }
        }
        public AccountStatus AccountStatus
        {
            get { return _AccountStatus; }
            set { _AccountStatus = value; }
        }
        public string SalesCode
        {
            get { return _SalesCode; }
            set { _SalesCode = value; }
        }
        public string VATNumber
        {
            get { return _VATNumber; }
            set { _VATNumber = value; }
        }
        public VATNumberStatus VATNumberStatus
        {
            get { return _VATNumberStatus; }
            set { _VATNumberStatus = value; }
        }


        public Int16 Discount
        {
            get { return _Discount; }
            set { _Discount = value; }
        }

        public DateTime CreatedDate
        {
            get { return _CreatedDate; }
            set { _CreatedDate = value; }
        }

        public DateTime LastModifiedDate
        {
            get { return _LastModifiedDate; }
            set { _LastModifiedDate = value; }
        }

        public bool AgreedTCYN
        {
            get { return _agreedTCYN; }
            set { _agreedTCYN = value; }
        }

        public AccountType AccountType
        {
            get { return _accountType; }
            set { _accountType = value; }
        }

        public bool TenderYN
        {
            get { return _TenderYN; }
            set { _TenderYN = value; }

        }

        public string Profile
        {
            get { return _Profile; }
            set { _Profile = value; }
        }

        public string CompanyWebsite
        {
            get { return _CompanyWebsite; }
            set { _CompanyWebsite = value; }
        }
        #endregion

        #region "Public Methods"
        public Account()
        {
            _Country = new Country(); 
            _AccountStatus = new AccountStatus();            
            _VATNumberStatus = new VATNumberStatus();            
        }

        #endregion

    }
}
