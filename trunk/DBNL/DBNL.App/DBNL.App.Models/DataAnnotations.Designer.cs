﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.1
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DBNL.App.Models {
    using System;
    
    
    /// <summary>
    ///   A strongly-typed resource class, for looking up localized strings, etc.
    /// </summary>
    // This class was auto-generated by the StronglyTypedResourceBuilder
    // class via a tool like ResGen or Visual Studio.
    // To add or remove a member, edit your .ResX file then rerun ResGen
    // with the /str option, or rebuild your VS project.
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("System.Resources.Tools.StronglyTypedResourceBuilder", "4.0.0.0")]
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    public class DataAnnotations {
        
        private static global::System.Resources.ResourceManager resourceMan;
        
        private static global::System.Globalization.CultureInfo resourceCulture;
        
        [global::System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")]
        internal DataAnnotations() {
        }
        
        /// <summary>
        ///   Returns the cached ResourceManager instance used by this class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        public static global::System.Resources.ResourceManager ResourceManager {
            get {
                if (object.ReferenceEquals(resourceMan, null)) {
                    global::System.Resources.ResourceManager temp = new global::System.Resources.ResourceManager("DBNL.App.Models.DataAnnotations", typeof(DataAnnotations).Assembly);
                    resourceMan = temp;
                }
                return resourceMan;
            }
        }
        
        /// <summary>
        ///   Overrides the current thread's CurrentUICulture property for all
        ///   resource lookups using this strongly typed resource class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        public static global::System.Globalization.CultureInfo Culture {
            get {
                return resourceCulture;
            }
            set {
                resourceCulture = value;
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Tên banner bắt buộc nhập..
        /// </summary>
        public static string Banner_Name {
            get {
                return ResourceManager.GetString("Banner_Name", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Banner Url bắt buộc nhập.
        /// </summary>
        public static string Banner_Url {
            get {
                return ResourceManager.GetString("Banner_Url", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Url không đúng định dạng..
        /// </summary>
        public static string Banner_UrlFormat {
            get {
                return ResourceManager.GetString("Banner_UrlFormat", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Tự đề bài viết không được phép bỏ trống..
        /// </summary>
        public static string Content_Title {
            get {
                return ResourceManager.GetString("Content_Title", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Tên Menu không được phép rỗng..
        /// </summary>
        public static string Navigation_Name {
            get {
                return ResourceManager.GetString("Navigation_Name", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Tên nhóm bắt buột phải nhập..
        /// </summary>
        public static string Role_RoleName {
            get {
                return ResourceManager.GetString("Role_RoleName", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Tên quản trị viên bắt buộc phải nhập.
        /// </summary>
        public static string User_Name {
            get {
                return ResourceManager.GetString("User_Name", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Tên đăng nhập không được phép trống..
        /// </summary>
        public static string User_Username {
            get {
                return ResourceManager.GetString("User_Username", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Tên đăng nhập bị trùng.
        /// </summary>
        public static string User_Username_Duplicated {
            get {
                return ResourceManager.GetString("User_Username_Duplicated", resourceCulture);
            }
        }
    }
}
