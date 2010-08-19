<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<FeatureCategoryViewData>" %>

<div id="hot_news">
		<div class="top_hot_news">
			<h2>TIN TỨC &amp; SỰ KIỆN NỔI BẬT NHẤT TUẦN QUA</h2>
		</div>
				<div class="center_hot_news clearfix">
			<div class="wrap_hn">
            <% foreach (var item in Model.HostestArticle)
               { %>
               
               <div class="hn tnb clearfix">
					<div class="pic">
                    
						<a href="<%= Url.ContentLink(item)%>"><img width="115" alt="nguonnhanluc" src="<% =item.ThumbnailUrl %>"/></a>
					</div>
					<div class="des">
						<h3><%= Html.ContentLink(item, 12, false)%> <small><%= item.CreatedDate.ToString("dd/MM/yyyy") %></small></h3>
						<p>&nbsp;&nbsp; <%=item.Description.TrimmedWord(24) %> </p>
					</div>	
				</div>
            <% } %>
							
						</div><!--wrap hn-->
			<div class="wrap_list">
				<ul>
                <% foreach (var item1 in Model.Articles)
                    { %>
                       
                          <li><%= Html.ContentLink(item1,16)%></li> 
                       
                   <%} %>
				</ul>
			</div><!--wrap list-->
		</div>
		<div class="bottom_hot_news"><img width="674" height="14" alt="nguonnhanluc" src="<%=Url.Content("~/images/bg_lsnews_bottom.jpg")%>" /></div>
			</div>
            