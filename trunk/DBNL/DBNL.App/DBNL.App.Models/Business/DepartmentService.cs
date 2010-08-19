using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBNL.App.Models.Business
{
    public class DepartmentService : BaseService
    {
        public  IEnumerable<Department> GetAllItems()
        {
            return this.Departments.AsEnumerable();
        }

        
    }
}
