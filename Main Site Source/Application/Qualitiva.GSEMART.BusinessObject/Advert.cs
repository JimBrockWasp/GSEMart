using System;
using System.Collections.Generic;
using System.Text;

namespace Qualitiva.GSEMART.BusinessObject
{
    public class Advert : ResponseInfo, IComparable<Advert>
    {
        #region "Private Members"
        private int _AdvertId;
        private int _AccountId;
        private string _Title;
        private string _ShortDescription;
        private string _LongDescription;
        private Category _Category;
        private AdvertStatus _AdvertStatus;
        private Country _Country;
        
        private string _Location;
        private bool _showPriceYN;
        private Currency _Currency;
        private decimal _price;
        private decimal _priceInEuro;
        private int _quantity;
        private int _age;
        private string _ContactName;
        private string _Telephone;
        private string _Fax;
        private string _Mobile;
        private string _URL;
        private string _EmailAddress;
        private string _Address;
        private DateTime _ExpiryDate;
        private DateTime _CreatedDate;
        private DateTime _LastModifiedDate;
        private List<AdvertImage> _AdvertImage;
        private List<AdvertDocument> _AdvertDocuments;
        private bool _ASAMemberYN;
        private bool _NewYN;

        private AdvertGSE _AdvertGSE;
        private AdvertSpares _AdvertSpares;
        private AdvertTool _AdvertTool;
        private bool _agreedTCYN;
        private string _owner;
        private string _fullText;
        private int _counter;
        private int _userAccountTypeId;
        private string _GUID;
     
        private AdvertTransaction _advertTransaction;

        #endregion


        #region "Public Properties"

        public int AdvertId
        {
            get { return _AdvertId; }
            set { _AdvertId = value; }
        }

        public int AccountId
        {
            get { return _AccountId; }
            set { _AccountId = value; }
        }

        public bool ASAMemberYN
        {
            get { return _ASAMemberYN; }
            set { _ASAMemberYN = value; }
        }

        public bool NewYN
        {
            get { return _NewYN; }
            set { _NewYN = value; }
        }
        public string ShortDescription
        {
            get { return _ShortDescription; }
            set { _ShortDescription = value; }
        }

        public string LongDescription
        {
            get { return _LongDescription; }
            set { _LongDescription = value; }
        }

        public string Title
        {
            get { return _Title; }
            set { _Title = value; }
        }
        public Category Category
        {
            get { return _Category; }
            set { _Category = value; }
        }

        public AdvertStatus AdvertStatus
        {
            get { return _AdvertStatus; }
            set { _AdvertStatus = value; }
        }

        public Country Country
        {
            get { return _Country; }
            set { _Country = value; }
        }

        public string Location
        {
            get { return _Location; }
            set { _Location = value; }
        }

        public bool ShowPriceYN
        {
            get { return _showPriceYN; }
            set { _showPriceYN = value; }
        }

        public Currency Currency
        {
            get { return _Currency; }
            set { _Currency = value; }
        }

        public decimal Price
        {
            get { return _price; }
            set { _price = value; }
        }

        public decimal PriceInEuro
        {
            get { return _priceInEuro; }
            set { _priceInEuro = value; }
        }


        public int Quantity
        {
            get { return _quantity; }
            set { _quantity = value; }
        }

        public int Age
        {
            get { return _age; }
            set { _age = value; }
        }

        public string ContactName
        {
            get { return _ContactName; }
            set { _ContactName = value; }
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

        public string URL
        {
            get { return _URL; }
            set { _URL = value; }
        }

        public string EmailAddress
        {
            get { return _EmailAddress; }
            set { _EmailAddress = value; }
        }

        public string Address
        {
            get { return _Address; }
            set { _Address = value; }
        }

        public DateTime ExpiryDate
        {
            get { return _ExpiryDate; }
            set { _ExpiryDate = value; }
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

        public List<AdvertImage> AdvertImage
        {
            get { return _AdvertImage; }
            set { _AdvertImage = value; }
        }

        public List<AdvertDocument> AdvertDocuments
        {
            get { return _AdvertDocuments; }
            set { _AdvertDocuments = value; }
        }

        public AdvertGSE AdvertGSE
        {
            get { return _AdvertGSE; }
            set { _AdvertGSE = value; }
        }

        public AdvertSpares AdvertSpares
        {
            get { return _AdvertSpares; }
            set { _AdvertSpares = value; }
        }
        public AdvertTool AdvertTool
        {
            get { return _AdvertTool; }
            set { _AdvertTool = value; }
        }

        public bool AgreedTCYN
        {
            get { return _agreedTCYN; }
            set { _agreedTCYN = value; }
        }

        public string Owner
        {
            get { return _owner; }
            set { _owner = value; }
        }

        public string FullText
        {
            get { return _fullText; }
            set { _fullText = value; }
        }

        public int Counter
        {
            get { return _counter; }
            set { _counter = value; }
        }

        public int UserAccountTypeId
        {
            get { return _userAccountTypeId; }
            set { _userAccountTypeId = value; }
        }

        public AdvertTransaction AdvertTransaction
        {
            get { return _advertTransaction; }
            set { _advertTransaction = value; }
        }

        public string GUID
        {
            get { return _GUID; }
            set { _GUID = value; }
        }

        #endregion

        #region "Public Methods"

        public Advert()
        {
            _Currency = new Currency();
            _Country = new Country();
            _AdvertStatus = new AdvertStatus();
            _Category = new Category();
            _AdvertImage = new List<AdvertImage>();
            _AdvertGSE = new AdvertGSE();
            _AdvertSpares = new AdvertSpares();
            _AdvertTool = new AdvertTool();
        }


        //Default Sort - by Title
        public int CompareTo(Advert advert)
        {
            return this.Title.CompareTo(advert.Title);
        }


        public static int CompareCountryAsc(Advert a1, Advert a2)
        {


            return a1.Country.CountryName.CompareTo(a2.Country.CountryName);
        }

        public static int CompareCountryDesc(Advert a1, Advert a2)
        {
            return a1.Country.CountryName.CompareTo(a2.Country.CountryName) * -1;
        }

        public static int CompareLocationAsc(Advert a1, Advert a2)
        {
            return a1.Location.CompareTo(a2.Location);
        }
        public static int CompareLocationDesc(Advert a1, Advert a2)
        {
            return a1.Location.CompareTo(a2.Location) * -1;
        }


        public static int CompareContactNameAsc(Advert a1, Advert a2)
        {
            return a1.ContactName.CompareTo(a2.ContactName);
        }
        public static int CompareContactNameDesc(Advert a1, Advert a2)
        {
            return a1.ContactName.CompareTo(a2.ContactName) * -1;
        }


        public static int ComparePriceAsc(Advert a1, Advert a2)
        {
            //return a1.Price.CompareTo(a2.Price);
            return a1.PriceInEuro.CompareTo(a2.PriceInEuro);
        }
        
        public static int ComparePriceDesc(Advert a1, Advert a2)
        {
            return a1.PriceInEuro.CompareTo(a2.PriceInEuro) * -1;
        }

        public static int CompareRAAsc(Advert a1, Advert a2)
        {
            return a1.CreatedDate.CompareTo(a2.CreatedDate);
        }
        public static int CompareRADesc(Advert a1, Advert a2)
        {
            return a1.CreatedDate.CompareTo(a2.CreatedDate) * -1;
        }

        #endregion


    }
}
