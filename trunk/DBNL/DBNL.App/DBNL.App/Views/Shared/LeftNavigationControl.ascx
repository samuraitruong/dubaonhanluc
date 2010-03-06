<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Navigation>>" %>
<div class="top_cat">
    <h2>
        DANH MỤC</h2>
</div>
<div class="center_cat">
    <ul id="nav90">
        <% foreach(var item in Model) { %>
         <li class=""><%=Html.ActionLink(item.Name, item.Action, item.Controller, new {id= item.ContentId}, null) %></li>
        <%} %>
    </ul>
</div>