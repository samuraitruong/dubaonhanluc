﻿using System;
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
            pollQuestion.CreatedDate = DateTime.Now;
            pollQuestion.UpdatedDate = DateTime.Now;
            pollQuestion.Responses = responses;
            GetInstance().PollQuestions.InsertOnSubmit(pollQuestion);
            Commit();
            return pollQuestion;
        }

        public static PollQuestion Add(string question, int pollId, string status)
        {
            PollQuestion pollQuestion = new PollQuestion();
            pollQuestion.Question = question.Trim();
            pollQuestion.PollId = pollId;
            pollQuestion.Status = status.Trim();
            pollQuestion.CreatedDate = DateTime.Now;
            pollQuestion.UpdatedDate = DateTime.Now;
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

        public static IQueryable<PollQuestion> List(int id)
        {
            return GetInstance().PollQuestions.Where(p => p.PollId == id).AsQueryable();
        }

        public static PollQuestion Edit(int id, string question, int pollId, string status, int responses)
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

        public static IEnumerable<PollQuestion> GetQuestionByPoll(Poll ActivePoll)
        {
            if (ActivePoll == null) return null;
            return ActivePoll.PollQuestions.Where(p => p.Status == DBNL.App.Models.Statics.EntityStatuses.Actived.ToString())
                .OrderByDescending(p=>p.Responses)
                .AsEnumerable();
        }

        public static PollQuestion Edit(int id, string Question, string Status)
        {
            PollQuestion pollQuestion = GetItem(id);
            pollQuestion.Question = Question.Trim();
            if (!string.IsNullOrEmpty(Status))
                pollQuestion.Status = Status;
            pollQuestion.UpdatedDate = DateTime.Today;
            Commit();
            return pollQuestion;
        }

        public static PollQuestion Edit(int id, string Question, int PollId, string Status)
        {
            PollQuestion pollQuestion = GetItem(id);
            pollQuestion.Question = Question.Trim();
            pollQuestion.PollId = PollId;
            pollQuestion.Status = Status.Trim();
            pollQuestion.UpdatedDate = DateTime.Today;
            Commit();
            return pollQuestion;
        }

        public static void Edit(string Question, int PollId, string Status)
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

        public static int CountResponses(int PollId)
        {
            return PollQuestions.Where(p => p.PollId == PollId).Sum(p => p.Responses);
        }
    }
}
