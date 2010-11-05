<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Navigation>>" %>

<ul id="nav2">
<% foreach(var item in Model) { %>
    <li class="" rel="<%=Url.NavigationLink(item)%>">
    <% if (item.Component == DBNL.App.Models.Statics.SiteModules.Url.ToString())
       { %>
       <a href="<%=item.ExternalUrl %>"><%=item.Name %></a>
    <%}
       else
       { %>
    <%=Html.NavigationLink(item)%>
    <%} %>
    <%if ( item.Navigations.Count>0 )
           { %>
                <ul>
                    <% foreach (var subitem in item.Navigations)
                       { %>
					<li><a href="<%=Url.NavigationLink(subitem)%>"><% =subitem.Name %></a></li>
                    <%} %>
				</ul>
                <%} %>

    </li>
<%} %>
 
</ul>