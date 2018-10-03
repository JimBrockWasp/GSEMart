using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Globalization;
using System.Text;
using System.IO;
using System.Xml;
using System.Xml.XPath;
using System.Xml.Xsl;
using Qualitiva.GSEMART.BusinessLayer;
using Qualitiva.GSEMART.BusinessObject;
using Qualitiva.GSEMART.Common;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Text.RegularExpressions;

/// <summary>
/// Summary description for Common
/// </summary>
public class Common
{
    //private static Account objAccount;
    private static Account objAccount;
    public static string ApplicationUrl = ConfigurationManager.AppSettings["ApplicationUrl"];
    public static string SellerUrl = ConfigurationManager.AppSettings["sellerURL"];
    public static string Title = ConfigurationManager.AppSettings["Title"];
    
    public static int GetThumbWidth (int scale)
    {
        int width;
        switch (scale)
        {
            case 1:
                width = int.Parse(ConfigurationManager.AppSettings["ThumbWidth1"]);
                break;
            case 2:
                width = int.Parse(ConfigurationManager.AppSettings["ThumbWidth2"]);
                break;
            case 3:
                width = int.Parse(ConfigurationManager.AppSettings["ThumbWidth3"]);
                break;
            default:
                width = int.Parse(ConfigurationManager.AppSettings["ThumbWidth2"]);
                break;
        }
        return width;
    }

    public static int GetThumbHeight(int scale)
    {
        int height;
        switch (scale)
        {
            case 1:
                height = int.Parse(ConfigurationManager.AppSettings["ThumbHeight1"]);
                break;
            case 2:
                height = int.Parse(ConfigurationManager.AppSettings["ThumbHeight2"]);
                break;
            case 3:
                height = int.Parse(ConfigurationManager.AppSettings["ThumbHeight3"]);
                break;
            default:        
                height = int.Parse(ConfigurationManager.AppSettings["ThumbHeight2"]);
                break;
        }
        return height;
    }

    public static string GetPageTitle()
    {
        if (SiteMap.CurrentNode != null)
        {
            return Title + " - " + SiteMap.CurrentNode.Title;
        }
        else
        {
            return Title;
        }
    }
    public static FormsIdentity Identity
    {
        get
        {
            if (System.Web.HttpContext.Current.User == null)
            {
                return null;
            }

            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                if (HttpContext.Current.User.Identity.GetType() == typeof(FormsIdentity))
                {
                    return (FormsIdentity)HttpContext.Current.User.Identity;
                }
            }
            return null;
        }
    }

    private static HttpContext HttpCurrent
    {
        get { return HttpContext.Current; }
    }

    public static string Username
    {
        get { return Identity.Name; }
    }

    //public static Account User
    //public static Account User
    //{
    //    get { return objAccount; }
    //}
    /*
    public static bool LogInUser(string username, string password, string logOnTypeCode,
                                 out int AccountId, out string AccountFullName, out string AccountEmailAddress,
                                 out string AccountStatus)
    {
        //if (logOnType.Code == LogonTypeLookup.Administrator)
        //    return AdminLogon.Authenticate(username, password) > 0;     

        AccountId = 0;
        AccountFullName = "";
        AccountStatus = "";
        AccountEmailAddress = "";

        objAccount = new Account();
        bool userAuthenthicated = false;
        objAccount = AccountAction.GetAccountByLoginInfo(username, password);
        
        //if account exist, EmailAddress will not be null
        if ((objAccount.EmailAddress != "") && (objAccount.EmailAddress != null))
        {
            userAuthenthicated = true;
            AccountId = objAccount.AccountId;
            AccountFullName = objAccount.FullName;
            AccountEmailAddress = objAccount.EmailAddress;
            AccountStatus = objAccount.AccountStatus.AccountStatusId;
        }

        if (!userAuthenthicated)
            return false;

        if (Common.Identity != null)
        {
            FormsAuthentication.SignOut();
        }

        HttpCookie cookie = WebUser.CreateEncryptedFormsCookie(username, logOnTypeCode.ToString(), 30);
        HttpCurrent.Response.Cookies.Add(cookie);
        
        return true;
    }
    */

    public static string UserLogOnTypeCode
    {
        get
        {
            string code = Identity == null ? "Buyer" : Identity.Ticket.UserData.ToString();
            return code;
        }
    }

    public static void LogoutUser()
    {

        HttpContext.Current.User = null;
        FormsAuthentication.SignOut();

    }


    public static string GetLogoutUrl()
    {

        try
        {
            string LogOnTypeCode = Common.UserLogOnTypeCode;

            switch (LogOnTypeCode.ToLowerInvariant())
            {
                case "seller":
                    return "~/sell.aspx";
                case "administator":
                    return "~/adm/default.aspx";
                default:
                    return "~/sell.aspx";
            }
        }
        catch (Exception ex)
        {
            return "~/default.aspx";
        }
    }

    public static string GenerateConfirmationCode(int codeLength)
    {
        Random RandomClass = new Random();

        //array of 61 is defined and alphabets (both upper case / lower case) and numbers are assigned
        string[] char_array = new string[62];

        char_array[0] = "0";
        char_array[1] = "1";
        char_array[2] = "2";
        char_array[3] = "3";
        char_array[4] = "4";
        char_array[5] = "5";
        char_array[6] = "6";
        char_array[7] = "7";
        char_array[8] = "8";
        char_array[9] = "9";
        char_array[10] = "A";
        char_array[11] = "z";
        char_array[12] = "B";
        char_array[13] = "y";
        char_array[14] = "C";
        char_array[15] = "x";
        char_array[16] = "D";
        char_array[17] = "w";
        char_array[18] = "E";
        char_array[19] = "v";
        char_array[20] = "F";
        char_array[21] = "u";
        char_array[22] = "G";
        char_array[23] = "t";
        char_array[24] = "H";
        char_array[25] = "s";
        char_array[26] = "I";
        char_array[27] = "r";
        char_array[28] = "J";
        char_array[29] = "q";
        char_array[30] = "K";
        char_array[31] = "p";
        char_array[32] = "L";
        char_array[33] = "o";
        char_array[34] = "M";
        char_array[35] = "n";
        char_array[36] = "N";
        char_array[37] = "m";
        char_array[38] = "O";
        char_array[39] = "l";
        char_array[40] = "P";
        char_array[41] = "k";
        char_array[42] = "Q";
        char_array[43] = "j";
        char_array[44] = "R";
        char_array[45] = "i";
        char_array[46] = "S";
        char_array[47] = "h";
        char_array[48] = "T";
        char_array[49] = "g";
        char_array[50] = "U";
        char_array[51] = "f";
        char_array[52] = "V";
        char_array[53] = "e";
        char_array[54] = "W";
        char_array[55] = "d";
        char_array[56] = "X";
        char_array[57] = "c";
        char_array[58] = "Y";
        char_array[59] = "b";
        char_array[60] = "Z";
        char_array[61] = "a";

        //'command to generate a random number
        //randomize
        string output = "";
        string num;
        //'Loop through and create the output based on the the variable passed to
        //'the function for the length of the key.

        while (output.Length < codeLength)
        {
            num = char_array[(int)(RandomClass.Next(0, 61))];
            output = output + num;
        }

        //'Set return
        return output;

    }

    public static void GetCountry(DropDownList drpCountry, bool isSearchEngine)
    {
        drpCountry.DataSource = CountryAction.GetCountry();
        drpCountry.DataValueField = "CountryId";
        drpCountry.DataTextField = "CountryName";

        if (isSearchEngine)
        {
            ListItem listItem = new ListItem();
            drpCountry.Items.RemoveAt(0);
            listItem.Text = "All Countries";
            listItem.Value = "";
            drpCountry.Items.Insert(0, listItem);
        }

        drpCountry.DataBind();
    }

    public static void GetCategory(DropDownList drpCategory, bool isSearchEngine)
    {
        drpCategory.DataSource = CategoryAction.GetCategory();
        drpCategory.DataValueField = "CategoryId";
        drpCategory.DataTextField = "Description";

        if (isSearchEngine)
        {
            ListItem listItem = new ListItem();
            drpCategory.Items.RemoveAt(0);
            listItem.Text = "All Categories";
            listItem.Value = "";
            drpCategory.Items.Insert(0, listItem);
        }

        drpCategory.DataBind();
    }

    public static void GetAvailability(DropDownList drpAvailability, bool isSearchEngine)
    {
        drpAvailability.DataSource = AdvertAvailabilityAction.GetAdvertAvailability();
        drpAvailability.DataValueField = "AdvertAvailabilityId";
        drpAvailability.DataTextField = "Description";

        if (isSearchEngine)
        {
            ListItem listItem = new ListItem();
            drpAvailability.Items.RemoveAt(0);
            listItem.Text = "Both";
            listItem.Value = "";
            drpAvailability.Items.Insert(0, listItem);
        }

        drpAvailability.DataBind();
    }

    public static void GetGSEType(DropDownList drpGSEType, bool isSearchEngine)
    {
        drpGSEType.DataSource = GSETypeAction.GetGSEType();
        drpGSEType.DataValueField = "GSETypeId";
        drpGSEType.DataTextField = "Description";

        if (isSearchEngine)
        {
            ListItem listItem = new ListItem();
            drpGSEType.Items.RemoveAt(0);
            listItem.Text = "All GSETypes";
            listItem.Value = "";
            drpGSEType.Items.Insert(0, listItem);
        }

        drpGSEType.DataBind();
    }


    public static void GetCurrency(DropDownList drpCurrency)
    {
        drpCurrency.DataSource = CurrencyAction.GetCurrency();
        drpCurrency.DataValueField = "CurrencyId";
        drpCurrency.DataTextField = "Description";
        drpCurrency.DataBind();
    }
    public static byte[] ResizeImageFile(byte[] imageFile, int targetSize)
    {

        using (System.Drawing.Image oldImage = System.Drawing.Image.FromStream(new MemoryStream(imageFile)))
        {
            Size newSize = CalculateDimensions(oldImage.Size, targetSize);
            using (Bitmap newImage = new Bitmap(newSize.Width, newSize.Height, PixelFormat.Format24bppRgb))
            {
                using (Graphics canvas = Graphics.FromImage(newImage))
                {
                    canvas.SmoothingMode = SmoothingMode.AntiAlias;
                    canvas.InterpolationMode = InterpolationMode.HighQualityBicubic;
                    canvas.PixelOffsetMode = PixelOffsetMode.HighQuality;
                    canvas.DrawImage(oldImage, new Rectangle(new Point(0, 0), newSize));
                    MemoryStream m = new MemoryStream();
                    newImage.Save(m, ImageFormat.Jpeg);
                    return m.GetBuffer();
                }

            }

        }
    }

    private static Size CalculateDimensions(Size oldSize, int targetSize)
    {
        Size newSize = new Size();
        //*** If the image is smaller than a target size just return it
        if (oldSize.Width < targetSize)
        {
            newSize.Width = oldSize.Width;
            newSize.Height = oldSize.Height;
        }
        else
        {
            if (oldSize.Height > oldSize.Width)
            {
                newSize.Width = (int)(oldSize.Width * ((float)targetSize / (float)oldSize.Height));
                newSize.Height = targetSize;
            }
            else
            {
                newSize.Width = targetSize;
                newSize.Height = (int)(oldSize.Height * ((float)targetSize / (float)oldSize.Width));
            }
        }
        return newSize;
    }

    private void dummy()
    {
    }
    
    /// <summary>
    /// Encode all the search keyword for handling special characters
    /// </summary>
    /// <param name="strSearchAllFor">Search keyword</param>
    /// <returns>Encoded search keyword</returns>
    public static string EncodeSearchKeyword(string strSearchAllFor){
        strSearchAllFor = strSearchAllFor.Replace("-", "%20");
        strSearchAllFor = strSearchAllFor.Replace("+", "%2B");
        strSearchAllFor = strSearchAllFor.Replace("\"", "%22");
        strSearchAllFor = strSearchAllFor.Replace("<", "%3C");
        strSearchAllFor = strSearchAllFor.Replace(">", "%3E");
        
        return strSearchAllFor;
    }

    /// <summary>
    /// Function to build the search keyword for full text searching usage (version 1)
    /// after entered by user
    /// </summary>
    /// <param name="strSearchAllFor">search keyword</param>
    /// <returns>built search keywords</returns>
    public static string BuildSearchKeyword(string strSearchAllFor) {
        strSearchAllFor = strSearchAllFor.Trim();
        while (strSearchAllFor.Contains("  "))
        {
            strSearchAllFor = strSearchAllFor.Replace("  ", " ");
        }

        strSearchAllFor = strSearchAllFor.Replace(", ", ",");
        strSearchAllFor = strSearchAllFor.Replace(" ,", ",");
        strSearchAllFor = strSearchAllFor.Replace(" , ", ",");

        while (strSearchAllFor.Contains(",,"))
        {
            strSearchAllFor = strSearchAllFor.Replace(",,", ",");
        }

        //encoding all the special characters
        strSearchAllFor = Common.EncodeSearchKeyword(strSearchAllFor);

        strSearchAllFor = strSearchAllFor.Replace(",", "-OR-");
        strSearchAllFor = strSearchAllFor.Replace(" ", "-AND-");

        strSearchAllFor = strSearchAllFor.Replace("-OR--OR-", "-OR-");
        strSearchAllFor = strSearchAllFor.Replace("-AND--AND-", "-AND-");

        strSearchAllFor = strSearchAllFor.Trim();

        if (strSearchAllFor.StartsWith("-OR-"))
            strSearchAllFor = strSearchAllFor.Remove(0, 4);
        if (strSearchAllFor.EndsWith("-OR-"))
            strSearchAllFor = strSearchAllFor.Remove(strSearchAllFor.Length - 4, 4);

        if (strSearchAllFor.StartsWith("-AND-"))
            strSearchAllFor = strSearchAllFor.Remove(0, 5);
        if (strSearchAllFor.EndsWith("-AND-"))
            strSearchAllFor = strSearchAllFor.Remove(strSearchAllFor.Length - 5, 5);

        strSearchAllFor = strSearchAllFor.Replace("-", " ");
        strSearchAllFor = strSearchAllFor.Trim();

        return strSearchAllFor;
    }

    /// <summary>
    /// Function to build the search keyword for full text searching usage (version 2)
    /// after entered by user
    /// Supported wildcard searching on full-text
    /// </summary>
    /// <param name="strSearchAllFor">search keyword</param>
    /// <returns>built search keywords</returns>
    public static string BuildSearchKeyword2(string strSearchAllFor)
    {
        //trim the most left and most right spaces
        strSearchAllFor = strSearchAllFor.Trim();

        //if no keyword is entered,
        //directly return <empty> instead of going through the code below
        if (strSearchAllFor == "") {
            return "";
        }
        
        //Encode special characters to avoid SQL full-text errors
        strSearchAllFor = Common.EncodeSearchKeyword(strSearchAllFor);

        //split all words based comma values for OR conditions
        string strBuiltORWords = "";
        string[] arrSearchAllFor = strSearchAllFor.Split(',');

        //loop through all the comma values word,
        //and split the word based on <space> to generate AND conditions
        foreach (string strWords in arrSearchAllFor) {
            string strBuiltANDWords;
            strBuiltANDWords = "";

            string[] arrWords = strWords.Trim().Split(' ');

            //loop through word to contruct AND conditions
            foreach (string strWord in arrWords) {
                //strWord = strWord.Trim();
                string tmp = "\"" + strWord.Trim() + "*\" ";
                if (strBuiltANDWords != "")
                    strBuiltANDWords = strBuiltANDWords + " AND " + tmp;
                else
                    strBuiltANDWords = tmp;
            }

            //after concat the AND conditions, now concat with the OR conditions
            if (strBuiltORWords != "")
                strBuiltORWords = strBuiltORWords + " OR " + strBuiltANDWords;
            else
                strBuiltORWords = strBuiltANDWords;
        }

        //trim the most left and most right <space> for the last time again
        strBuiltORWords = strBuiltORWords.Trim();

        return strBuiltORWords;
    }

    /// <summary>
    /// Function to check if the number is integer
    /// </summary>
    /// <param name="text"></param>
    /// <returns></returns>
    public static bool IsInteger(string inputValue)
    {
        if (!IsNumeric(inputValue))
            return false;
        try
        {
            int a = Convert.ToInt16(inputValue);    //Convert.ToInt16 will throw exception if string not integer
            return true;
        }
        catch
        {
            return false;
        }
    }

    /// <summary>
    /// Function to check if the value is numeric
    /// </summary>
    /// <param name="inputValue">Integer value in string</param>
    /// <returns>True or False</returns>
    public static bool IsNumeric(string inputValue)
    {
        if (string.Equals("", inputValue) || string.Equals("", inputValue))
        {
            return false;
        }
        else
        {
            /*
            The surrounding ^ and $ characters mean that the expression must appear at the beginning and the end of the string. In real terms, this means that the expression must match the whole string – the string cannot contain any other characters.
            */
            string strRegex = @"(^((\+|-)\d)?\d*$)|(^((\+|-)\d)?\d*(\.\d+)?$)";

            Regex re = new Regex(strRegex);
            if (re.IsMatch(inputValue))
                return (true);
            else
                return (false);
        }
    }

    /// <summary>
    /// Function to check if year is leap year
    /// </summary>
    /// <param name="year">year in integer</param>
    /// <returns>True or False</returns>
    public static bool IsLeapYear(int year)
    {
	    bool functionReturnValue = false;

        if (year % 4 == 0 & (year % 100 != 0 | (year % 100 == 0 & year % 400 == 0)))
        {
		    functionReturnValue = true;
	    } else {
		    functionReturnValue = false;
	    }
	    
        return functionReturnValue;
    }

    /// <summary>
    /// Function to Format the Date
    /// </summary>
    /// <param name="dateTime">DateTime</param>
    /// <returns>Date in string values</returns>
    public static string FormatDate(DateTime dateTime) {
        return dateTime.ToString(ConfigurationManager.AppSettings["strDisplayDate"]);
    }

    /// <summary>
    /// Function to Format the Date Time
    /// </summary>
    /// <param name="dateTime">DateTime</param>
    /// <returns>Date in string values</returns>
    public static string FormatDateTime(DateTime dateTime)
    {
        return dateTime.ToString(ConfigurationManager.AppSettings["strDisplayDateTime"]);
    }
}
