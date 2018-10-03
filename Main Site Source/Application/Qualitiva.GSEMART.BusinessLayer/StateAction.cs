using System;
using System.Collections.Generic;
using System.Text;
using Qualitiva.GSEMART.BusinessObject;
using Qualitiva.GSEMART.DataLayer;

namespace Qualitiva.GSEMART.BusinessLayer
{
    public class StateAction
    {
            public static List<State> GetState()
            {
                return StateLayer.GetState();
            }
    }
}
