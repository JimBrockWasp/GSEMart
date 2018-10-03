using System;
using System.Collections.Generic;
using System.Text;

namespace Qualitiva.GSEMART.BusinessObject
{
     public class LogOnType: ResponseInfo
    {
        #region "Private Members"
        private int _Id;
        private string _Code;
        private string _Description;
        #endregion

        #region "Public Properties"

         public int Id
        {
            get { return _Id; }
            set { _Id = value; }
        }

         public string Code
        {
            get { return _Code; }
            set { _Code = value; }
        }
         public string Description
        {
            get { return _Description; }
            set { _Description = value; }
        }

        #endregion
    }
}

