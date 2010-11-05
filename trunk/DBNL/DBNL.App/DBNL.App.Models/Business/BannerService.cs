using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBNL.App.Models.Statics;

namespace DBNL.App.Models.Business
{
    public class BannerService:BaseService
    {
        public  IEnumerable<Banner> GetAllItems()
        {
            return this.Banners.AsEnumerable();
        }

        public  IQueryable<Banner> List()
        {
            return this.Banners.AsQueryable();
        }

        public  IQueryable<Banner> List(string pos)
        {
            if (string.IsNullOrEmpty(pos)) return List();

            return this.Banners.Where(p=>p.BannerPosition == pos).OrderBy(p=>p.Order).AsQueryable();
        }
        public  Banner GetItem(int id)
        {
            return this.Banners.Where(p => p.Id == id).SingleOrDefault();
        }

        public  Banner Add(string name, string url, string bannerImage, string bannerPosition)
        {
            Banner banner = new Banner();
            banner.Name = name.Trim();
            banner.Url = url.Trim();
            banner.BannerImage = bannerImage.Trim();
            banner.Status = "Actived";
            banner.CreatedDate = DateTime.Now;
            banner.UpdatedDate = DateTime.Now;
            banner.BannerPosition = bannerPosition;
            banner.Order = new BannerService().List(bannerPosition).Count()+1;
            this.Banners.InsertOnSubmit(banner);
            Commit();
            return banner;
        }

        public  void Delete(int id)
        {
            Banner banner = GetItem(id);
            this.Banners.DeleteOnSubmit(banner);
            Commit();
        }

        public  Banner Edit(int id, string name, string url, string bannerImage, string status, string bannerPosition)
        {
            Banner banner = GetItem(id);
            banner.Name = name.Trim();
            banner.Url = url.Trim();
            banner.BannerImage = bannerImage.Trim();
            banner.Status = status.Trim();
            banner.UpdatedDate = DateTime.Now;
            banner.BannerPosition = bannerPosition;
            Commit();
            return banner;
        }

        public  IEnumerable<Banner> GetItems(BannerPositions bannerPositions)
        {
            return Banners.Where(p=>p.Status == EntityStatuses.Actived.ToString() &&  p.BannerPosition == bannerPositions.ToString()).OrderBy(p=>p.Order).AsEnumerable();
        }
        public IEnumerable<Banner> GetItems(string pos)
        {
            return Banners.Where(p => p.Status == EntityStatuses.Actived.ToString() && p.BannerPosition == pos).AsEnumerable();
        }

        public  void Add(Banner banner)
        {
            Banners.InsertOnSubmit(banner);
            Commit();
        }

        public  void Public(int id)
        {
            Banner banner = GetItem(id);
            if (banner.Status == EntityStatuses.Actived.ToString())
                banner.Status = EntityStatuses.Inactive.ToString();
            else
            {
                banner.Status = EntityStatuses.Actived.ToString();
                banner.UpdatedDate = DateTime.Now;
            }

            Commit();
            //var banners = Banners.Where(p => p.BannerPosition == banner.BannerPosition).OrderByDescending(p => p.UpdatedDate).Skip(2);
            //foreach (var item in banners)
            //{
            //    item.Status = EntityStatuses.Inactive.ToString();
            //}
            //Commit();
        }

        public  string EntitiStatuses { get; set; }

        public void MoveUp(int id)
        {
            Banner item = GetItem(id);
            var preItem = GetItems(item.BannerPosition)
                .Where(p => p.Order < item.Order)
                .OrderByDescending(p => p.Order)
                .FirstOrDefault();

            if (preItem != null)
            {
                int temp = item.Order;
                item.Order = preItem.Order;
                preItem.Order = temp;
                Commit();
            }

        }
        public void MoveDown(int id)
        {
            Banner item = GetItem(id);
            var nextItem = GetItems(item.BannerPosition)
                .Where(p => p.Order > item.Order)
                .OrderBy(p => p.Order)
                .FirstOrDefault();

            if (nextItem != null)
            {
                int temp = item.Order;
                item.Order = nextItem.Order;
                nextItem.Order = temp;
                Commit();
            }

        }

        public Banner Edit(int id, string name, string url, string bannerImage, string status, string bannerPosition, string w, string h)
        {
            Banner banner = GetItem(id);
            banner.Name = name.Trim();
            banner.Url = url.Trim();
            banner.BannerImage = bannerImage.Trim();
            banner.Status = status.Trim();
            banner.UpdatedDate = DateTime.Now;
            banner.BannerPosition = bannerPosition;
            banner.Width = w;
            banner.Height = h;
            Commit();
            return banner;
        }
    }
}
