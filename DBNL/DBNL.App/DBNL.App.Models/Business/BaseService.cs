using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Linq;

namespace DBNL.App.Models.Business
{
    public class BaseService
    {
        public static DBNLDataContext instance;
        public static DBNLDataContext GetInstance()
        {
            if (instance == null) instance = new DBNLDataContext();
            return instance;
        }
        public static Table<Navigation> Navigations
        {
            get{
                return GetInstance().Navigations;
            }
        }

        public static Table<Banner> Banners
        {
            get
            {
                return GetInstance().Banners;
            }
        }

        public static Table<Poll> Polls
        {
            get
            {
                return GetInstance().Polls;
            }
        }
        public static Table<PollQuestion> PollQuestions
        {
            get
            {
                return GetInstance().PollQuestions;
            }
        }

        public static Table<ContentCategory> Categories
        {
            get
            {
                return GetInstance().ContentCategories;
            }
        }

        public static Table<Content> Contents
        {
            get
            {
                return GetInstance().Contents;
            }
        }

        public static Table<Supporter> Supporters
        {
            get
            {
                return GetInstance().Supporters;
            }
        }
        public static void Commit(){
            if(instance == null) return;
            instance.SubmitChanges();
        }
    }
}
