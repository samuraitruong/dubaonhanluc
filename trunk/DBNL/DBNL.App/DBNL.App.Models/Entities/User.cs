using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBNL.App.Models.Statics;
using System.ComponentModel.DataAnnotations;
using DBNL.App.Models.Entities.Attributes;

namespace DBNL.App.Models
{
    [MetadataType(typeof(UserMetaData))]
    public partial class User : LinqEntityBase
    {
        protected Role myRole;
        public string GetRoles() {
            string roles = "";
            foreach (var item in this.UserInRoles)
            {
                roles += item.Role.RoleName ;
                roles += ",";
            }
            return roles;
        }
        public bool HasPermissionOnCategory(int catId){
            if(MixRole.CategoryIds == null) return false;
            return MixRole.CategoryIds.Contains(catId);
        }
        public Role MixRole
        {
            get {
                if (UserInRoles.Count == 0) return null;

                myRole = this.UserInRoles[0].Role;

                foreach (var item in this.UserInRoles)
                {
                    var cRole = item.Role;
                    myRole.IsFullPermission = myRole.IsFullPermission | cRole.IsFullPermission;
                    myRole.AllowManageAllContent = myRole.AllowManageAllContent | cRole.AllowManageAllContent;
                    myRole.AllowManageBanner = myRole.AllowManageBanner | cRole.AllowManageBanner;
                    myRole.AllowManageContact = myRole.AllowManageContact | cRole.AllowManageContact;
                    myRole.AllowManageLink = myRole.AllowManageLink | cRole.AllowManageLink;
                    myRole.AllowManageMenu = myRole.AllowManageMenu | cRole.AllowManageMenu;
                    myRole.AllowManageOnlineSupporter = myRole.AllowManageOnlineSupporter | cRole.AllowManageOnlineSupporter;
                    myRole.AllowManagePoll = myRole.AllowManagePoll | cRole.AllowManagePoll;
                    myRole.AllowManageRole = myRole.AllowManageRole | cRole.AllowManageRole;
                    myRole.AllowManageUser = myRole.AllowManageUser | cRole.AllowManageUser;
                    myRole.CategoryIds = new List<int>();
                    if (string.IsNullOrEmpty(cRole.ContentPermission)) return myRole;

                    foreach (var sitem in cRole.ContentPermission.Split(','))
                    {
                        if (string.IsNullOrEmpty(sitem)) continue;
                        int id =0;
                        if (int.TryParse(sitem, out id)) {
                            myRole.CategoryIds.Add(id);
                        };
                    }

                }
                return myRole;
            }
        }
        public bool HasPermisionOnModule(SiteModules module)
        {
            return true;
        }
        public void Detach()
        {
            this.PropertyChanged = null;
            this.PropertyChanging = null;

        }


        public class UserMetaData
        {
            [Required(ErrorMessageResourceName = "User_Name", ErrorMessageResourceType = typeof(DataAnnotations))]
            public string Name { get; set; }
            [Required(ErrorMessageResourceName = "User_Username", ErrorMessageResourceType = typeof(DataAnnotations))]
            //[Username(ErrorMessageResourceName = "User_Username_Duplicated", ErrorMessageResourceType = typeof(DataAnnotations))]
            
            public string Username { get; set; }
        }

    }
}
