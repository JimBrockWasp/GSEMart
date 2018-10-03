using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Data;
using Microsoft.Practices.EnterpriseLibrary.Data.Sql;
using System.Data;
using System.Data.Common;
using System.Configuration;
using Qualitiva.GSEMART.BusinessObject;

namespace Qualitiva.GSEMART.DataLayer
{
    public class SpecLayer
    {
        private static Database db = DatabaseFactory.CreateDatabase();

        public static List<Spec> GetSpecs(int GSETypeId)
        {
            List<Spec> lstSpec = new List<Spec>();

            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelSpecsByGSETypeId");
            db.AddInParameter(dbCommand, "GSETypeID", DbType.String, GSETypeId);

            IDataReader dr = null;

            try
            {
                // Execute command
                dr = db.ExecuteReader(dbCommand);

                //Set Output  and add to the list 
                while (dr.Read())
                {
                    Spec objSpec= new Spec();
                    objSpec.SpecId = dr["SpecificationId"].ToString();
                    objSpec.Description = dr["Description"].ToString();
                    objSpec.GSETypeId = Convert.ToInt32(dr["GSETypeId"]);
                    lstSpec.Add(objSpec);
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
            return lstSpec;

        }

        public static List<SpecOption> GetSpecOptions(int GSETypeId, string SpecId)
        {
            List<SpecOption> lstSpecOptions = new List<SpecOption>();

            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelSpecOptions");
            db.AddInParameter(dbCommand, "GSETypeID", DbType.String, GSETypeId);
            db.AddInParameter(dbCommand, "SpecID", DbType.String, SpecId);

            IDataReader dr = null;

            try
            {
                // Execute command
                dr = db.ExecuteReader(dbCommand);

                //Set Output  and add to the list 
                while (dr.Read())
                {
                    SpecOption objSpecOption = new SpecOption();
                    objSpecOption.SpecId = dr["SpecificationId"].ToString();
                    objSpecOption.SpecOptionId = dr["SpecificationOptionId"].ToString();
                    objSpecOption.Description = dr["Description"].ToString();
                    lstSpecOptions.Add(objSpecOption);
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
            return lstSpecOptions;

        }

    }
}
