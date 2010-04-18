using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Security;
using System.Security.Cryptography;
using DBNL.App.Models.Statics;

namespace DBNL.App.Models.Business
{
    public class UserService:BaseService
    {
        public static User GetValidateUser(string Username, string Password)
        {
            return Users.Where(p => p.Username == Username && p.Password == Password && p.Status == EntityStatuses.Actived.ToString()).SingleOrDefault();
        }
        public static IEnumerable<User> GetAllItems()
        {
            return GetInstance().Users.AsEnumerable();
        }

        public static IQueryable<User> List()
        {
            return GetInstance().Users.AsQueryable();
        }
        public static IQueryable<User> List(int roleId)
        {

            var query = from p in Users
                        join p1 in UserInRoles
                        on p.Id equals p1.UserId
                        where p1.RoleId == roleId
                        select p;
            return query;
        }

        public static User GetItem(int id)
        {
            return GetInstance().Users.Where(p => p.Id == id).SingleOrDefault();
        }

        public static User Add(string username, string name, string password, string status)
        {
            User user = new User();
            user.Username = username.Trim();
            user.Name = name.Trim();
            user.Password = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");
            user.Status = status.Trim();
            user.CreatedDate = DateTime.Today;
            user.UpdatedDate = DateTime.Today;
            GetInstance().Users.InsertOnSubmit(user);
            Commit();
            return user;
        }

        public static User Edit(int id, string username, string name, string password, string status)
        {
            User user = GetInstance().Users.Where(p => p.Id == id).SingleOrDefault();
            user.Username = username.Trim();
            user.Name = name.Trim();
            user.Password = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");
            user.Status = status.Trim();
            user.UpdatedDate = DateTime.Today;
            Commit();
            return user;
        }

        public static void Delete(int id)
        {
            User user = GetInstance().Users.Where(p => p.Id == id).SingleOrDefault();
            GetInstance().Users.DeleteOnSubmit(user);
            Commit();
        }

        public static void Add(User user, List<int> Roles)
        {
            GetInstance().Users.InsertOnSubmit(user);
            
            Commit();
            foreach (int i in Roles)
            {
                GetInstance().UserInRoles.InsertOnSubmit(new UserInRole() {
                    RoleId = i,
                    UserId = user.Id
                });
            }
            Commit();
        }

        public static void Active(int id)
        {
            User   user = GetItem(id);
            if (user.Status == EntityStatuses.Actived.ToString())
            {
                user.Status = EntityStatuses.Inactive.ToString();
            }
            else
            {
                user.Status = EntityStatuses.Actived.ToString();
            }
            Commit();
        }

        public static User GetItem(int? id)
        {
            return GetItem(id.Value);
        }

        public static void UpdateUser(User user)
        {
            try
            {
                User storeUser = GetItem(user.Id);
                storeUser.Name = user.Name;
                storeUser.Username = user.Username;
                storeUser.Password = string.IsNullOrEmpty(user.Password) ? storeUser.Password : user.Password;
                storeUser.UpdatedDate = DateTime.Now;

                UserInRoles.DeleteAllOnSubmit(UserInRoles.Where(u => u.UserId == user.Id).ToList());
                Commit();

                //Users.Attach(storeUser, user);
                foreach (var item in user.UserInRoles)
                {
                    UserInRoles.InsertOnSubmit(new UserInRole() { UserId = user.Id,
                    RoleId = item.RoleId});
                }
                //UserInRoles.InsertAllOnSubmit(user.UserInRoles);
                Commit();

                
            }
            catch (Exception ex)
            {
                throw ex;
            }
            
            Commit();

            //UserInRoles.DeleteAllOnSubmit(storeUser.UserInRoles);
           // Commit();
            
        }
    }
}
