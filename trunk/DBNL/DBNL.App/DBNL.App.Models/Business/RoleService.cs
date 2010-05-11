using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBNL.App.Models.Business
{
    public class RoleService : BaseService
    {
        public  Role AddRole(Role role)
        {
            this.Roles.InsertOnSubmit(role);
            Commit();
            return role;
        }

        public  IEnumerable<Role> GetRoles()
        {
            return this.Roles.OrderBy(p=>p.RoleName).AsEnumerable();
        }

        public  IQueryable<Role> List()
        {
            return Roles.OrderBy(p=>p.RoleName).AsQueryable();
        }

        public  void Delete(int id)
        {
            var item = GetItem(id);
            if (item == null || item.IsReadOnly) return;
            
            var allUserAssigned = UserInRoles.Where(role => role.RoleId == id);

            UserInRoles.DeleteAllOnSubmit(allUserAssigned.AsEnumerable());
            Commit();
            Roles.DeleteOnSubmit(item);
            Commit();
        }

        private  Role GetItem(int id)
        {
            return Roles.Where(p => p.Id == id).SingleOrDefault();
        }
    }
}
