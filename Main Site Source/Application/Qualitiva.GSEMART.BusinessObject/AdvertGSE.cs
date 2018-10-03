using System;
using System.Collections.Generic;
using System.Text;

namespace Qualitiva.GSEMART.BusinessObject
{
    public class AdvertGSE: ResponseInfo
    {

        #region "Private Members"
        private int _advertId;
        private string _manufacturer;
        private DateTime _dateofRegistration;
        private string _year;
        private int _GSETypeId;
        private string _GSETypeDescription;
        private string _AvailabilityId;
        private string _AvailabilityDescription;
        private bool _forSaleYN;
        private bool _forRentYN;
        private bool _forLeaseYN;

        private string _QtyId1;
        private string _QtyDescription1;
        private float _QtyValue1;
        private string _QtyUnitId1;
        private string _QtyUnitDescription1;

        private string _QtyId2;
        private string _QtyDescription2;
        private float _QtyValue2;
        private string _QtyUnitId2;
        private string _QtyUnitDescription2;

        private string _SpecId1;
        private string _SpecDescription1;
        private string _SpecOptionId1;
        private string _SpecOptionDescription1;

        private string _SpecId2;
        private string _SpecDescription2;
        private string _SpecOptionId2;
        private string _SpecOptionDescription2;

        private string _SpecId3;
        private string _SpecDescription3;
        private string _SpecOptionId3;
        private string _SpecOptionDescription3;


        private List<AdvertFeature> _AdvertFeature;

        #endregion

        #region "Public Properties"
        public int AdvertId
        {
            get { return _advertId; }
            set { _advertId = value; }
        }

        public string Manufacturer
        {
            get { return _manufacturer; }
            set { _manufacturer = value; }
        }

        public DateTime DateofRegistration
        {
            get { return _dateofRegistration; }
            set { _dateofRegistration = value; }
        }

        public string Year
        {
            get { return _year; }
            set { _year = value; }
        }

        public int GSETypeId
        {
            get { return _GSETypeId; }
            set { _GSETypeId = value; }
        }
        public string GSETypeDescription
        {
            get { return _GSETypeDescription; }
            set { _GSETypeDescription = value; }
        }

        public string AvailabilityId
        {
            get { return _AvailabilityId; }
            set { _AvailabilityId = value; }
        }
        public string AvailabilityDescription
        {
            get { return _AvailabilityDescription; }
            set { _AvailabilityDescription = value; }
        }
        public bool ForSaleYN
        {
            get { return _forSaleYN; }
            set { _forSaleYN = value; }
        }

        public bool ForRentYN
        {
            get { return _forRentYN; }
            set { _forRentYN = value; }
        }

        public bool ForLeaseYN
        {
            get { return _forLeaseYN; }
            set { _forLeaseYN = value; }
        }


        public string QtyId1
        {
            get { return _QtyId1; }
            set { _QtyId1 = value; }
        }
        
        public string QtyDescription1
        {
            get { return _QtyDescription1; }
            set { _QtyDescription1 = value; }
        }

        public float QtyValue1
        {
            get { return _QtyValue1; }
            set { _QtyValue1 = value; }
        }

        public string QtyUnitId1
        {
            get { return _QtyUnitId1; }
            set { _QtyUnitId1 = value; }
        }

        public string QtyUnitDescription1
        {
            get { return _QtyUnitDescription1; }
            set { _QtyUnitDescription1 = value; }
        }

        public string QtyId2
        {
            get { return _QtyId2; }
            set { _QtyId2 = value; }
        }

        public string QtyDescription2
        {
            get { return _QtyDescription2; }
            set { _QtyDescription2 = value; }
        }

        public float QtyValue2
        {
            get { return _QtyValue2; }
            set { _QtyValue2 = value; }
        }

        public string QtyUnitId2
        {
            get { return _QtyUnitId2; }
            set { _QtyUnitId2 = value; }
        }

        public string QtyUnitDescription2
        {
            get { return _QtyUnitDescription2; }
            set { _QtyUnitDescription2 = value; }
        }

        public string SpecId1
        {
            get { return _SpecId1; }
            set { _SpecId1 = value; }
        }

        public string SpecDescription1
        {
            get { return _SpecDescription1; }
            set { _SpecDescription1 = value; }
        }

        public string SpecOptionId1
        {
            get { return _SpecOptionId1; }
            set { _SpecOptionId1 = value; }
        }

        public string SpecOptionDescription1
        {
            get { return _SpecOptionDescription1; }
            set { _SpecOptionDescription1 = value; }
        }

        public string SpecId2
        {
            get { return _SpecId2; }
            set { _SpecId2 = value; }
        }

        public string SpecDescription2
        {
            get { return _SpecDescription2; }
            set { _SpecDescription2 = value; }
        }

        public string SpecOptionId2
        {
            get { return _SpecOptionId2; }
            set { _SpecOptionId2 = value; }
        }

        public string SpecOptionDescription2
        {
            get { return _SpecOptionDescription2; }
            set { _SpecOptionDescription2 = value; }
        }

        public string SpecId3
        {
            get { return _SpecId3; }
            set { _SpecId3 = value; }
        }

        public string SpecDescription3
        {
            get { return _SpecDescription3; }
            set { _SpecDescription3 = value; }
        }

        public string SpecOptionId3
        {
            get { return _SpecOptionId3; }
            set { _SpecOptionId3 = value; }
        }

        public string SpecOptionDescription3
        {
            get { return _SpecOptionDescription3; }
            set { _SpecOptionDescription3 = value; }
        }

        public List<AdvertFeature> AdvertFeature
        {
            get { return _AdvertFeature; }
            set { _AdvertFeature = value; }
        }



        #endregion
    }
}
