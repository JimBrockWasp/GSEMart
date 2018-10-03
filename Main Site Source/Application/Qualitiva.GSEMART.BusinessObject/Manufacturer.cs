namespace Qualitiva.GSEMART.BusinessObject
{
    public class Manufacturer : ResponseInfo
    {

        private string _ManufacturerName;


        public string ManufacturerName
        {
            get { return _ManufacturerName; }
            set { _ManufacturerName = value; }
        }

    }
}

