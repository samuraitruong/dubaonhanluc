using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBNL.App.Models.Helpers;

namespace DBNL.App.Models.ViewData
{
    public class CategoryViewData
    {
        public ContentCategory Category { get; set; }
        public IEnumerable<Content> Articles { get; set; }
        public IEnumerable<Content> FeaturedArticles { get; set; }
        public IPagedList<Content> ArticlesPagedList { get; set; }
    }
}
