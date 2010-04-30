<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<DBNL.App.Models.Content>>" %>
 <ul id="ticker">
     <%foreach (var item in Model)
       { %>

       <li><%=Html.ContentLink(item, 12)%></li>
     <%} %>
    </ul>