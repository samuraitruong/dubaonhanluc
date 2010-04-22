using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
using System.Threading;
using System.Reflection;
using System.Globalization;
using System.Runtime.CompilerServices;

namespace DBNL.App.Models.Entities.Attributes
{
    public class LocalizedDisplayNameAttribute : DisplayNameAttribute
    {
        public string DisplayNameResourceName { get; set; }
        public Type DisplayNameResourceType { get; set; }
        protected string DisplayNameString { get; set; }
        //private Func<string> <ResourceAccessor>k__BackingField;
         [CompilerGenerated]



        private PropertyInfo _nameProperty;

        private Type _resourceType;

        
        private void SetResourceAccessorByPropertyLookup()
        {
            if ((this.DisplayNameResourceType != null) && (this.DisplayNameResourceName != null))
            {
                PropertyInfo property = this.DisplayNameResourceType.GetProperty(this.DisplayNameResourceName, BindingFlags.Public | BindingFlags.Static);
                if (property == null)
                {
                    throw new InvalidOperationException("Resources couldn't be loaded.");
                }
                if (property.PropertyType != typeof(string))
                {
                    throw new InvalidOperationException("Resource Type is not support for Display name");
                }

             //   this.DisplayName = (string)property.GetValue(null, null);
            }
                
        }

        public LocalizedDisplayNameAttribute(string DisplayNameResourceName, Type DisplayNameResourceType)

            : base(DisplayNameResourceName)
        {
            this.DisplayNameResourceName = DisplayNameResourceName;
            this.DisplayNameResourceType = DisplayNameResourceType;
        }
        public LocalizedDisplayNameAttribute(string displayNameKey)

            : base(displayNameKey)
        {
        }

        public LocalizedDisplayNameAttribute()

            : base()
        {
        }
        public Type NameResourceType
        {
            get
            {
                return _resourceType;
            }

            set
            {

                _resourceType = value;

                //initialize nameProperty when type property is provided by setter

                _nameProperty = _resourceType.GetProperty(base.DisplayName, BindingFlags.Static | BindingFlags.Public);
            }

        }

        public override string DisplayName
        {

            get
            {

                if ((this.DisplayNameResourceType != null) && (this.DisplayNameResourceName != null))
                {
                    PropertyInfo property = this.DisplayNameResourceType.GetProperty(this.DisplayNameResourceName, BindingFlags.Public | BindingFlags.Static);
                    if (property == null)
                    {
                        throw new InvalidOperationException("Resources couldn't be loaded.");
                    }
                    if (property.PropertyType != typeof(string))
                    {
                        throw new InvalidOperationException("Resource Type is not support for Display name");
                    }

                   return  (string)property.GetValue(null, null);
                }

                //check if nameProperty is null and return original display name value

                if (_nameProperty == null)
                {

                    return base.DisplayName;

                }
                return (string)_nameProperty.GetValue(_nameProperty.DeclaringType, null);

            }

        }

    }

}
