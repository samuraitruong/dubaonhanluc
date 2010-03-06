using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace DBNL.App.Models.Statics
{
   public class CustomSelectList
   {
       
       public static IEnumerable<SelectListItem>  CreateMenuPosition(){
           List<SelectListItem> list = new List<SelectListItem>();
           list.Add(new SelectListItem(){Text= "Chính",Value = NavigationPositions.Main.ToString()});
           list.Add(new SelectListItem(){Text= "Bên Trên",Value = NavigationPositions.Top.ToString()});
           list.Add(new SelectListItem(){Text= "Bên Trái",Value = NavigationPositions.Left.ToString()});
           return list.AsEnumerable();
       }
       
   }
    
}
