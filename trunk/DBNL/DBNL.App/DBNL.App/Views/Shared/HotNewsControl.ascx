<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<DBNL.App.Models.Content>>" %>
 <ul id="ticker">
     <%foreach (var item in Model)
       { %>

       <li><%=Html.ActionLink(Html.Encode(item.Title.ToUpper()), "View","Article", new {id= item.ContentId}, null )%></li>
     <%} %>
    </ul>