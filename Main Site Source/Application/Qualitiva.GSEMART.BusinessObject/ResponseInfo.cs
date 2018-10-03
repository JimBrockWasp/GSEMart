using System;
using System.Collections.Generic;
using System.Text;

namespace Qualitiva.GSEMART.BusinessObject
{
    public class ResponseInfo
    {
        private int _respCode;
        private string _respDesc;
        private string _searchAllFor;

        public int RespCode
        {
            get { return _respCode; }
            set { _respCode = value; }
        }

        public string RespDesc
        {
            get { return _respDesc; }
            set { _respDesc = value; }
        }

        public string SearchAllFor
        {
            get { return _searchAllFor; }
            set { _searchAllFor = value; }
        }
    }
}