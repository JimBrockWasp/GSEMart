using System;
using System.Collections.Generic;
using System.Text;

namespace Qualitiva.GSEMART.BusinessObject
{
    public class Spec
    {

        #region "Private Members"

        private string _SpecId;
        private int _GSETypeId;
        private string _Description;

        #endregion

        #region "Public Members"

        public string SpecId
        {
            get { return _SpecId; }
            set { _SpecId = value; }
        }
        public string Description
        {
            get { return _Description; }
            set { _Description = value; }
        }
        public int GSETypeId
        {
            get { return _GSETypeId; }
            set { _GSETypeId = value; }
        }


        #endregion


    }
}
