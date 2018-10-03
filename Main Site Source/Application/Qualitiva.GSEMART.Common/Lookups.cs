using System;
using System.Collections.Generic;
using System.Text;

namespace Qualitiva.GSEMART.Common
{
    public static class AccountStatusLookup
    {
        public const string Confirmed = "CF";
        public const string Unconfirmed = "UC";
        public const string OnHold = "OH";

    }

    public static class VATNumberStatusLookup
    {
        public const string Invalid = "IV";
        public const string NotRequired = "NR";
        public const string PendingVerification = "PV";
        public const string Valid = "VA";
    }
    public static class AdvertStatusLookup
    {
        public const string Created = "NP";
        public const string OnHold = "OH";
        public const string Placed = "PL";
        public const string ReadyToBePlaced = "RD";
        public const string Sold = "SL";
    }

    public static class LogonTypeLookup
    {
        public const string Administrator = "Administrator";
        public const string Buyer = "Buyer";
        public const string Seller = "Seller";
        public const string Guest = "Guest";
    }



}

