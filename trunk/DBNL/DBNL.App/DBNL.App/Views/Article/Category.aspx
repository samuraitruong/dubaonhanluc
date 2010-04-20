<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/FO.Master" Inherits="System.Web.Mvc.ViewPage<CategoryViewData>" %>
<%@ Import Namespace="DBNL.App.Models.ViewData" %>
<%@ Import Namespace="DBNL.App.Models.Extensions" %>
<%@ Import Namespace="DBNL.App.Models" %>


<asp:Content ID="Content5" ContentPlaceHolderID="headerPlaceHolder" runat="server">
    <link rel="Stylesheet" type="text/css" href="<%=Url.Content("~/Content/news_article.css")%>" ></link>
    <link rel="Stylesheet" type="text/css" href="<%=Url.Content("~/Content/pagination.css")%>" ></link>
    
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="ex" id="hot_news">
		<div class="top_hot_news">
			<h2>Danh mục nổi bật<a href="#"><%=Model.Category.CategoryName.ToUpper() %></a></h2>
		</div>
		<div class="news_article">
			<div class="top_page clearfix">
				<div class="fl"><a href="#"><img alt="nguonnhanluc" src="<%= Url.Content("~/images/sort_a.jpg") %>"/></a> <a href="#"><img alt="nguonnhanluc" src="<%= Url.Content("~/images/sort_b.jpg") %>"></a> <a href="#"><img alt="nguonnhanluc" src="<%= Url.Content("~/images/sort_c.jpg") %>"></a></div>
				<div class="pageitem fr" style="width:350px;float:right">
                     <%Html.RenderPartial("~/Views/Shared/Pagination.ascx", new PaginationViewData()
                    {
                        PageIndex = Model.ArticlesPagedList.PageIndex,
                        TotalPages = Model.ArticlesPagedList.PageCount,
                        PageActionLink = Url.Action("Category", "Article", new { id = Model.Category.ID, page = "{page}" }),
                        TotalCount = Model.ArticlesPagedList.TotalItemCount,
                        PageSize = Model.ArticlesPagedList.PageSize
                    }); %>  
                </div>
			</div>
			<!--top page-->
            <% foreach (var item in Model.ArticlesPagedList)
               {
                   if (item.IsFeatured.HasValue && item.IsFeatured.Value == true)
                   {
                   %>
                    <div class="im_news clearfix">
        				<div class="pic"> <a href="<%=Url.Action("View","Article", new {id= item.ContentId}) %>"><img width="140" height="110" alt="nguonnhanluc" src="<%=item.ThumbnailUrl %>"/></a> </div>
        				<div class="des">
        					<h3>
                                <%= Html.ActionLink((item.Title), 
                                DBNL.App.Models.Statics.Actions.View.ToString(), 
                                DBNL.App.Models.Statics.Controllers.Article.ToString(),
                                new {id=item.ContentId},
                                null)
                             %>
                             <small>(<%=item.UpdatedDate.ToVNString() %>)</small></h3>
        					<p><% = Html.Encode(item.Description.TrimmedWord(120)) %></p>
        				</div>
		        	</div>
                   <% }
                   else
                   { %>
                    <div class="im_news_object">
                    	<div class="im_news_pic"><a href="<%=Url.Action("View","Article", new {id= item.ContentId}) %>"><img width="110" alt="nguonnhanluc" src="<%=item.ThumbnailUrl %>"></a></div>
                    	<h3>
                            <%= Html.ActionLink((item.Title), 
                                DBNL.App.Models.Statics.Actions.View.ToString(), 
                                DBNL.App.Models.Statics.Controllers.Article.ToString(),
                                new {id=item.ContentId},
                                null)
                             %>
                        <small>(<%=item.UpdatedDate.ToVNString() %>)</small></h3>
                    	<p><% = Html.Encode(item.Description.TrimmedWord(120))%></p>
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
				<div class="pageitem fr">
                     <%Html.RenderPartial("~/Views/Shared/Pagination.ascx", new PaginationViewData()
                    {
                        PageIndex = Model.ArticlesPagedList.PageIndex,
                        TotalPages = Model.ArticlesPagedList.PageCount,
                        PageActionLink = Url.Action("Category", "Article", new { id = Model.Category.ID, page = "{page}" }),
                        TotalCount = Model.ArticlesPagedList.TotalItemCount,
                        PageSize = Model.ArticlesPagedList.PageSize
                    }); %>  
                </div>
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

