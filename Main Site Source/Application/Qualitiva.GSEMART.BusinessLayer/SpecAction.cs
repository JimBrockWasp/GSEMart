using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using Qualitiva.GSEMART.DataLayer;
using Qualitiva.GSEMART.BusinessObject;

namespace Qualitiva.GSEMART.BusinessLayer
{
    public class SpecAction
    {
        public static List<Spec> getSpecs(int GSETypeId)
        {
            return SpecLayer.GetSpecs(GSETypeId);
        }

        public static List<SpecOption> getSpecOptions(int GSETypeId, string SpecId)
        {
            return SpecLayer.GetSpecOptions(GSETypeId, SpecId);
        }
    }
}
