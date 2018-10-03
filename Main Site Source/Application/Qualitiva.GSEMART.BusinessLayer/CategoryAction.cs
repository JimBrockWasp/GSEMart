using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using Qualitiva.GSEMART.DataLayer;
using Qualitiva.GSEMART.BusinessObject;

namespace Qualitiva.GSEMART.BusinessLayer
{
    public class CategoryAction
    {

        public static List<Category> GetCategory()
        {
            return CategoryLayer.GetCategory();
        }

        public static Category GetCategoryById(string CategoryId)
        {
            return CategoryLayer.GetCategoryById(CategoryId);
        }
    }
}
