using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Globalization;

namespace DBNL.App.Models
{
    public class SessionManager
    {
        public static CultureInfo CurentCulture
        {
            get
            {
                HttpSessionState session = HttpContext.Current.Session;
                CultureInfo ci = (CultureInfo)session["Culture"];
                if (ci == null)
                {

                    //Sets default culture to english invariant

                    string langName = "vi";
                    if (HttpContext.Current.Request.UserLanguages != null && HttpContext.Current.Request.UserLanguages.Length != 0)
                    {
                        //langName = HttpContext.Current.Request.UserLanguages[0].Substring(0, 2);
                    }
                    ci = new CultureInfo(langName);
                    session["Culture"] = ci;
                }
                return ci;
            }
            set
            {
                HttpSessionState session = HttpContext.Current.Session;
                session ["Culture"]= value;
            }
        }
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
        public static UserClientInfo SecurityPollData {
            get
            {
                HttpSessionState session = HttpContext.Current.Session;
                Profile profile = new Profile.Anonymos();

                if (session["SecurityPollData"] != null)
                {
                    return (UserClientInfo)session["SecurityPollData"];
                }
                return null;

            }
            set
            {
                HttpSessionState session = HttpContext.Current.Session;

                session["SecurityPollData"] = value;
            }
        }

        public static DateTime TimeStamp { set {
            HttpSessionState session = HttpContext.Current.Session;
            session["TimeStamp"] = value;
        } }

        public static Account Account
        {
            get
            {
                HttpSessionState session = HttpContext.Current.Session;

                if (session["Account"] != null)
                {
                    return (Account)session["Account"];
                }
                return null;

            }
            set
            {
                HttpSessionState session = HttpContext.Current.Session;
                session["Account"] = value;
            }

        }
    }
}