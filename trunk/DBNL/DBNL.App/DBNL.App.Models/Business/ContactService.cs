using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBNL.App.Models.Business
{
    public class ContactService:BaseService
    {
        public static IEnumerable<Contact> GetAllItems()
        {
            return GetInstance().Contacts.AsEnumerable();
        }

        public static Contact GetItem(int id)
        {
            return GetInstance().Contacts.Where(p => p.Id == id).SingleOrDefault();
        }

        public static IQueryable<Contact> List()
        {
            return GetInstance().Contacts.AsQueryable();
        }

        public static Contact Add(string name, string email, string status)
        {
            Contact contact = new Contact();
            contact.Name = name.Trim();
            contact.Email = email.Trim();
            contact.Status = status.Trim();
            GetInstance().Contacts.InsertOnSubmit(contact);
            Commit();
            return contact;
        }

        public static Contact Edit(int id, string name, string email, string status)
        {
            Contact contact = GetItem(id);
            contact.Name = name.Trim();
            contact.Email = email.Trim();
            contact.Status = status.Trim();
            Commit();
            return contact;
        }

        public static void Delete(int id)
        {
            Contact contact = GetItem(id);
            GetInstance().Contacts.DeleteOnSubmit(contact);
            Commit();
        }
    }
}
