/**
 * This is common class for Credit Card Processing
 */
using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Qualitiva.GSEMART.BusinessObject;
using Qualitiva.GSEMART.BusinessLayer;

/// <summary>
/// Summary description for CreditCardProcessing
/// </summary>
public static class CreditCardProcessing
{
    /// <summary>
    /// Function to Calculate Rate based on currency exchange values
    /// </summary>
    /// <param name="CountryId">Currency ID</param>
    /// <param name="rate">Rates</param>
    /// <returns>Amount in local currency rate</returns>
    public static decimal CalculateRateBasedOnCurrencyExchange(string CurrencyId, decimal rate)
    {
        decimal amount = 0;
        decimal CurrencyValue = 0;

        Currency objCurrency = new Currency();
        objCurrency = CurrencyAction.GetCurrencyById(CurrencyId);
        CurrencyValue = objCurrency.CurrencyValue;

        amount = rate * CurrencyValue;

        return amount;
    }
}
