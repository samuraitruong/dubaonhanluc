﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.1
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DBNL.App.Models.Entities {
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
    public class DisplayNames {
        
        private static global::System.Resources.ResourceManager resourceMan;
        
        private static global::System.Globalization.CultureInfo resourceCulture;
        
        [global::System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")]
        internal DisplayNames() {
        }
        
        /// <summary>
        ///   Returns the cached ResourceManager instance used by this class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        public static global::System.Resources.ResourceManager ResourceManager {
            get {
                if (object.ReferenceEquals(resourceMan, null)) {
                    global::System.Resources.ResourceManager temp = new global::System.Resources.ResourceManager("DBNL.App.Models.Entities.DisplayNames", typeof(DisplayNames).Assembly);
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
        ///   Looks up a localized string similar to Công ty.
        /// </summary>
        public static string Job_Company {
            get {
                return ResourceManager.GetString("Job_Company", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Hạn nộp hồ sơ.
        /// </summary>
        public static string Job_Deadline {
            get {
                return ResourceManager.GetString("Job_Deadline", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Mô tả.
        /// </summary>
        public static string Job_Description {
            get {
                return ResourceManager.GetString("Job_Description", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Mô tả chi tiết.
        /// </summary>
        public static string Job_Detail {
            get {
                return ResourceManager.GetString("Job_Detail", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Tên Công Việc.
        /// </summary>
        public static string Job_Title {
            get {
                return ResourceManager.GetString("Job_Title", resourceCulture);
            }
        }
    }
}
