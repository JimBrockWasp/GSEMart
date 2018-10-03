using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text.RegularExpressions;
using System.Text;
using System.Security.Cryptography;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using Qualitiva.GSEMART.BusinessObject;
using System.IO;

namespace Qualitiva.GSEMART.BusinessLayer
{
    public class Utilities
    {
        private static IFormatProvider plCulture = new CultureInfo(ConfigurationManager.AppSettings["plCulture"], true);
        private static IFormatProvider dbCulture = new CultureInfo(ConfigurationManager.AppSettings["dbCulture"], true);
        private static string strTxtBoxFormat = ConfigurationManager.AppSettings["strTxtBoxFormat"].ToString();
        private static string strTxtBoxTimeFormat = ConfigurationManager.AppSettings["strTxtBoxTimeFormat"].ToString();
        private static string strSendToDBFormat = ConfigurationManager.AppSettings["strSendToDBFormat"].ToString();

        # region "Password Protection functions"

        public static string GetHash(string plainText)
        {
            byte[] valueToHash = System.Text.Encoding.UTF8.GetBytes(plainText);
            byte[] generatedHash = new MD5CryptoServiceProvider().ComputeHash(valueToHash);
            Array.Clear(valueToHash, 0, valueToHash.Length);
            return Convert.ToBase64String(generatedHash);
        }

        public static bool ComparePassword(string strUserPassword, string strDBPassword)
        {
            byte[] valueToHash = System.Text.Encoding.UTF8.GetBytes(strUserPassword);
            byte[] tmpUserHash = new MD5CryptoServiceProvider().ComputeHash(valueToHash);
            byte[] tmpDBHash = Convert.FromBase64String(strDBPassword);

            bool blnMatched = false;

            if (tmpUserHash.Length == tmpDBHash.Length)
            {
                int i = 0;
                while ((i < tmpUserHash.Length) && (tmpUserHash[i] == tmpDBHash[i]))
                {
                    i += 1;
                }
                if (i == tmpUserHash.Length)
                {
                    blnMatched = true;
                }
            }

            // Clear the byte array memory
            Array.Clear(valueToHash, 0, valueToHash.Length);

            return blnMatched;
        }

        private static readonly Regex containsDigitRegex = new Regex(@"\d+");

        private static readonly Regex containsNonDigitRegex = new Regex(@"\D+");

        /// <summary>
        /// Determines whether the password has at least 6 characters and contains both digits and non digits.
        /// </summary>
        public static bool IsPasswordValid(string password)
        {
            if (password.Length < 6)
            {
                return false;
            }
            return containsDigitRegex.IsMatch(password) && containsNonDigitRegex.IsMatch(password);
        }
        # endregion "Password Protection functions"

        # region "Date functions"

        public static bool IsDateFromTextBox(string pstrValue)
        {

            if (IsEmpty(pstrValue)) return false;
            try
            {
                DateTime dteTemp = Convert.ToDateTime(pstrValue, plCulture);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static DateTime GetDateFromTextBox(string pstrValue)
        {
            return Convert.ToDateTime(pstrValue, plCulture);
        }

        public static string DisplayDateInTextBox(DateTime dte)
        {
            return dte.ToString(strTxtBoxFormat);
        }

        public static string DisplayDateTimeInTextBox(DateTime dte)
        {
            return dte.ToString(strTxtBoxTimeFormat);
        }

        public static string DisplayDateTimeInTextBox(DateTime? dte)
        {
            if (dte.HasValue)
                return dte.Value.ToString(strTxtBoxTimeFormat);
            else
                return ""; 
        }

        public static string DisplayDateInTextBox(DateTime? dte)
        {
            if (dte.HasValue)
                return dte.Value.ToString(strTxtBoxFormat);
            else
                return "";
        }

        public static DateTime GetDateFromDB(string pstrValue)
        {
            return Convert.ToDateTime(pstrValue, dbCulture);
        }

        public static string SendDateToDB(DateTime dte)
        {
            return dte.ToString(strSendToDBFormat);
        }

        public static string DisplayDate(DateTime dte)
        {
            return dte.ToString("dd MMM yyyy");
        }

        public static string DisplayDate(DateTime? dte)
        {
            string str = "";
            if (dte.HasValue)
                str = DisplayDate(dte.Value);
            return str;
        }

        public static string DisplayDate(string str)
        {
            if (IsDateFromDB(str))
            {
                str = DisplayDate(GetDateFromDB(str));
            }
            return str;
        }

        public static string DisplayDateAndTime(DateTime dte)
        {
            return dte.ToString("dd MMM yyyy hh:mm tt");
        }

        

        public static string DisplayDateAndTime(string str)
        {
            if (IsDateFromDB(str))
            {
                str =DisplayDateAndTime(GetDateFromDB(str));
            }
            return str;
        }


        public static string DisplayDateAndTime(DateTime? dte)
        {
            string str = "";
            if (dte.HasValue)
                str = DisplayDateAndTime(dte.Value);
            return str;
        }

        public static bool IsValidDateFormat(string strFormat)
        {
            try
            {
                string str = DateTime.Now.ToString(strFormat);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static bool IsDateFromDB(string pstrValue)
        {
            if (IsEmpty(pstrValue)) return false;
            try
            {
                DateTime dteTemp = GetDateFromDB(pstrValue);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static void FillHours(DropDownList drp)
        {
            for (int i = 0; i < 24; i++)
            {
                if (i < 10)
                    drp.Items.Add(new ListItem("0" + i.ToString(), i.ToString()));
                else
                    drp.Items.Add(i.ToString());
            }
        }

        public static void FillMinsandSecs(DropDownList drp)
        {
            for (int i = 0; i < 60; i++)
            {
                if (i < 10)
                    drp.Items.Add(new ListItem("0" + i.ToString(), i.ToString()));
                else
                    drp.Items.Add(i.ToString());
            }
        }

        public static void FillYears(DropDownList drpYears)
        {
            for (int i = DateTime.Now.Year - 12; i < DateTime.Now.Year + 12; i++)
            {
                drpYears.Items.Add(i.ToString());
            }
            drpYears.SelectedValue = DateTime.Now.Year.ToString();
        }

        public static void FillMonths(DropDownList drpMonths)
        {
            drpMonths.Items.Clear();
            drpMonths.Items.Add(new ListItem("Jan", "1"));
            drpMonths.Items.Add(new ListItem("Feb", "2"));
            drpMonths.Items.Add(new ListItem("Mar", "3"));
            drpMonths.Items.Add(new ListItem("Apr", "4"));
            drpMonths.Items.Add(new ListItem("May", "5"));
            drpMonths.Items.Add(new ListItem("Jun", "6"));
            drpMonths.Items.Add(new ListItem("Jul", "7"));
            drpMonths.Items.Add(new ListItem("Aug", "8"));
            drpMonths.Items.Add(new ListItem("Sep", "9"));
            drpMonths.Items.Add(new ListItem("Oct", "10"));
            drpMonths.Items.Add(new ListItem("Nov", "11"));
            drpMonths.Items.Add(new ListItem("Dec", "12"));
            drpMonths.SelectedValue = DateTime.Now.Month.ToString();
        }

        # endregion "Date functions"

        public static bool IsEmpty(string pstrValue)
        {
            return (pstrValue == null || string.Compare(pstrValue.Trim(), "") == 0);
        }


        public static string FixCrLf(string value)
        {
            if (!String.IsNullOrEmpty(value))
            {
                return value.Replace(Environment.NewLine, "<br />");
            }
            else
            {
                return string.Empty;
            }

        }

        public static bool IsValidNumber(string strNumber)
        {
            try
            {
                int i = Convert.ToInt32(strNumber);
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public static string GetCommaList(Array ar)
        {
            string str = "";
            for (int i = 0; i < ar.Length; i++)
            {
                str = str + ar.GetValue(i) + ",";
            }

            return str.Substring(0, str.Length - 1);
        }

        public static ArrayList GetArrayList(Array ar)
        {
            ArrayList alLeaveId = new ArrayList();
            for (int i = 0; i < ar.Length; i++)
            {
                alLeaveId.Add(ar.GetValue(i));
            }
            return alLeaveId;
        }

        private static readonly Regex regex = new Regex(@"[\/\s\+]+");

        public static void FillColor(DropDownList drp)
        {
            string[] arrColor = new string[64];

            //Black shades
            arrColor[0] = "#000000";
            arrColor[1] = "#333333";
            arrColor[2] = "#666666";
            arrColor[3] = "#888888";
            arrColor[4] = "#999999";
            arrColor[5] = "#AAAAAA";
            arrColor[6] = "#CCCCCC";
            arrColor[7] = "#EEEEEE";
            arrColor[8] = "#FFFFFF";

            //Blue shades
            arrColor[9] = "#000033";
            arrColor[10] = "#000066";
            arrColor[11] = "#000099";
            arrColor[12] = "#0000CC";
            arrColor[13] = "#0000FF";
            arrColor[14] = "#3333FF";
            arrColor[15] = "#6666FF";
            arrColor[16] = "#9999FF";
            arrColor[17] = "#CCCCFF";

            //Green Shades
            arrColor[18] = "#003300";
            arrColor[19] = "#006600";
            arrColor[20] = "#009900";
            arrColor[21] = "#00CC00";
            arrColor[22] = "#00FF00";
            arrColor[23] = "#33FF33";
            arrColor[24] = "#66FF66";
            arrColor[25] = "#99FF99";
            arrColor[26] = "#CCFFCC";

            //Red shades
            arrColor[27] = "#330000";
            arrColor[28] = "#660000";
            arrColor[29] = "#990000";
            arrColor[30] = "#CC0000";
            arrColor[31] = "#FF0000";
            arrColor[32] = "#FF3333";
            arrColor[33] = "#FF6666";
            arrColor[34] = "#FF9999";
            arrColor[35] = "#FFCCCC";

            //Orange                 
            arrColor[36] = "#FF9900";

            //Yellow shades
            arrColor[37] = "#333300";
            arrColor[38] = "#666600";
            arrColor[39] = "#999900";
            arrColor[40] = "#CCCC00";
            arrColor[41] = "#FFFF00";
            arrColor[42] = "#FFFF33";
            arrColor[43] = "#FFFF66";
            arrColor[44] = "#FFFF99";

            //Kind of greenish shades
            arrColor[45] = "#FFFFCC";
            arrColor[46] = "#003333";
            arrColor[47] = "#006666";
            arrColor[48] = "#009999";
            arrColor[49] = "#00CCCC";
            arrColor[50] = "#00FFFF";
            arrColor[51] = "#33FFFF";
            arrColor[52] = "#66FFFF";
            arrColor[53] = "#99FFFF";

            //Violet shades
            arrColor[54] = "#CCFFFF";
            arrColor[55] = "#330033";
            arrColor[56] = "#660066";
            arrColor[57] = "#990099";
            arrColor[58] = "#CC00CC";
            arrColor[59] = "#FF00FF";
            arrColor[60] = "#FF33FF";
            arrColor[61] = "#FF66FF";
            arrColor[62] = "#FF99FF";
            arrColor[63] = "#FFCCFF";


            for (int i = 0; i < arrColor.Length - 1; i++)
            {
                ListItem ls = new ListItem();
                ls.Attributes.Add("style", "background-color:" + arrColor.GetValue(i).ToString());
                ls.Value = arrColor.GetValue(i).ToString();
                ls.Text = "";
                drp.Items.Add(ls);
            }
        }

        //public static AppLegend GetLegendById(int LegendId, List<AppLegend> lstAL)
        //{
        //    AppLegend obj = new AppLegend();
        //    foreach (AppLegend objAL in lstAL)
        //    {
        //        if (objAL.LegendId == LegendId)
        //        {
        //            obj = objAL;
        //            break;
        //        }
        //    }
        //    return obj;
        //}

        

        /// <summary>
        /// Performs HTML tags stripping from a inout string.
        /// Uses RegEx pattern to remove all HTML tags
        /// </summary>
        /// <param name="htmlString"></param>
        /// <returns></returns>
        public static string StripHTML(string htmlString)
        {
            string pattern = @"<(.|\n)*?>";
            return Regex.Replace(htmlString, pattern, string.Empty);
        }



        ///// <summary>
        ///// Displays the Purchase Proposal Status description in a particular format 
        ///// </summary>
        ///// <param name="GenerationStatusID"></param>
        ///// <returns>Color</returns>
        //public static System.Drawing.Color FormatStatusDescriptionText(string GenerationStatusID)
        //{
        //    if (GenerationStatusID == "SU")
        //    {
        //        //Succesful
        //        return System.Drawing.Color.Blue;
        //    }
        //    else if (GenerationStatusID == "IP")
        //    {
        //        //In-Progress
        //        return System.Drawing.Color.Green;
        //    }
        //    else if (GenerationStatusID == "FA")
        //    {
        //        //Failed
        //        return System.Drawing.Color.Red;
        //    }
        //    else
        //    {
        //        return System.Drawing.Color.Black;
        //    }

        //}
        
       
        /// <summary>
        /// Returns the hours from the minutes
        /// </summary>
        public static decimal GetHourPercentFromMinutes(decimal decMins)
        {   
            return decMins / 60;
        }
    }
}
