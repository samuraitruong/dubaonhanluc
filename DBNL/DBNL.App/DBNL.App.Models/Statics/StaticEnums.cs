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
        Article,
        WebLink,
        WebContact,
        Poll,
        Contact,
        Url
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
        Actived,
        Public,
        Disactived
    }
}
