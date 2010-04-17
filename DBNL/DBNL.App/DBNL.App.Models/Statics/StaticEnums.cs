﻿using System;
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
        WebContact
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
        Role
    }
    public enum BannerPositions
    { 
        Top,
        Left,
        Right,
        Bottom
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
