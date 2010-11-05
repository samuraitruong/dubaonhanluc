using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Security;
using System.Security.Cryptography;
using DBNL.App.Models.Statics;
using System.Linq.Expressions;

namespace DBNL.App.Models.Business
{
    public class ConfigurationService:BaseService
    {
        public string GetValue(string key)
        {
            Configuration cf = Configurations.Where(p => p.Key == key).FirstOrDefault();
            if (cf == null) return string.Empty;
            return cf.Value;
        }
        public void SetValue(string key, object value)
        {
            Configuration cf = Configurations.Where(p => p.Key == key).FirstOrDefault();
            if (cf == null)
            {
                cf = new Configuration()
                {
                    Key = key,
                    Value = value.ToString()
                };
                Configurations.InsertOnSubmit(cf);
            }
            else
            {
                cf.Value = value.ToString();
            }
            Commit();
            
        }


        public bool GetBoolean(string key)
        {
            string val = GetValue(key);
            bool result = false;
             Boolean.TryParse(val, out result);
             return result;
        }
    }
}
