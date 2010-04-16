using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using DBNL.App.Models.Statics;

namespace DBNL.App.Models
{
    public class Profile
    {
        public int Id { get; set; }
        public Role Role { get; set; }
        public string Name { get; set; }
        public User User { get; set; }

        public bool HasPermission(SiteModules modules)
        {
            if (Role == null) return false;

            if (Role.IsFullPermission) return true;

            if (modules == SiteModules.Supportter && Role.AllowManageOnlineSupporter)
                return true;

            if (modules == SiteModules.Contact && Role.AllowManageContact)
                return true;

            if (modules == SiteModules.Poll && Role.AllowManagePoll)
                return true;

            if (modules == SiteModules.User && Role.AllowManageUser)
                return true;

             if (modules == SiteModules.WebLink && Role.AllowManageLink)
                return true;

             if (modules == SiteModules.MenuNavigation && Role.AllowManageMenu)
                 return true;
             if (modules == SiteModules.Banner && Role.AllowManageBanner)
                 return true;
          
            return false;
        }
        public virtual  bool IsAuthenticated { 
          get
                {
                    return HttpContext.Current.User.Identity.IsAuthenticated;
                }
        }
        public class Anonymos : Profile {
            public Anonymos() {
                Id = 0;
                User = null;
                Name = "Anonymos";
                
            }
            public override bool IsAuthenticated
            {
                get
                {
                    return false;
                }
                
            }
        }

        


    }
}