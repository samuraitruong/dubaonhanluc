using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBNL.App.Models.ViewData
{
    public class CategoryViewData
    {
        public ContentCategory Category { get; set; }
        public IEnumerable<Content> Articles { get; set; }
    }
}
