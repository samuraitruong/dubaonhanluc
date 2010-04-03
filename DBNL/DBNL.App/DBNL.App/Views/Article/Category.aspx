<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/FO.Master" Inherits="System.Web.Mvc.ViewPage<CategoryViewData>" %>
<%@ Import Namespace="DBNL.App.Models.ViewData" %>
<%@ Import Namespace="DBNL.App.Models.Extensions" %>


<asp:Content ID="Content5" ContentPlaceHolderID="headerPlaceHolder" runat="server">
    <link rel="Stylesheet" type="text/css" href="<%=Url.Content("~/Content/news_article.css")%>" ></link>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="ex" id="hot_news">
		<div class="top_hot_news">
			<h2>Danh mục nổi bật<a href="#">Tin tức và sự kiện</a></h2>
		</div>
		<div class="news_article">
			<div class="top_page clearfix">
				<div class="fl"><a href="#"><img alt="nguonnhanluc" src="<%= Url.Content("~/images/sort_a.jpg") %>"></a> <a href="#"><img alt="nguonnhanluc" src="<%= Url.Content("~/images/sort_b.jpg") %>"></a> <a href="#"><img alt="nguonnhanluc" src="<%= Url.Content("~/images/sort_c.jpg") %>"></a></div>
				<div class="pageitem fr">Trang: <a class="active">1</a> | <a href="/index.php?artseed=articles&amp;cid=349&amp;idActive=349&amp;page=2#neo_content">2 | </a><a href="/index.php?artseed=articles&amp;cid=349&amp;idActive=349&amp;page=3#neo_content">3 | </a><a href="/index.php?artseed=articles&amp;cid=349&amp;idActive=349&amp;page=4#neo_content">4 | </a><a href="/index.php?artseed=articles&amp;cid=349&amp;idActive=349&amp;page=5#neo_content">5 | </a><a href="/index.php?artseed=articles&amp;cid=349&amp;idActive=349&amp;page=6#neo_content">6</a></div>
			</div>
			<!--top page-->
            <% foreach (var item in Model.Articles)
               {
                   if (item.IsFeatured.HasValue && item.IsFeatured.Value == true)
                   {
                   %>
                    <div class="im_news clearfix">
        				<div class="pic"> <a href=""><img width="140" height="110" alt="nguonnhanluc" src="upload/images/artseed-1267775708.jpg"/></a> </div>
        				<div class="des">
        					<h3>
                                <%= Html.ActionLink((item.Title), 
                                DBNL.App.Models.Statics.Actions.View.ToString(), 
                                DBNL.App.Models.Statics.Controllers.Article.ToString(),
                                new {id=item.ContentId},
                                null)
                             %>
                             <small>(<%=item.UpdatedDate.ToVNString() %>)</small></h3>
        					<p><% = Html.Encode(item.Description) %></p>
        				</div>
		        	</div>
                   <% }
                   else
                   { %>
                    <div class="im_news_object">
                    	<div class="im_news_pic"><a href="#neo_content"><img width="110" alt="nguonnhanluc" src="upload/images/artseed-1267775337.jpg"></a></div>
                    	<h3>
                            <%= Html.ActionLink((item.Title), 
                                DBNL.App.Models.Statics.Actions.View.ToString(), 
                                DBNL.App.Models.Statics.Controllers.Article.ToString(),
                                new {id=item.ContentId},
                                null)
                             %>
                        <small>(<%=item.UpdatedDate.ToVNString() %>)</small></h3>
                    	<p><% = Html.Encode(item.Description) %></p>
                  </div>
            <%}
               }%>
			
			

		</div>
		<div class="bottom_news_article">
			<div class="top_page clearfix">
				<div class="fl">
                    <a href="#"><img alt="nguonnhanluc" src="<% =Url.Content("~/images/sort_a.jpg")%>"></a>
                     <a href="#"><img alt="nguonnhanluc" src="<% =Url.Content("~/images/sort_b.jpg")%>"></a> 
                     <a href="#"><img alt="nguonnhanluc" src="<% =Url.Content("~/images/sort_c.jpg")%>"></a>
                 </div>
				<div class="pageitem fr">Trang: <a class="active">1</a> | <a href="/index.php?artseed=articles&amp;cid=349&amp;idActive=349&amp;page=2#neo_content">2 | </a><a href="/index.php?artseed=articles&amp;cid=349&amp;idActive=349&amp;page=3#neo_content">3 | </a><a href="/index.php?artseed=articles&amp;cid=349&amp;idActive=349&amp;page=4#neo_content">4 | </a><a href="/index.php?artseed=articles&amp;cid=349&amp;idActive=349&amp;page=5#neo_content">5 | </a><a href="/index.php?artseed=articles&amp;cid=349&amp;idActive=349&amp;page=6#neo_content">6</a></div>
			</div>
			<!--top page-->
		</div>
	</div>

    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="UnderMenuContent" runat="server">
<% Html.RenderPartial("ListFeatureNews", Model.FeaturedArticles); %>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MidlePageMainContent" runat="server">
</asp:Content>

