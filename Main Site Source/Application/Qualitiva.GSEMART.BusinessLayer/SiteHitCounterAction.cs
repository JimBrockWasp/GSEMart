using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using Qualitiva.GSEMART.DataLayer;
using Qualitiva.GSEMART.BusinessObject;

namespace Qualitiva.GSEMART.BusinessLayer
{
    public class SiteHitCounterAction
    {

        public static SiteHitCounter AddSiteHitCounter(SiteHitCounter obj)
        {
            return SiteHitCounterLayer.AddSiteHitCounter(obj);
        }

        public static SiteHitCounter GetSiteHitCount()
        {
            return SiteHitCounterLayer.GetSiteHitCount();
        }
    }
}
