using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBNL.App.Models.Business;

namespace DBNL.App.Models.ViewData
{
    public class ViewContentDataView
    {
        public Content Content { get;set;}

        public IEnumerable<Content> FeaturedContents { get; set; }
        public IEnumerable<Content> OtherNewses { get; set; }
        
    }
}
