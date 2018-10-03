namespace Qualitiva.GSEMART.BusinessObject
{
    public class VATNumberStatus : ResponseInfo
    {
        #region "Private Members"
        private string _VATNumberStatusId;
        private string _Description;
        #endregion

        #region "Public Properties"

        public string VATNumberStatusId
        {
            get { return _VATNumberStatusId; }
            set { _VATNumberStatusId = value; }
        }

        public string Description
        {
            get { return _Description; }
            set { _Description = value; }
        }

        #endregion


    }
}

