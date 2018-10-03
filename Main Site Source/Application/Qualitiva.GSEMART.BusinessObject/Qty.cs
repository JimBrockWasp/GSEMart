using System;
using System.Collections.Generic;
using System.Text;

namespace Qualitiva.GSEMART.BusinessObject
{
    public class Qty
    {

        #region "Private Members"

        private string _QtyId;
        private int _GSETypeId;
        private string _Description;
        private string _MetricUnitDescription;
        private float _MetricConversionRatio;
        private string _ImperialUnitDescription;


        #endregion

        #region "Public Members"

        public string QtyId
        {
            get { return _QtyId; }
            set { _QtyId = value; }
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
        public string MetricUnitDescription {
            get { return _MetricUnitDescription; }
            set { _MetricUnitDescription = value;}
        }
        public string ImperialUnitDescription
        {
            get { return _ImperialUnitDescription; }
            set { _ImperialUnitDescription = value; }
        }
        public float MetricConversionRatio
        {
            get { return _MetricConversionRatio; }
            set { _MetricConversionRatio = value; }
        }

        #endregion

    }
}
