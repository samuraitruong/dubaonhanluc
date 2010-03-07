using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBNL.App.Models.Business
{
    public class PollQuestionService:BaseService
    {
        public static IEnumerable<PollQuestion> GetAllItems()
        {
            return GetInstance().PollQuestions.AsEnumerable();
        }

        public static void Response(int id, int responses)
        {
            PollQuestion q = GetItem(id);
            if (q != null)
            {
                q.Responses += responses;
                Commit();
            }
        }
        public static PollQuestion GetItem(int id)
        {
            return GetInstance().PollQuestions.Where(p => p.Id == id).SingleOrDefault();
        }

        public static PollQuestion Add(string question, int pollId, string status, int responses)
        {
            PollQuestion pollQuestion = new PollQuestion();
            pollQuestion.Question = question.Trim();
            pollQuestion.PollId = pollId;
            pollQuestion.Status = status.Trim();
            pollQuestion.CreatedDate = DateTime.Today;
            pollQuestion.UpdatedDate = DateTime.Today;
            pollQuestion.Responses = responses;
            GetInstance().PollQuestions.InsertOnSubmit(pollQuestion);
            Commit();
            return pollQuestion;
        }

        public static void Delete(int id)
        {
            PollQuestion pollQuestion = GetItem(id);
            GetInstance().PollQuestions.DeleteOnSubmit(pollQuestion);
            Commit();
        }

        public static PollQuestion Edit(int id, string question, int pollId, string status, int responses)
        {
            PollQuestion pollQuestion = GetItem(id);
            pollQuestion.Question = question.Trim();
            pollQuestion.PollId = pollId;
            pollQuestion.Status = status.Trim();
            pollQuestion.UpdatedDate = DateTime.Today;
            pollQuestion.Responses = responses;
            Commit();
            return pollQuestion;
        }

        internal static IEnumerable<PollQuestion> GetQuestionByPoll(Poll ActivePoll)
        {
            if (ActivePoll == null) return null;
            return ActivePoll.PollQuestions.Where(p => p.Status == DBNL.App.Models.Statics.EntityStatuses.Actived.ToString()).AsEnumerable();
        }
    }
}
