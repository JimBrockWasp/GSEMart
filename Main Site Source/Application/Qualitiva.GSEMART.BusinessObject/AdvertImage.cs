using System;
using System.Collections.Generic;
using System.Text;

namespace Qualitiva.GSEMART.BusinessObject
{
    public class AdvertImage : ResponseInfo
    {
        #region "Private Members"
        private int _AdvertImageId;
        private int _AdvertId;
        private string _Description;
        private byte[] _Image;
        private string _ContentType;
        private bool _InUseYN;
        private bool _IsDefaultYN;
        private DateTime _CreatedDate;
        #endregion


        #region "Public Properties"

        public int AdvertImageId
        {
            get { return _AdvertImageId; }
            set { _AdvertImageId = value; }
        }

        public int AdvertId
        {
            get { return _AdvertId; }
            set { _AdvertId = value; }
        }

        public string Description
        {
            get { return _Description; }
            set { _Description = value; }
        }
        public byte[] Image
        {
            get { return _Image; }
            set { _Image = value; }
        }
        public string ContentType
        {
            get { return _ContentType; }
            set { _ContentType = value; }
        }
        public bool InUseYN
        {
            get { return _InUseYN; }
            set { _InUseYN = value; }
        }

        public bool IsDefaultYN
        {
            get { return _IsDefaultYN; }
            set { _IsDefaultYN = value; }
        }

        public DateTime CreatedDate
        {
            get { return _CreatedDate; }
            set { _CreatedDate = value; }
        }

        #endregion
    }
}
