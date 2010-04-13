using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Security;
using System.Security.Cryptography;

namespace DBNL.App.Models.Business
{
    public class UserService:BaseService
    {
        public static User GetValidateUser(string Username, string Password)
        {
            return Users.Where(p => p.Username == Username && p.Password == Password).SingleOrDefault();
        }
        public static IEnumerable<User> GetAllItems()
        {
            return GetInstance().Users.AsEnumerable();
        }

        public static IQueryable<User> List()
        {
            return GetInstance().Users.AsQueryable();
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
    }
}
