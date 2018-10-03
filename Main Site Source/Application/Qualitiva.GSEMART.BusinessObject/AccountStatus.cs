namespace Qualitiva.GSEMART.BusinessObject
{
    public class AccountStatus : ResponseInfo
    {
        #region "Private Members"
        private string _AccountStatusId;
        private string _Description;
        #endregion

        #region "Public Properties"

        public string AccountStatusId
        {
            get { return _AccountStatusId; }
            set { _AccountStatusId = value; }
        }

        public string Description
        {
            get { return _Description; }
            set { _Description = value; }
        }       

        #endregion


    }
}

