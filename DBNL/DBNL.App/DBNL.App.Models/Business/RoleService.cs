using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBNL.App.Models.Business
{
    public class RoleService : BaseService
    {
        public static Role AddRole(Role role)
        {
            GetInstance().Roles.InsertOnSubmit(role);
            Commit();
            return role;
        }

        public static IEnumerable<Role> GetRoles()
        {
            return GetInstance().Roles.OrderBy(p=>p.RoleName).AsEnumerable();
        }
    }
}
