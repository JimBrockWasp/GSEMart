using System;
using System.Collections.Generic;
using System.Text;
using Qualitiva.GSEMART.BusinessObject;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Data;
using System.Transactions;

namespace Qualitiva.GSEMART.DataLayer
{
    public class DiscountLayer
    {
        private static Database db = DatabaseFactory.CreateDatabase();

        public static List<AccountDiscountTimeBased> SetAccountDiscountTimeBased(int AccountId, List<AccountDiscountTimeBased> lstAccountDiscountTimeBased)
        {
            try{
                using (TransactionScope ts = new TransactionScope())
                {
                    DbCommand dbCommand = db.GetStoredProcCommand("prDeleteAccountDiscountTimeBasedByAccountId");

                    db.AddInParameter(dbCommand, "AccountId", DbType.Int32, AccountId);
                    db.ExecuteNonQuery(dbCommand);

                    foreach (AccountDiscountTimeBased objAccountDiscountTimeBased in lstAccountDiscountTimeBased)
                    {
                        //Accessing DB Layer
                        dbCommand = db.GetStoredProcCommand("prInsAccountDiscountTimeBased");

                        //Adding Input parameters            
                        db.AddInParameter(dbCommand, "AccountId", DbType.Int32, objAccountDiscountTimeBased.AccountId);
                        db.AddInParameter(dbCommand, "FromDate", DbType.DateTime, objAccountDiscountTimeBased.FromDate);
                        db.AddInParameter(dbCommand, "ToDate", DbType.DateTime, objAccountDiscountTimeBased.ToDate);
                        db.AddInParameter(dbCommand, "DiscountRate", DbType.Int32, objAccountDiscountTimeBased.DiscountRate);
                        db.AddInParameter(dbCommand, "LastUpdate", DbType.DateTime, objAccountDiscountTimeBased.LastUpdate);
                        db.AddInParameter(dbCommand, "CreateDate", DbType.DateTime, objAccountDiscountTimeBased.CreateDate);

                        //Adding Output parameters
                        db.AddOutParameter(dbCommand, "AccountDiscountTimeBasedID", DbType.String, 25);
                        db.AddOutParameter(dbCommand, "RespCode", DbType.Int32, 100);
                        db.AddOutParameter(dbCommand, "RespMsg", DbType.String, 500);

                        // Execute
                        db.ExecuteNonQuery(dbCommand);
                        //Set Output for AddAccount
                        objAccountDiscountTimeBased.AccountDiscountTimeBasedId = Convert.ToInt32(db.GetParameterValue(dbCommand, "AccountDiscountTimeBasedID"));
                        objAccountDiscountTimeBased.RespCode = Convert.ToInt32(db.GetParameterValue(dbCommand, "RespCode"));
                        objAccountDiscountTimeBased.RespDesc = db.GetParameterValue(dbCommand, "RespMsg").ToString();
                    }
                    ts.Complete();
                }
            }catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }

            return lstAccountDiscountTimeBased;
        }

        public static List<AccountDiscountTimeBased> GetAccountDiscountTimeBasedByAccountId(int AccountId) {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelAccountDiscountTimeBasedByAccountId");

            //Adding Input parameters            
            db.AddInParameter(dbCommand, "AccountId", DbType.Int32, AccountId);

            List<AccountDiscountTimeBased> lstAccountDiscountTimeBased = new List<AccountDiscountTimeBased>();
            IDataReader dr = null;
            try
            {
                // Execute command 
                dr = db.ExecuteReader(dbCommand);

                //Set Output
                while (dr.Read())
                {
                    AccountDiscountTimeBased objAccountDiscountTimeBased = new AccountDiscountTimeBased();
                    objAccountDiscountTimeBased.AccountDiscountTimeBasedId = Convert.ToInt32(dr["AccountDiscountTimeBasedID"]);
                    objAccountDiscountTimeBased.AccountId = Convert.ToInt32(dr["AccountID"]);
                    objAccountDiscountTimeBased.FromDate = Convert.ToDateTime(dr["FromDate"]);
                    objAccountDiscountTimeBased.ToDate = Convert.ToDateTime(dr["ToDate"]);
                    objAccountDiscountTimeBased.DiscountRate = Convert.ToInt32(dr["DiscountRate"]);
                    objAccountDiscountTimeBased.LastUpdate = Convert.ToDateTime(dr["LastUpdate"]);
                    objAccountDiscountTimeBased.CreateDate = Convert.ToDateTime(dr["CreateDate"]);

                    lstAccountDiscountTimeBased.Add(objAccountDiscountTimeBased);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally
            {
                dr.Close();
            }
            
            return lstAccountDiscountTimeBased;
        }

        public static List<DiscountRate> GetDiscountRate() {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelDiscountRate");

            List<DiscountRate> lstDiscountRate = new List<DiscountRate>();
            IDataReader dr = null;
            try
            {
                // Execute command 
                dr = db.ExecuteReader(dbCommand);

                //Set Output
                while (dr.Read())
                {
                    DiscountRate objDiscountRate = new DiscountRate();
                    objDiscountRate.DiscountRateId = Convert.ToInt32(dr["DiscountRateId"]);
                    objDiscountRate.DiscountRateValue = Convert.ToInt32(dr["DiscountRate"]);
                    objDiscountRate.LastUpdate = Convert.ToDateTime(dr["LastUpdate"]);
                    objDiscountRate.CreateDate = Convert.ToDateTime(dr["CreateDate"]);

                    lstDiscountRate.Add(objDiscountRate);
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally
            {
                dr.Close();
            }

            return lstDiscountRate;
        }

        public static int GetDiscountRateByDiscountRateId(int DiscountRateId)
        {
            int DiscountRate = 0;

            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelDiscountRateByDiscountRateId");

            db.AddInParameter(dbCommand, "DiscountRateId", DbType.Int32, DiscountRateId);

            db.AddOutParameter(dbCommand, "DiscountRate", DbType.Int32, 25);

            try
            {
                // Execute
                db.ExecuteNonQuery(dbCommand);

                //Set Output for AddAdvert
                DiscountRate = Convert.ToInt32(db.GetParameterValue(dbCommand, "DiscountRate"));
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            return DiscountRate;
        }

        public static List<DiscountRate> SetDiscountRate(List<DiscountRate> lstDiscountRate)
        {
            try{
                using (TransactionScope ts = new TransactionScope())
                {
                    foreach (DiscountRate objDiscountRate in lstDiscountRate)
                    {
                        //Accessing DB Layer
                        DbCommand dbCommand = db.GetStoredProcCommand("prUpdDiscountRate");

                        //Adding Input parameters
                        db.AddInParameter(dbCommand, "DiscountRateId", DbType.Int32, objDiscountRate.DiscountRateId);
                        db.AddInParameter(dbCommand, "DiscountRate", DbType.Int32, objDiscountRate.DiscountRateValue);

                        //Adding Output parameters
                        db.AddOutParameter(dbCommand, "RespCode", DbType.Int32, 100);
                        db.AddOutParameter(dbCommand, "RespMsg", DbType.String, 500);

                        // Execute
                        db.ExecuteNonQuery(dbCommand);

                        //Set Output for AddAccount
                        objDiscountRate.RespCode = Convert.ToInt32(db.GetParameterValue(dbCommand, "RespCode"));
                        objDiscountRate.RespDesc = db.GetParameterValue(dbCommand, "RespMsg").ToString();
                    }
                    ts.Complete();
                }
            }catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }

            return lstDiscountRate;
        }
    }
}
