<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Navigation>>" %>
<div class="top_cat">
    <h2>
        DANH MỤC</h2>
</div>
<div class="center_cat">
    <ul id="nav90">
        
        <% 
            var index = 1;
            
            foreach(var item in Model) { 
         %>
         <li class="" rel="<%=Url.Action(item.Action, item.Controller, new { id = item.ContentId }, null)%>" ><%= Html.ActionLink(index.ToString() + ". " +item.Name, item.Action, item.Controller, new {id= item.ContentId}, null) %></li>
        <% index++;
            } %>
    </ul>
</div>