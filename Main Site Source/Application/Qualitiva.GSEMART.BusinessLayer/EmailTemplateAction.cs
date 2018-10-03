using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using Qualitiva.GSEMART.DataLayer;
using Qualitiva.GSEMART.BusinessObject;

namespace Qualitiva.GSEMART.BusinessLayer
{
   public class EmailTemplateAction
    {
        /// <summary>
        /// Return email template
        /// </summary>
        /// <param name="Code"></param>
        /// <returns></returns>
       public static EmailTemplate GetEmailTemplate(string Code)
       {
           return EmailTemplateLayer.GetEmailTemplate(Code);
       }
    }
}
