using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBNL.App.Models.Statics;

namespace DBNL.App.Models.Business
{
    public class PollService:BaseService
    {
        public  IEnumerable<Poll> GetAllItems()
        {
            return this.Polls.AsEnumerable();
        }

        public  IQueryable<Poll> List()
        {
            return this.Polls.AsQueryable();
        }

        public  Poll GetItem(int id)
        {
            return this.Polls.Where(p => p.Id == id).SingleOrDefault();
        }

        public  Poll Add(string name, string status)
        {
            Poll poll = new Poll();
            poll.PollName = name.Trim();
            poll.Status = status.Trim();
            this.Polls.InsertOnSubmit(poll);
            Commit();
            return poll;
        }

        public  void Delete(int id)
        {
            Poll poll = GetItem(id);
            if (poll == null) return;
            PollQuestions.DeleteAllOnSubmit(poll.PollQuestions);
            Polls.DeleteOnSubmit(poll);
            Commit();
        }

        public  Poll Edit(int id, string name, string status)
        {
            Poll poll = GetItem(id);
            poll.PollName = name.Trim();
            poll.Status = status.Trim();
            Commit();
            return poll;
        }

        public  Poll GetActivePoll()
        {
            return Polls.Where(p => p.Status == EntityStatuses.Public.ToString()).FirstOrDefault();
        }

        public  void Public(int id)
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
