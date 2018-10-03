using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using Qualitiva.GSEMART.DataLayer;
using Qualitiva.GSEMART.BusinessObject;

namespace Qualitiva.GSEMART.BusinessLayer
{
  public class AdvertAvailabilityAction
    {
        /// <summary>
       /// Get all Advert Availabilities
       /// </summary>
       /// <returns></returns>
        public static List<AdvertAvailability> GetAdvertAvailability()
        {
            return AdvertAvailabilityLayer.GetAdvertAvailability();
        }

    }
}
