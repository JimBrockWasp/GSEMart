using System;
using System.Collections.Generic;
using System.Text;

namespace Qualitiva.GSEMART.BusinessObject
{
    public class SiteHitCounter : ResponseInfo
    {
        #region "Private Members"
        private int _iD;
        private ulong _hitCount;
        private string _visitorBrowser;
        private string _iPAddress;
        private DateTime _dateVisited;
        #endregion


        #region "Public Properties"
        public int ID
        {
            get { return _iD; }
            set { _iD = value; }
        }

        public ulong HitCount
        {
            get { return _hitCount; }
            set { _hitCount = value; }
        }

        public string VisitorBrowser
        {
            get { return _visitorBrowser; }
            set { _visitorBrowser = value; }
        }

        public string IPAddress
        {
            get { return _iPAddress; }
            set { _iPAddress = value; }
        }

        public DateTime DateVisited
        {
            get { return _dateVisited; }
            set { _dateVisited = value; }
        }
        #endregion
    }

}
