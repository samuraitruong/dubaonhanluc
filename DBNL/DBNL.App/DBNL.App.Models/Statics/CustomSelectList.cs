using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using DBNL.App.Models.Business;

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
       public static IEnumerable<SelectListItem> CreateListCategories(bool insertEmptyItem)
       {
           List<SelectListItem> list = new List<SelectListItem>();
           if(insertEmptyItem) list.Add(new SelectListItem() { Text = "Chọn danh mục", Value = "" });
           foreach( var item in CategoryService.GetAllCategories())
           list.Add(new SelectListItem() { Text = item.CategoryName, Value = item.ID.ToString() });
           
           return list.AsEnumerable();
       }


       public static IEnumerable<SelectListItem> CreateListNavigations(bool insertEmptyItem)
       {
           List<SelectListItem> list = new List<SelectListItem>();
           if (insertEmptyItem) list.Add(new SelectListItem() { Text = "Chọn menu cha", Value = "" });
           foreach (var item in NavigationService.GetItems()){
               list.Add(new SelectListItem() {
                Text = item.Name,
                Value = item.Id.ToString()
               });
           }
           return list.AsEnumerable();
       }

       public static IEnumerable<SelectListItem> CreateModuleList()
       {
           List<SelectListItem> list = new List<SelectListItem>();
           list.Add(new SelectListItem() { Text = "Chọn Module", Value = "" });
           list.Add(new SelectListItem() { Text = "Tin tức", Value = SiteModules.Article.ToString() });
           list.Add(new SelectListItem() { Text = "Liên kết website", Value = SiteModules.WebLink.ToString() });
           list.Add(new SelectListItem() { Text = "Khảo sát", Value = SiteModules.Poll.ToString() });
           list.Add(new SelectListItem() { Text = "Liên Hệ", Value = SiteModules.WebContact.ToString() });
           list.Add(new SelectListItem() { Text = "Liên kết trang web", Value = SiteModules.Url.ToString() });
           return list.AsEnumerable();
       }

   }
    
}
