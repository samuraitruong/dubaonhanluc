using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBNL.App.Models.Statics
{
    public enum NavigationPositions
    {
        Main,
        Top,
        Left
    }
    public enum SupportTypes
    {
        Yahoo,
        Skype
    }
    public enum Controllers
    {
        Article,
        Link,
        WebLink,
        WebContact,
        Home
    }

    public enum Actions
    {
        Category,
        View,
        Index
    }
    public enum Areas
    {

    }
    public enum SiteModules
    {
        MenuNavigation,
        Article,
        WebLink,
        WebContact,
        Poll,
        Contact,
        Url,
        Supportter,
        Banner,
        User,
        Role,
        Home,
        Post
    }
    public enum BannerPositions
    { 
        Top,
        Left,
        Right,
        Bottom,
        Main,
        Sponsor
    }

    public enum BannerStatus
    { 
        Active,
        Public,
        Inactive
    }

    public enum UserStatus
    { 
        Active,
        Inactive
    }
    public enum JqGridOperations
    {
        del,
        edit,
        add,
        search
    }
}
