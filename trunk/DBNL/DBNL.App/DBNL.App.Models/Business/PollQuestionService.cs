using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBNL.App.Models.Statics;

namespace DBNL.App.Models.Business
{
    public class PollQuestionService:BaseService
    {
        public  IEnumerable<PollQuestion> GetAllItems()
        {
            return this.PollQuestions.AsEnumerable();
        }

        public  void Response(int id, int responses)
        {
            PollQuestion q = GetItem(id);
            if (q != null)
            {
                q.Responses += responses;
                Commit();
            }
        }
        public  PollQuestion GetItem(int id)
        {
            return PollQuestions.Where(p => p.Id == id).SingleOrDefault();
        }

        public  PollQuestion Add(string question, int pollId, string status, int responses)
        {
            PollQuestion pollQuestion = new PollQuestion();
            pollQuestion.Question = question.Trim();
            pollQuestion.PollId = pollId;
            pollQuestion.Status = status.Trim();
            pollQuestion.CreatedDate = DateTime.Now;
            pollQuestion.UpdatedDate = DateTime.Now;
            pollQuestion.Responses = responses;
            this.PollQuestions.InsertOnSubmit(pollQuestion);
            Commit();
            return pollQuestion;
        }

        public  PollQuestion Add(string question, int pollId, string status)
        {
            PollQuestion pollQuestion = new PollQuestion();
            pollQuestion.Question = question.Trim();
            pollQuestion.PollId = pollId;
            pollQuestion.Status = status.Trim();
            pollQuestion.CreatedDate = DateTime.Now;
            pollQuestion.UpdatedDate = DateTime.Now;
            this.PollQuestions.InsertOnSubmit(pollQuestion);
            Commit();
            return pollQuestion;
        }

        public  void Delete(int id)
        {
            PollQuestion pollQuestion = GetItem(id);
            this.PollQuestions.DeleteOnSubmit(pollQuestion);
            Commit();
        }

        public  IQueryable<PollQuestion> List(int id)
        {
            return this.PollQuestions.Where(p => p.PollId == id).AsQueryable();
        }

        public  PollQuestion Edit(int id, string question, int pollId, string status, int responses)
        {
            PollQuestion pollQuestion = GetItem(id);
            pollQuestion.Question = question.Trim();
            pollQuestion.PollId = pollId;
            pollQuestion.Status = status.Trim();
            pollQuestion.UpdatedDate = DateTime.Now;
            pollQuestion.Responses = responses;
            Commit();
            return pollQuestion;
        }

        public  IEnumerable<PollQuestion> GetQuestionByPoll(Poll ActivePoll)
        {
            if (ActivePoll == null) return null;
            return ActivePoll.PollQuestions.Where(p => p.Status == EntityStatuses.Actived.ToString())
                .OrderBy(p=>p.Order)
                .AsEnumerable();
        }

        public PollQuestion Edit(int id, string Question, string Status, int Responses)
        {
            PollQuestion pollQuestion = GetItem(id);
            pollQuestion.Question = Question.Trim();
            pollQuestion.Responses = Responses;
            if (!string.IsNullOrEmpty(Status))
                pollQuestion.Status = Status;
            pollQuestion.UpdatedDate = DateTime.Today;
            Commit();
            return pollQuestion;
        }

        public PollQuestion Edit(int id, string Question, int PollId, string Status)
        {
            PollQuestion pollQuestion = GetItem(id);
            pollQuestion.Question = Question.Trim();
            pollQuestion.PollId = PollId;
            pollQuestion.Status = Status.Trim();
            pollQuestion.UpdatedDate = DateTime.Today;
            Commit();
            return pollQuestion;
        }

        public  void Edit(string Question, int PollId, string Status)
        {
            PollQuestion q = new PollQuestion() { 
            PollId = PollId,
            Question = Question,
            Status = Status,
            CreatedDate =DateTime.Now,
            UpdatedDate = DateTime.Now
            };

            PollQuestions.InsertOnSubmit(q);
            Commit();

        }

        public  int CountResponses(int PollId)
        {
            return PollQuestions.Where(p => p.PollId == PollId).Sum(p => p.Responses);
        }

        public void MoveUp(int id)
        {
            PollQuestion item = GetItem(id);
            var preItem = GetItems(item.PollId)
                .Where(p => p.Order < item.Order)
                .OrderByDescending(p => p.Order)
                .FirstOrDefault();

            if (preItem != null)
            {
                short temp = item.Order;
                item.Order = preItem.Order;
                preItem.Order = temp;
                Commit();
            }
        }
        public void MoveDown(int id)
        {
            PollQuestion item = GetItem(id);
            var preItem = GetItems(item.PollId)
                .Where(p => p.Order > item.Order)
                .OrderBy(p => p.Order)
                .FirstOrDefault();

            if (preItem != null)
            {
                short temp = item.Order;
                item.Order = preItem.Order;
                preItem.Order = temp;
                Commit();
            }
        }
        private IEnumerable<PollQuestion> GetItems(int pollId)
        {
            return PollQuestions.Where(p => p.PollId == pollId);
        }

        
    }
}
