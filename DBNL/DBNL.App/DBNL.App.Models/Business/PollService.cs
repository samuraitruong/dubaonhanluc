using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBNL.App.Models.Business
{
    public class PollService:BaseService
    {
        public static IEnumerable<Poll> GetAllItems()
        {
            return GetInstance().Polls.AsEnumerable();
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
            GetInstance().Polls.DeleteOnSubmit(poll);
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
    }
}
