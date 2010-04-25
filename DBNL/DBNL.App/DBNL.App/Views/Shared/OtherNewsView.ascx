<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<DBNL.App.Models.Content>>" %>

<div style="clear: both;" class="otherpage">
	<h4>Chuyên mục khác</h4>
	<ul class="k_otherpage">
	<% foreach (var item in Model)
        { %>
                <li><%=Html.ContentLink(item) %></li> 
                       
        <%} %>
	</ul>
</div>
            