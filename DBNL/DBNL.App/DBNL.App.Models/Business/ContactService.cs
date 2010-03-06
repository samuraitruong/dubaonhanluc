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
            Contact contact = GetInstance().Contacts.Where(p => p.Id == id).SingleOrDefault();
            contact.Name = name.Trim();
            contact.Email = email.Trim();
            contact.Status = status.Trim();
            Commit();
            return contact;
        }

        public static void Delete(int id)
        {
            Contact contact = GetInstance().Contacts.Where(p => p.Id == id).SingleOrDefault();
            GetInstance().Contacts.DeleteOnSubmit(contact);
            Commit();
        }
    }
}
