<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Navigation>>" %>
<div id="mainnav" class="clearfix">
    <ul id="nav">
        <% foreach (var item in Model) { %>
        <%  %>
        <li class="" rel="<%=Url.Action(item.Action, item.Controller, new { id = item.Id }, null)%>"><%=Html.ActionLink(item.Name, item.Action, item.Controller, new { id = item.Id }, null)%>
            <% if(item.Navigations != null && item.Navigations.Count>0){ %>
            <ul>
                <%   
               foreach (var subItem in item.Navigations) { %>
                <li class="" rel="<%=Url.Action(subItem.Action, subItem.Controller, new { id = subItem.Id }, null)%>">
                <% if (subItem.Component == DBNL.App.Models.Statics.SiteModules.Url.ToString())
                   { %>
                   <a href="<%=subItem.ExternalUrl %>"><%=subItem.Name%></a>
                <%}
                   else
                   { %>
                <%=Html.ActionLink(subItem.Name, subItem.Action, subItem.Controller, new { id = subItem.Id }, null)%>
                <%} %>
                
                </li>
            <% } %>
            </ul>
            <%} %>
        </li>
    <% } %>
    </ul>
</div>