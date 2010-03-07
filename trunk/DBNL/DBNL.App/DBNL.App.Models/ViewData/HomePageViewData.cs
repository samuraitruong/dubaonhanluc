using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBNL.App.Models.Business;

namespace DBNL.App.Models.ViewData
{
    public class HomePageViewData
    {
        public PublicPollViewData PublicPoll { get; set; }
        public HomePageViewData()
        {
            PublicPoll = new PublicPollViewData();
        }
    }
    public class PublicPollViewData
    {
        public Poll ActivePoll { get; set; }
        public IEnumerable<PollQuestion> Questions { get; set; }
        public PublicPollViewData()
        {
            ActivePoll = PollService.GetActivePoll();
            Questions = PollQuestionService.GetQuestionByPoll(ActivePoll);
        }
        public PublicPollViewData(int id)
        {
            ActivePoll = PollService.GetItem(id);
            Questions = PollQuestionService.GetQuestionByPoll(ActivePoll);
        }
    }


}
