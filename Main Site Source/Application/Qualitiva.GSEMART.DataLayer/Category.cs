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
    public class CategoryLayer
    {
        private static Database db = DatabaseFactory.CreateDatabase();

        public static List<Category> GetCategory()
        {
            List<Category> lstCategory = new List<Category>();

            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelCategory");

            IDataReader dr = null;

            try
            {
                // Execute command
                dr = db.ExecuteReader(dbCommand);

                //Set Output  and add to the list 
                while (dr.Read())
                {
                    Category objCategory = new Category();
                    objCategory.CategoryId = dr["CategoryId"].ToString();
                    objCategory.Description = dr["Description"].ToString();
                    lstCategory.Add(objCategory);
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
            return lstCategory;

        }


        public static Category GetCategoryById(string CategoryId)
        {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelCategoryById");

            //Adding Input parameters    
            db.AddInParameter(dbCommand, "CategoryId", DbType.AnsiString, CategoryId);

            IDataReader dr = null;
            Category objCategory = new Category();
            try
            {
                // Execute command
                dr = db.ExecuteReader(dbCommand);

                //Set Output
                while (dr.Read())
                {

                    objCategory.CategoryId = dr["CategoryId"].ToString();
                    objCategory.Description = dr["Description"].ToString();
                }

            }
            catch (Exception ex)
            {
                objCategory.RespCode = 1;
                objCategory.RespDesc = ex.ToString();
            }
            finally
            {
                dr.Close();
            }
            return objCategory;
        }
    }
}
