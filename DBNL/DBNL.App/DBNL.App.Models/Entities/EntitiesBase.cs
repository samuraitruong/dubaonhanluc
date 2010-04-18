using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBNL.App.Models
{
    public abstract partial class LinqEntityBase
    {
        //public abstract void Detach();
        //protected static System.Data.Linq.EntityRef<TEntity> Detach<TEntity>
        //(System.Data.Linq.EntityRef<TEntity> entity)
        //    where TEntity : LinqEntityBase
        //    {
        //        if (!entity.HasLoadedOrAssignedValue || entity.Entity == null)
        //            return new System.Data.Linq.EntityRef<TEntity>();
        //            entity.Entity.Detach();
        //        return

        //    }
    }
}
