<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Navigation>>" %>
<%@ Import Namespace="DBNL.App.Models.Extensions" %>
<div class="top_cat">
    <h2>
        DANH MỤC</h2>
</div>
<div class="center_cat">
    <%--<ul id="nav90">
        
        <% 
            var index = 1;
            
            foreach(var item in Model) { 
         %>
         <% if (item.Component == DBNL.App.Models.Statics.SiteModules.Article.ToString())
            {%>
         <%} %>
         <li class="" rel="<%=Url(item.Action, item.Controller, new { id = item.ContentId }, null)%>" ><%= Html.ActionLink(index.ToString() + ". " +item.Name, item.Action, item.Controller, new {id= item.ContentId}, null) %></li>
        <% index++;
            } %>
    </ul>--%>
      <ul id="Ul1">
        
        <% 
            var index = 1;
            
            foreach(var item in Model) { 
         %>
         <% if (item.Component == DBNL.App.Models.Statics.SiteModules.Article.ToString())
            {%>
         <%} %>
         <li class="" rel="<%=Url.NavigationLink(item)%>" ><%= Html.NavigationLink(index.ToString() + ". " + item.Name, item)%></li>
        <% index++;
            } %>
    </ul>
</div>