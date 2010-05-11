using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBNL.App.Models.Business
{
    public class ContactService:BaseService
    {
        public  IEnumerable<Contact> GetAllItems()
        {
            return this.Contacts.AsEnumerable();
        }

        public  Contact GetItem(int id)
        {
            return this.Contacts.Where(p => p.Id == id).SingleOrDefault();
        }

        public  IQueryable<Contact> List()
        {
            return this.Contacts.AsQueryable();
        }

        public  Contact Add(string name, string email, string status)
        {
            Contact contact = new Contact();
            contact.Name = name.Trim();
            contact.Email = email.Trim();
            contact.Status = status.Trim();
            this.Contacts.InsertOnSubmit(contact);
            Commit();
            return contact;
        }

        public  Contact Edit(int id, string name, string email, string status)
        {
            Contact contact = GetItem(id);
            contact.Name = name.Trim();
            contact.Email = email.Trim();
            contact.Status = status.Trim();
            Commit();
            return contact;
        }

        public  void Delete(int id)
        {
            Contact contact = GetItem(id);
            this.Contacts.DeleteOnSubmit(contact);
            Commit();
        }
    }
}
