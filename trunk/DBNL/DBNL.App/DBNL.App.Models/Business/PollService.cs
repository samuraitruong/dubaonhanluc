using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBNL.App.Models.Statics;

namespace DBNL.App.Models.Business
{
    public class PollService:BaseService
    {
        public static IEnumerable<Poll> GetAllItems()
        {
            return GetInstance().Polls.AsEnumerable();
        }

        public static IQueryable<Poll> List()
        {
            return GetInstance().Polls.AsQueryable();
        }

        public static Poll GetItem(int id)
        {
            return GetInstance().Polls.Where(p => p.Id == id).SingleOrDefault();
        }

        public static Poll Add(string name, string status)
        {
            Poll poll = new Poll();
            poll.PollName = name.Trim();
            poll.Status = status.Trim();
            GetInstance().Polls.InsertOnSubmit(poll);
            Commit();
            return poll;
        }

        public static void Delete(int id)
        {
            Poll poll = GetItem(id);
            if (poll == null) return;
            PollQuestions.DeleteAllOnSubmit(poll.PollQuestions);
            Polls.DeleteOnSubmit(poll);
            Commit();
        }

        public static Poll Edit(int id, string name, string status)
        {
            Poll poll = GetItem(id);
            poll.PollName = name.Trim();
            poll.Status = status.Trim();
            Commit();
            return poll;
        }

        public static Poll GetActivePoll()
        {
            return Polls.Where(p => p.Status == EntityStatuses.Public.ToString()).FirstOrDefault();
        }

        public static void Public(int id)
        {
            foreach (var item in Polls)
            {
                item.Status = EntityStatuses.Unpublic.ToString();
            }
            Commit();
            Poll poll = GetItem(id);
            poll.Status = EntityStatuses.Public.ToString();
            Commit();
        }
    }
}
