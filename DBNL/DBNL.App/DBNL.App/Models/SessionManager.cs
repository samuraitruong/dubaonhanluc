using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace DBNL.App.Models
{
    public class SessionManager
    {
        
        public static Profile Profile
        {
            get
            {
                HttpSessionState session = HttpContext.Current.Session;
                Profile profile = new Profile.Anonymos();

                if (session["WebProfile"] != null)
                {
                    return (Profile)session["WebProfile"];
                }
                session["WebProfile"] = profile;
                return profile;

            }
            set
            {
                HttpSessionState session = HttpContext.Current.Session;
                Profile profile = (Profile)value;
                session["WebProfile"] = profile;
            }

        }
    }
}