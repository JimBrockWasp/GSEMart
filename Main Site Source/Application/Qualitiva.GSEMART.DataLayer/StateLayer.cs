using System;
using System.Collections.Generic;
using System.Text;
using Qualitiva.GSEMART.BusinessObject;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Data;

namespace Qualitiva.GSEMART.DataLayer
{
    public class StateLayer
    {
        private static Database db = DatabaseFactory.CreateDatabase();

        public static List<State> GetState()
        {
            List<State> lstState = new List<State>();

            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelState");

            IDataReader dr = null;

            try
            {
                // Execute command
                dr = db.ExecuteReader(dbCommand);

                //Set Output  and add to the list 
                while (dr.Read())
                {
                    State objState = new State();
                    objState.StateId = dr["StateId"].ToString();
                    objState.StateName = dr["StateName"].ToString();
                    lstState.Add(objState);
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
            return lstState;

        }
    }
}
