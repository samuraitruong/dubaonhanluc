using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Security;
using System.Security.Cryptography;
using DBNL.App.Models.Statics;

namespace DBNL.App.Models.Business
{
    public class CareerService:BaseService
    {
        public  User GetValidateUser(string Username, string Password)
        {
            return Users.Where(p => p.Username == Username && p.Password == Password && p.Status == EntityStatuses.Actived.ToString()).SingleOrDefault();
        }
        public  IEnumerable<Career> GetAllItems()
        {
            return this.Careers.OrderBy(p=>p.Name);
        }

        public IQueryable<Career> List()
        {
            return this.Careers.AsQueryable();
        }
       

        public  Career GetItem(int id)
        {
            return this.Careers.Where(p => p.Id == id).SingleOrDefault();
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
            User user = this.Users.Where(p => p.Id == id).SingleOrDefault();
            if (user == null || user.IsReadOnly) return;

            var allUserAssigned = UserInRoles.Where(role => role.UserId == id);

            UserInRoles.DeleteAllOnSubmit(allUserAssigned.AsEnumerable());
            Commit();

            this.Users.DeleteOnSubmit(user);
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
            Career   acc = GetItem(id);
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


        public void Edit(int p, string Name, string Status)
        {
            Career item = GetItem(p);
            item.Name = Name;
            item.Status = Status;
            Commit();
        }
        public void Add( string Name, string Status)
        {
            Career item = new Career()
            {
                Status = Status,
                Name = Name,
            };
            Careers.InsertOnSubmit(item);
            Commit();
        }
    }
}
