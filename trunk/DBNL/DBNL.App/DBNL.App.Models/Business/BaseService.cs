using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq;

namespace DBNL.App.Models.Business
{
    public class BaseService
    {
         Object locker = new Object();
        private DBNLDataContext instance;

        public BaseService()
        {
            instance = new DBNLDataContext();
        }
        
        public  Table<UserInRole> UserInRoles
        {
            get{
                return  instance.UserInRoles;
            }
        }
        public Table<Configuration> Configurations
        {
            get
            {
                return instance.Configurations;
            }
        }
        public Table<Career> Careers
        {
            get
            {
                return instance.Careers;
            }
        }
        public Table<Account> Accounts
        {
            get
            {
                return instance.Accounts;
            }
        }
        public Table<Department> Departments
        {
            get
            {
                return instance.Departments;
            }
        }

        public  Table<Navigation> Navigations
        {
            get{
                return   instance.Navigations;
            }
        }

        public  Table<Job> Jobs
        {
            get
            {
                return   instance.Jobs;
            }
        }
        public  Table<User> Users
        {
            get
            {
                return   instance.Users;
            }
        }

        public  Table<Role> Roles
        {
            get
            {
                return   instance.Roles;
            }
        }

        public  Table<Banner> Banners
        {
            get
            {
                return   instance.Banners;
            }
        }
        public Table<Link> Links
        {
            get
            {
                return instance.Links;
            }
        }
        public Table<Contact> Contacts
        {
            get
            {
                return instance.Contacts;
            }
        }
        public  Table<Poll> Polls
        {
            get
            {
                return   instance.Polls;
            }
        }
        public  Table<PollQuestion> PollQuestions
        {
            get
            {
                return   instance.PollQuestions;
            }
        }

        public  Table<ContentCategory> Categories
        {
            get
            {
                return   instance.ContentCategories;
            }
        }
       
        public  Table<Content> Contents
        {
            get
            {
                return   instance.Contents;
            }
        }

        public  Table<Supporter> Supporters
        {
            get
            {
                return   instance.Supporters;
            }
        }
        public  void Commit(){
            if(instance == null) return;
            instance.SubmitChanges();
        }

       
    }
}
