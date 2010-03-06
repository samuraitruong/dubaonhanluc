<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Navigation>>" %>

<ul id="nav2">
<% foreach(var item in Model) { %>
    <li class="">
    <% if (item.Component == DBNL.App.Models.Statics.SiteModules.Url.ToString())
       { %>
       <a href="<%=item.ExternalUrl %>"><%=item.Name %></a>
    <%}
       else
       { %>
    <%=Html.ActionLink(item.Name, item.Action, item.Controller, new { id = item.ContentId }, null)%>
    <%} %>
    </li>
<%} %>
 
</ul>