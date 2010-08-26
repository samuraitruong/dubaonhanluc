using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBNL.App.Config;
using System.ComponentModel.DataAnnotations;
using DBNL.App.Models.Entities.Attributes;
using DBNL.App.Models.Business;

namespace DBNL.App.Models
{
    [MetadataType(typeof(ContentCategoryMetaData))]
   public partial class ContentCategory
    {
        public IEnumerable<Content> FeatureArtilesHonHP { 
            
            get {
                if (this.ID == 49)
                {
                    return (new ContentService())
                        .Contents.OrderByDescending(p => p.IsFeatured)
                        .Where(p=>p.CategoryId == 49 || p.CategoryId == 53)
                        .Where(p=>p.IsFeatured)
                        .OrderByDescending(p1 => p1.CreatedDate)
                        .Skip(0)
                        .Take(DBNLConfigurationManager.WebUI.FeaturedItemOnHP)
                        .AsEnumerable();
                }
                return this.Contents.OrderByDescending(p => p.IsFeatured)
                                    .Where(p=>p.IsFeatured)
                                    .OrderByDescending(p1 => p1.CreatedDate)
                                    .Skip(0)
                                    .Take(DBNLConfigurationManager.WebUI.FeaturedItemOnHP)
                                    .AsEnumerable();
            }
        }
        public int CountArticles(bool includeSubCategory) {
            int result = this.Contents.Count;
            if (!includeSubCategory) return result;
            foreach (var item in this.ContentCategories)
            {
                result += item.Contents.Count;

            }
            return result;
        }
        public class ContentCategoryMetaData
        {
            [LocalizedDisplayName(DisplayNameResourceName = "Name", DisplayNameResourceType = typeof(DBNL.App.Models.Resources.CategoryStrings))]
            [Required(ErrorMessageResourceName = "NameRequiredMessage", ErrorMessageResourceType = typeof(DBNL.App.Models.Resources.CategoryStrings))]
            public string CategoryName { get; set; }

        }

        
    }
}
