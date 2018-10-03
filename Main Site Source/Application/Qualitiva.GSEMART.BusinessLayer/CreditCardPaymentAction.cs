using System;
using System.Collections.Generic;
using System.Text;
using SagePayTransactionCls = SagePayTransaction.SagePayTransaction;

namespace Qualitiva.GSEMART.BusinessLayer
{
    public class CreditCardPaymentAction : SagePayTransactionCls
    {

        SagePayTransactionCls objSagePayTransaction = new SagePayTransactionCls();

        public string GetSagePayToken(string strList, string strRequired)
        {

            // Jim. For some reason the SagePay getToken doesn't work so I'm fixing it!
            //
            // Get the string from the SagePay routine
            strRequired = objSagePayTransaction.getToken(strList, strRequired);

            // If it contains an "&" strip to that
            if (strRequired.IndexOf("&") > 0){

                // Get the index of the &
                int Index = strRequired.IndexOf("&");

                // Get the string to the left of this
                strRequired = strRequired.Substring(0, Index);

            }

            // Return to the result
            return strRequired;
        }

        public string Encrypt(string decryptedData, string password) {
            string strXOR = objSagePayTransaction.simpleXor(decryptedData, password);
            string EncryptData = objSagePayTransaction.base64Encode(strXOR);

            return EncryptData;
        }

        public string Decrypt(string encryptedData, string password)
        {
            string strBase64Dec = objSagePayTransaction.base64Decode(encryptedData);
            string DecryptData = objSagePayTransaction.simpleXor(strBase64Dec, password);

            return DecryptData;
        }
    }
}
