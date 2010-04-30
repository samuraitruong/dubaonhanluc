using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using System.Web.Routing;

namespace DBNL.App.Models.Helpers
{
	public static class PagingLinqExtensions
	{
		#region IQueryable<T> extensions

		public static IPagedList<T> ToPagedList<T>(this IQueryable<T> source, int pageIndex, int pageSize)
		{
			return new PagedList<T>(source, pageIndex, pageSize);
		}

		public static IPagedList<T> ToPagedList<T>(this IQueryable<T> source, int pageIndex, int pageSize, int totalCount)
		{
			return new PagedList<T>(source, pageIndex, pageSize, totalCount);
		}

		#endregion

		#region IEnumerable<T> extensions

		public static IPagedList<T> ToPagedList<T>(this IEnumerable<T> source, int pageIndex, int pageSize)
		{
			return new PagedList<T>(source, pageIndex, pageSize);
		}

		public static IPagedList<T> ToPagedList<T>(this IEnumerable<T> source, int pageIndex, int pageSize, int totalCount)
		{
			return new PagedList<T>(source, pageIndex, pageSize, totalCount);
		}
        public static IPagedList<T> ToPagedListEx<T>(this IEnumerable<T> source, int pageIndex, int pageSize, int totalCount)
        {
            return new PagedList<T>(source, pageIndex, pageSize, totalCount, true);
        }

		#endregion
	}
}