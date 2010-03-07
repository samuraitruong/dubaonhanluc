using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBNL.App.Models.Business
{
    public class BannerService:BaseService
    {
        public static IEnumerable<Banner> GetAllItems()
        {
            return GetInstance().Banners.AsEnumerable();
        }

        public static Banner GetItem(int id)
        {
            return GetInstance().Banners.Where(p => p.Id == id).SingleOrDefault();
        }

        public static Banner Add(string name, string url, string bannerImage, string bannerPosition)
        {
            Banner banner = new Banner();
            banner.Name = name.Trim();
            banner.Url = url.Trim();
            banner.BannerImage = bannerImage.Trim();
            banner.Status = "Actived";
            banner.CreatedDate = DateTime.Today;
            banner.UpdatedDate = DateTime.Today;
            banner.BannerPosition = bannerPosition;
            GetInstance().Banners.InsertOnSubmit(banner);
            Commit();
            return banner;
        }

        public static void Delete(int id)
        {
            Banner banner = GetInstance().Banners.Where(p => p.Id == id).SingleOrDefault();
            GetInstance().Banners.DeleteOnSubmit(banner);
            Commit();
        }

        public static Banner Edit(int id, string name, string url, string bannerImage, string status, string bannerPosition)
        {
            Banner banner = GetItem(id);
            banner.Name = name.Trim();
            banner.Url = url.Trim();
            banner.BannerImage = bannerImage.Trim();
            banner.Status = status.Trim();
            banner.CreatedDate = DateTime.Today;
            banner.UpdatedDate = DateTime.Today;
            banner.BannerPosition = bannerPosition;
            Commit();
            return banner;
        }
    }
}
