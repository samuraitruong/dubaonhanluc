using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBNL.App.Models.Statics;
using DBNL.App.Models.Extensions;

namespace DBNL.App.Models.Business
{
    public class JobService:BaseService
    {
        public static IEnumerable<Job> GetAllItems()
        {
            return Jobs.AsEnumerable();
        }

        public static IQueryable<Job> List()
        {
            return Jobs.AsQueryable();
        }

      
        public static Job GetItem(int id)
        {
            return Jobs.Where(p => p.Id == id).SingleOrDefault();
        }

       

        public static void Delete(int id)
        {
            Job job = GetItem(id);
            Jobs.DeleteOnSubmit(job);
            Commit();
        }


        public static void Add(Job job)
        {
            job.CreatedDate = DateTime.Now;
            job.UpdatedDate = DateTime.Now;
            job.Key = job.Title.ToUrlKey();
            job.Status = EntityStatuses.Actived.ToString();
            Jobs.InsertOnSubmit(job);
            Commit();
        }

        public static void Public(int id)
        {
            var item = GetItem(id);
            if (item == null) return;
            item.Status = (item.Status == EntityStatuses.Actived.ToString()) ? EntityStatuses.Inactive.ToString() : EntityStatuses.Actived.ToString();
            Commit();

        }

        public static void Update(int id, Job job)
        {
            var item = GetItem(id);
            item.UpdatedDate = DateTime.Now;
            item.Title = job.Title;
            item.Company = job.Company;
            item.CompanyInfo = job.CompanyInfo;

            item.JobDetail = job.JobDetail;
            item.Deadline = job.Deadline;
            item.Description = job.Description;
            Commit();
        }

        public static Job EditItem(int id, string Title, string Company, DateTime Deadline, string Status)
        {
            var item = GetItem(id);
            item.UpdatedDate = DateTime.Now;
            item.Title = Title;
            item.Company = Company;
            item.Deadline = Deadline;
            item.Status = Status;
            Commit();
            return item;
        }

        public static IEnumerable<Job> GetNewestJob(int itemCount)
        {
            return Jobs.OrderByDescending(p => p.CreatedDate).Skip(0).Take(itemCount).AsEnumerable();

        }
    }
}
