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
    public class EmailTemplateLayer
    {
        private static Database db = DatabaseFactory.CreateDatabase();
        /// <summary>
        /// Return email template
        /// </summary>
        /// <param name="Code"></param>
        /// <returns></returns>
        public static EmailTemplate GetEmailTemplate(string Code)
        {
            //Accessing DB Layer
            DbCommand dbCommand = db.GetStoredProcCommand("prSelEmailTemplate");
            //Adding Input parameters   
            db.AddInParameter(dbCommand, "Code", DbType.String, Code);

            EmailTemplate objEmailTemplate = new EmailTemplate();

            IDataReader dr = null;
            try
            {
                // Execute command 
                dr = db.ExecuteReader(dbCommand);

                //Set Output
                if (dr.Read())
                {
                    objEmailTemplate.Id = Convert.ToInt32(dr["Id"]);
                    objEmailTemplate.Text = dr["Text"].ToString();
                    objEmailTemplate.RespCode = 0;
                }
                else
                {
                    objEmailTemplate.RespCode = 3;
                }
            }
            catch (Exception ex)
            {
                objEmailTemplate.RespCode = 1;
                objEmailTemplate.RespDesc = ex.ToString();
            }
            finally
            {
                dr.Close();
            }
            return objEmailTemplate;
        }

    }
}
