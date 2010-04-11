using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBNL.App.Models
{
    public partial class User
    {
        public string GetRoles() {
            string roles = "";
            foreach (var item in this.UserInRoles)
            {
                roles += item.Role.RoleName;
            }
            return roles;
        }

    }
}
