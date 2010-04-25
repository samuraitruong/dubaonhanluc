<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Navigation>>" %>
<%@ Import Namespace="DBNL.App.Models.Extensions" %>

<div id="mainnav" class="clearfix">
    <ul id="nav">
        <% foreach (var item in Model) { %>
        <%  %>
        <li class="" rel="<%=Url.NavigationLink(item)%>"><%= Html.NavigationLink(item)%>
            <% if(item.Navigations != null && item.Navigations.Count>0){ %>
            <ul>
                <%   
               foreach (var subItem in item.Navigations) { %>
                <li class="" rel="<%=Url.NavigationLink(subItem)%>">
                <% if (subItem.Component == DBNL.App.Models.Statics.SiteModules.Url.ToString())
                   { %>
                   <a href="<%=subItem.ExternalUrl %>"><%=subItem.Name%></a>
                <%}
                   else
                   { %>
                        <%= Html.NavigationLink(subItem)%>
                <%} %>
                
                </li>
            <% } %>
            </ul>
            <%} %>
        </li>
    <% } %>
    </ul>
</div>