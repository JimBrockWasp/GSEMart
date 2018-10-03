using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using Qualitiva.GSEMART.DataLayer;
using Qualitiva.GSEMART.BusinessObject;

namespace Qualitiva.GSEMART.BusinessLayer
{
    public class AccountAction
    {

        public static bool IsEmailExist(string EmailAddress)
        {
            return AccountLayer.IsEmailExist(EmailAddress);
        }

        public static Account AddAccount(Account objAccount, string ConfirmationCode)
        {
            return AccountLayer.AddAccount(objAccount, ConfirmationCode);
        }

        public static AccountType GetAccountTypeById(int AccountTypeId)
        {
            return AccountLayer.GetAccountTypeById(AccountTypeId);
        }
        
        public static List<Account> GetAccountsWithAdverts()
        {
            return AccountLayer.GetAccountsWithAdverts();
        }

        public static Account GetAccountById(int AccountId)
        {
            return AccountLayer.GetAccountById(AccountId);
        }
        
        public static AccountImage GetAccountImageByAccountId(int AccountId)
        {
            return AccountLayer.GetAccountImageByAccountId(AccountId);
        }
        
        public static AccountStatus GetAccountStatusById(string AccountStatusId)
        {
            return AccountLayer.GetAccountStatusById(AccountStatusId);
        }

        /*

        public static List<Account> GetAllAccount(string EmailAddress, string Name, int NameCategoryId, string CountryId, string AccountStatusId, int AccountTypeId)
        {
            return AccountLayer.GetAllAccount(EmailAddress, Name, NameCategoryId, CountryId, AccountStatusId, AccountTypeId);
        }

        public static List<Account> GetAllLiveAccounts()
        {
            return AccountLayer.GetAllLiveAccounts();
        }


        public static Account GetAccountByLoginInfo(string EmailAddress, string Password)
        {
            return AccountLayer.GetAccountByLoginInfo(EmailAddress, Password);
        }



        public static List<AccountStatus> GetAccountStatus()
        {
            return AccountLayer.GetAccountStatus();
        }

        public static List<AccountType> GetAccountType()
        {
            return AccountLayer.GetAccountType();
        }



        public static List<VATNumberStatus> GetVATNumberStatus()
        {
            return AccountLayer.GetVATNumberStatus();
        }

        public static VATNumberStatus GetVATNumberStatusById(string VATNumberStatusId)
        {
            return AccountLayer.GetVATNumberStatusById(VATNumberStatusId);
        }





        /// <summary>
        /// Return password of account
        /// </summary>
        /// <param name="EmailAddress"></param>
        /// <returns></returns>
        public static Account GetPassword(string EmailAddress)
        {
            return AccountLayer.GetPassword(EmailAddress);
        }

        public static ResponseInfo UpdateAccountStatus(string EmailAddress, string AccountStatusId)
        {
            return AccountLayer.UpdateAccountStatus(EmailAddress, AccountStatusId);
        }

        public static AccountConfirmationAudit GetAccountConfirmationAuditByEmail(string EmailAddress)
        {
            return AccountLayer.GetAccountConfirmationAuditByEmail(EmailAddress);
        }

        public static AccountEmailHistory AddAccountEmailHistory(AccountEmailHistory objAccountEmailHistory)
        {
            return AccountLayer.AddAccountEmailHistory(objAccountEmailHistory);
        }

        public static ResponseInfo UpdateAccountPassword(int AccountId, string Password)
        {
            return AccountLayer.UpdateAccountPassword(AccountId, Password);
        }

        public static Account UpdateAccount(Account objAccount)
        {
            return AccountLayer.UpdateAccount(objAccount);
        }

        public static AccountImage UpdateAccountImage (AccountImage objAccountImage)
        {
            return AccountLayer.UpdateAccountImage(objAccountImage);
        }

        public static Account UpdateAccountByAdmin(Account objAccount) {
            return AccountLayer.UpdateAccountByAdmin(objAccount);
        }
        */

    }
}
