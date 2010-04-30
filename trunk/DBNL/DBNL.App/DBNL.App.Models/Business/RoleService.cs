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

        public static IQueryable<Role> List()
        {
            return RoleService.Roles.OrderBy(p=>p.RoleName).AsQueryable();
        }

        public static void Delete(int id)
        {
            var item = GetItem(id);
            if (item == null || item.IsReadOnly) return;
            
            var allUserAssigned = UserInRoles.Where(role => role.RoleId == id);

            UserInRoles.DeleteAllOnSubmit(allUserAssigned.AsEnumerable());
            Commit();
            Roles.DeleteOnSubmit(item);
            Commit();
        }

        private static Role GetItem(int id)
        {
            return Roles.Where(p => p.Id == id).SingleOrDefault();
        }
    }
}
