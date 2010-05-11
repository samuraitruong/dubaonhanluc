using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DBNL.App.Models.Business;

namespace DBNL.App.Models
{
    public class PollManager : IDisposable
    {
        public PollManager()
        {
            CheckForValidRequest();
        }
        private  bool canMakePoll;

        public  void DoPoll(int id) {
            if (!CanMakePoll) return;

            new PollQuestionService().Response(id, 1);
            SessionManager.SecurityPollData = new UserClientInfo()
            {
                UserHostAddress = HttpContext.Current.Request.UserHostAddress,

                UserHostName = HttpContext.Current.Request.UserHostName
            };
   
        }
        private  void CheckForValidRequest()
        {
            UserClientInfo info = SessionManager.SecurityPollData;
            canMakePoll = (info ==null);
        }
        public  bool CanMakePoll { get {return canMakePoll;}}

        public void Dispose()
        {
            
        }
    }
}