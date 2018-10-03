using System;
using System.Collections.Generic;
using System.Text;

namespace Qualitiva.GSEMART.BusinessObject
{
    public class AdvertDocument
    {
        #region "Private Members"
        int _indexId;
        int _advertId;
        string _physicalPath;
        string _virtualPath;
        string _title;
        #endregion

        #region "Public Members"

        public int IndexId
        {
            get { return _indexId; }
            set { _indexId = value; }
        }

        public int AdvertId
        {
            get { return _advertId; }
            set { _advertId = value; }
        }

        public string PhysicalPath
        {
            get { return _physicalPath; }
            set { _physicalPath = value; }
        }

        public string VirtualPath
        {
            get { return _virtualPath; }
            set { _virtualPath = value; }
        }

        public string Title
        {
            get { return _title; }
            set { _title = value; }
        }


        #endregion


    }
}
