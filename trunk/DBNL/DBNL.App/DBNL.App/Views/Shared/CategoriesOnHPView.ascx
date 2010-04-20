<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<ContentCategory>>" %>


<div class="clearfix" id="wrap_newsjob">
<% var index=0; %>
<% foreach(var item in Model ) {%>
    <div class="newsjob <% =(index++)%2==0?"fl":"fr" %>">
		<div class="top_newsjob">
			<h3>
            
            <%= Html.ActionLink((item.CategoryName),
                                "Category",
                                "Article",
                                new {id=item.ID},
                                null)
                             %>
            </h3>
		</div>
		<div class="center_newsjob">
		<div class="wrap_hn ex">
        <% foreach (var subitem in item.FeatureArtilesHonHP)
           {%>
    		<div class="hn clearfix">
    			<div class="pic"><a href="<%=Url.Action("View","Article",new {id=subitem.ContentId}) %>"><img width="110" alt="nguonnhanluc" src="<%=subitem.ThumbnailUrl %>"></a></div>
    			<div class="des">
    				<h3><a href="<%=Url.Action("View","Article",new {id=subitem.ContentId}) %>"><%=subitem.Title %></a> <small>(04/03/2010)</small></h3>
    				<p>&nbsp;&nbsp; <%=subitem.Description.Substring(0, Math.Min(subitem.Title.Length, 150)) %></p>
    			</div>
			</div>
            <%} %>
						
		</div>
		</div>
		<div class="bottom_newsjob"><img width="483" height="15" alt="nguonnhanluc" src="<%=Url.Content("~/images/bg_lstitle_bottom.jpg") %>" /></div>
	</div>

<%} %>
	
</div>