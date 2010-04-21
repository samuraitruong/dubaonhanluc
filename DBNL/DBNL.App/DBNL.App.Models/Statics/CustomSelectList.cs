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

       public static IEnumerable<SelectListItem> CreateBannerPosition()
       {
           List<SelectListItem> posList = new List<SelectListItem>();
           posList.Add(new SelectListItem() { Text = "Bên Trên", Value = BannerPositions.Top.ToString() });
           posList.Add(new SelectListItem() { Text = "Bên Trái", Value = BannerPositions.Left.ToString() });
           posList.Add(new SelectListItem() { Text = "Bên Phải", Value = BannerPositions.Right.ToString() });
           posList.Add(new SelectListItem() { Text = "Bên Dưới", Value = BannerPositions.Bottom.ToString() });
           return posList.AsEnumerable();
       }

       public static IEnumerable<SelectListItem> CreateBannerStatus()
       {
           List<SelectListItem> statList = new List<SelectListItem>();
           statList.Add(new SelectListItem() { Text = "Kích hoạt", Value = EntityStatuses.Actived.ToString() });
           statList.Add(new SelectListItem() { Text = "Không kích hoạt", Value = EntityStatuses.Inactive.ToString() });
           return statList;
       }

       public static IEnumerable<SelectListItem> CreateContactStatus()
       {
           List<SelectListItem> contList = new List<SelectListItem>();
           contList.Add(new SelectListItem() { Text = "Kích hoạt", Value = UserStatus.Active.ToString() });
           contList.Add(new SelectListItem() { Text = "Không kích hoạt", Value = UserStatus.Inactive.ToString() });
           return contList;
       }

       public static IEnumerable<SelectListItem> CreatePollStatus()
       {
           List<SelectListItem> statList = new List<SelectListItem>();
           statList.Add(new SelectListItem() { Text = "Công khai", Value = EntityStatuses.Public.ToString() });
           statList.Add(new SelectListItem() { Text = "Không công khai", Value = EntityStatuses.Unpublic.ToString() });
           return statList;
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
           list.Add(new SelectListItem() { Text = "Trang chủ", Value = SiteModules.Home.ToString() });
           list.Add(new SelectListItem() { Text = "Tin tức", Value = SiteModules.Article.ToString() });
           list.Add(new SelectListItem() { Text = "Liên kết website", Value = SiteModules.WebLink.ToString() });
           list.Add(new SelectListItem() { Text = "Khảo sát", Value = SiteModules.Poll.ToString() });
           list.Add(new SelectListItem() { Text = "Liên Hệ", Value = SiteModules.WebContact.ToString() });
           list.Add(new SelectListItem() { Text = "Liên kết trang web", Value = SiteModules.Url.ToString() });
           return list.AsEnumerable();
       }


       public static IEnumerable<SelectListItem> CreateListCategories(bool includeEmpty, int? catId)
       {
           IEnumerable<SelectListItem> items = CreateListCategories(includeEmpty);
           if (!catId.HasValue) return items;

           SelectListItem selectedItem = items.Where(p => p.Value == catId.Value.ToString()).Single();
           selectedItem.Selected = true;
           return items;
       }

       public static IEnumerable<SelectListItem> CreateListNavigations(bool includeEmpty, int? parentId)
       {
           IEnumerable<SelectListItem> items = CreateListNavigations(includeEmpty);
           if (!parentId.HasValue) return items;

           SelectListItem selectedItem = items.Where(p => p.Value == parentId.Value.ToString()).Single();
           selectedItem.Selected = true;
           return items;
       }

       public static IEnumerable<SelectListItem> CreateMenuPosition(string pos)
       {
           IEnumerable<SelectListItem> items = CreateMenuPosition();
           SelectListItem selectedItem = items.Where(p => p.Value == pos).Single();
           selectedItem.Selected = true;
           return items;
       }

       public static IEnumerable<SelectListItem> CreateModuleList(string comp)
       {
           IEnumerable<SelectListItem> items = CreateModuleList();
           SelectListItem selectedItem = items.Where(p => p.Value == comp).Single();
           selectedItem.Selected = true;
           return items;
       }
   }
    
}
