using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBNL.App.Config;

namespace DBNL.App.Models
{
   public partial class ContentCategory
    {
        public IEnumerable<Content> FeatureArtilesHonHP { 
            
            get {
                return this.Contents.OrderByDescending(p => p.IsFeatured)
                                    .OrderByDescending(p1 => p1.UpdatedDate)
                                    .Skip(0)
                                    .Take(DBNLConfigurationManager.WebUI.FeaturedItemOnHP)
                                    .AsEnumerable();
            }
        }
    }
}
