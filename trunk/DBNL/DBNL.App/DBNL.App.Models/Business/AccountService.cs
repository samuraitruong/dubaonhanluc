using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Security;
using System.Security.Cryptography;
using DBNL.App.Models.Statics;
using System.Linq.Expressions;

namespace DBNL.App.Models.Business
{
    public class AccountService:BaseService
    {
        public  User GetValidateUser(string Username, string Password)
        {
            return Users.Where(p => p.Username == Username && p.Password == Password && p.Status == EntityStatuses.Actived.ToString()).SingleOrDefault();
        }
        public  IEnumerable<Account> GetAllItems()
        {
            return this.Accounts.AsEnumerable();
        }

        public  IQueryable<Account> List()
        {
            return this.Accounts.AsQueryable();
        }

        public Account GetItem(Expression<Func<Account, bool>> predicate)
        {
            return this.Accounts.Where(predicate).FirstOrDefault();
        }
        public  Account GetItem(int id)
        {
            return this.Accounts.Where(p => p.Id == id).SingleOrDefault();
        }

        public bool Register(Account account)
        {
            account.CreatedDate = DateTime.Now;
            account.UpdatedDate = DateTime.Now;
            account.Status = EntityStatuses.Actived.ToString();
            AccountService service = new AccountService();
            try
            {

                Accounts.InsertOnSubmit(account);
                Commit();
                return account.Id>0;
            }
            catch (Exception ex)
            {
                throw;
                return false;
            }
        }

        public  User Edit(int id, string username, string name, string password, string status)
        {
            User user = this.Users.Where(p => p.Id == id).SingleOrDefault();
            user.Username = username.Trim();
            user.Name = name.Trim();
            user.Password = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");
            user.Status = status.Trim();
            user.UpdatedDate = DateTime.Today;
            Commit();
            return user;
        }

        public  void Delete(int id)
        {
            Account user = this.Accounts.Where(p => p.Id == id).SingleOrDefault();
            if (user == null ) return;

            Accounts.DeleteOnSubmit(user);
            Commit();

        }

        public  void Add(User user, List<int> Roles)
        {
            this.Users.InsertOnSubmit(user);
            
            Commit();
            foreach (int i in Roles)
            {
                this.UserInRoles.InsertOnSubmit(new UserInRole() {
                    RoleId = i,
                    UserId = user.Id
                });
            }
            Commit();
        }

        public  void Active(int id)
        {
            Account   acc = GetItem(id);
            if (acc.Status == EntityStatuses.Actived.ToString())
            {
                acc.Status = EntityStatuses.Inactive.ToString();
            }
            else
            {
                acc.Status = EntityStatuses.Actived.ToString();
            }
            Commit();
        }


        public void Public(int id)
        {
            
        }

        public Account Authenticate(string Login, string password)
        {
            var acc = Accounts.Where(p => p.Login == Login && p.Password == password).FirstOrDefault();
            return acc;
        }
    }
}
