<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Navigation>>" %>
<%@ Import Namespace="DBNL.App.Models.Extensions" %>
<div class="top_cat">
    <h2>
        DANH MỤC</h2>
</div>
<div class="center_cat">
      <ul id="Ul1" class="submenu">
        
        <% 
            var index = 1;
            
            foreach(var item in Model) { 
         %>
         <% if (item.Component == DBNL.App.Models.Statics.SiteModules.Article.ToString())
            {%>
         <%} %>
         <li class="<%= index== Model.Count()? "end": "" %>" rel="<%=Url.NavigationLink(item)%>" ><%= Html.NavigationLink(index.ToString() + ". " + item.Name, item)%>
         
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
        <% index++;
            } %>
    </ul>
</div>