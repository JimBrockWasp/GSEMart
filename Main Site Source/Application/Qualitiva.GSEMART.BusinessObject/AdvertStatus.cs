namespace Qualitiva.GSEMART.BusinessObject
{
    public class AdvertStatus : ResponseInfo
    {
        #region "Private Members"
        private string _AdvertStatusId;
        private string _Description;
        #endregion

        #region "Public Properties"

        public string AdvertStatusId
        {
            get { return _AdvertStatusId; }
            set { _AdvertStatusId = value; }
        }

        public string Description
        {
            get { return _Description; }
            set { _Description = value; }
        }

        #endregion


    }
}

