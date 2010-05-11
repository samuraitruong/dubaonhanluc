<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<DBNL.App.Models.Banner>>" %>

 <div id="slideshow" class="clear">
 <% var index = 1; %>
 <% foreach (var item in Model)
    { %>
    <img src="<%=item.BannerImageUrl%>" alt="<% =item.Name %>" class="<%=index==1?"active":"" %>" />
 <%
     index++;
    } %>
                
                
 </div>