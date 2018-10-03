using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using Qualitiva.GSEMART.DataLayer;
using Qualitiva.GSEMART.BusinessObject;

namespace Qualitiva.GSEMART.BusinessLayer
{
    public class LogOnTypeAction
    {
        public static LogOnType GetLogOnType(int Id)
        {
            return LogOnTypeLayer.GetLogOnTypeById(Id);
        }

        public static LogOnType GetLogOnType(string Code)
        {
            return LogOnTypeLayer.GetLogOnTypeByCode(Code);
        }
    }
}
