using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBNL.App.Models.Business;
using DBNL.App.Config;

namespace DBNL.App.Models.ViewData
{
    public class HomePageViewData
    {
        public PublicPollViewData PublicPoll { get; set; }
        public FeatureCategoryViewData FeaturedCategory { get; set; }
        public IEnumerable<ContentCategory> CategoriesOnHP { get; set; }
        public IEnumerable<Job> JobsList { get; set; }
        public HomePageViewData()
        {
            PublicPoll = new PublicPollViewData();
            FeaturedCategory = new FeatureCategoryViewData();
            CategoriesOnHP = CategoryService.GetCategoriesShowOnHPEx();
            JobsList = new JobService().GetNewestJob(DBNLConfigurationManager.WebUI.JobDisplayOnHP);


        }
    }
    public class FeatureCategoryViewData{

        public ContentCategory Category { get; set; }
        public IEnumerable<Content> Articles { get; set; }
        public IEnumerable<Content>  HostestArticle { get; set; }
        public FeatureCategoryViewData()
        {
            var query = (new CategoryService()).GetForcusingContents(DBNLConfigurationManager.WebUI.HotestNewsCount + DBNLConfigurationManager.WebUI.OtherFeaturesNews);

            HostestArticle = query.Skip(0).Take(DBNLConfigurationManager.WebUI.HotestNewsCount).AsEnumerable();

            Articles = (new ContentService()).Contents
                .Where(p => p.IsFeatured == true)
                .Where(p => p.CategoryId ==  47||  p.CategoryId == 41 || p.CategoryId == 42 || p.CategoryId == 51 || p.CategoryId == 46)
                //.Where(p => p.ContentId != HostestArticle.ToArray()[0].ContentId && p.ContentId != HostestArticle.ToArray()[1].ContentId)
                .OrderByDescending(p => p.CreatedDate)
                .Skip(0)
                .Take(DBNLConfigurationManager.WebUI.OtherFeaturesNews)
                .AsEnumerable();
                
                //query.Skip(DBNLConfigurationManager.WebUI.HotestNewsCount).AsEnumerable();

            //Category = CategoryService.GetFeatureCategory();
            //if (Category == null)
            //    Category = CategoryService.GetRandomCategory();
            //HostestArticle = Category.Contents
            //    .OrderByDescending(p => p.IsFeatured)
            //    .OrderByDescending(p1 => p1.UpdatedDate)
            //    .Skip(0).Take(DBNL.App.Config.DBNLConfigurationManager.WebUI.HotestNewsCount)
            //    .AsEnumerable();

            //Articles = Category.Contents
            //    .OrderByDescending(p => p.IsFeatured)
            //    .OrderByDescending(p1 => p1.UpdatedDate)
            //    .Skip(DBNLConfigurationManager.WebUI.HotestNewsCount)
            //    .Take(DBNLConfigurationManager.WebUI.OtherFeaturesNews)
            //    .AsEnumerable();
        }

    }
    public class PublicPollViewData
    {
        public Poll ActivePoll { get; set; }
        public IEnumerable<PollQuestion> Questions { get; set; }
        public int TotalResponses { get; set; }
        public PublicPollViewData()
        {
            ActivePoll = new PollService().GetActivePoll();
            Questions = new PollQuestionService().GetQuestionByPoll(ActivePoll);
            Calculate();
        }

        private void Calculate()
        {
            TotalResponses =0;
            foreach (var item in this.Questions)
            {
                TotalResponses += item.Responses;

            }

            foreach (var item in this.Questions)
            {
                item.Percent = ((float)item.Responses) / this.TotalResponses;

            }

        }
        public PublicPollViewData(int id)
        {
            ActivePoll = new PollService().GetItem(id);
            Questions = new PollQuestionService().GetQuestionByPoll(ActivePoll);
            Calculate();
        }
    }


}
