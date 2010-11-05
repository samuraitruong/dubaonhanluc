using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;

/// <summary>
/// Summary description for Parameters
/// </summary>
/// 
namespace DBNL.App.Models.Business.Emailing
{
    public class Parameters : Hashtable
    {
        public void AddParameter(string s, object b)
        {
            base.Add(s, b);
        }
    }
}