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
        public HomePageViewData()
        {
            PublicPoll = new PublicPollViewData();
            FeaturedCategory = new FeatureCategoryViewData();
            CategoriesOnHP = CategoryService.GetCategoriesShowOnHP();
        }
    }
    public class FeatureCategoryViewData{

        public ContentCategory Category { get; set; }
        public IEnumerable<Content> Articles { get; set; }
        public IEnumerable<Content>  HostestArticle { get; set; }
        public FeatureCategoryViewData()
        {
            Category = CategoryService.GetFeatureCategory();
            if (Category == null)
                Category = CategoryService.GetRandomCategory();
            HostestArticle = Category.Contents
                .OrderByDescending(p => p.IsFeatured.Value)
                .OrderByDescending(p1 => p1.UpdatedDate)
                .Skip(0).Take(DBNL.App.Config.DBNLConfigurationManager.WebUI.HotestNewsCount)
                .AsEnumerable();

            Articles = Category.Contents
                .OrderByDescending(p => p.IsFeatured.Value)
                .OrderByDescending(p1 => p1.UpdatedDate)
                .Skip(DBNLConfigurationManager.WebUI.HotestNewsCount)
                .Take(DBNLConfigurationManager.WebUI.OtherFeaturesNews)
                .AsEnumerable();
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
