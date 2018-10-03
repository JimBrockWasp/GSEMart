using System;
using System.Collections.Generic;
using System.Text;

namespace Qualitiva.GSEMART.BusinessObject
{
   public class EmailTemplate : ResponseInfo
    {
        #region "Private Members"
        private int _id;
        private string _code;
        private string _text;
        #endregion

        #region "Public Properties"
        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }

        public string Code
        {
            get { return _code; }
            set { _code = value; }
        }

        public string Text
        {
            get { return _text; }
            set { _text = value; }
        }
        #endregion
    }
}
