using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using Qualitiva.GSEMART.DataLayer;
using Qualitiva.GSEMART.BusinessObject;

namespace Qualitiva.GSEMART.BusinessLayer
{
    public class CountryAction
    {

        public static List<Country> GetCountry()
        {
            return CountryLayer.GetCountry();
        }

        public static Country GetCountryById(string CountryId)
        {
            return CountryLayer.GetCountryById(CountryId);
        }

        public static Boolean IsCountryEUYN(string CountryId)
        {
            return CountryLayer.IsCountryEUYN(CountryId);
        }
    }
}
