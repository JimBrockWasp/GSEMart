using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using Qualitiva.GSEMART.DataLayer;
using Qualitiva.GSEMART.BusinessObject;

namespace Qualitiva.GSEMART.BusinessLayer
{
    public class ManufacturerAction
    {
        public static List<Manufacturer> GetManufacturers()
        {
            return ManufacturerLayer.GetManufacturers();
        }
    }
}
