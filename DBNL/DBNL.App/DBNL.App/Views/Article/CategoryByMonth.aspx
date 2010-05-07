<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/FO.Master" Inherits="System.Web.Mvc.ViewPage<CategoryViewData>" %>
<%@ Import Namespace="DBNL.App.Models.ViewData" %>
<%@ Import Namespace="DBNL.App.Models.Extensions" %>
<%@ Import Namespace="DBNL.App.Models" %>


<asp:Content ID="Content5" ContentPlaceHolderID="headerPlaceHolder" runat="server">
    <link rel="Stylesheet" type="text/css" href="<%=Url.Content("~/Content/news_article.css")%>" />
    <link rel="Stylesheet" type="text/css" href="<%=Url.Content("~/Content/pagination.css")%>" />
    <link rel="Stylesheet" type="text/css" href="<%=Url.Content("~/Content/jqueryUI1.8a/development-bundle/themes/base/jquery.ui.all.css")%>" />
    <link rel="Stylesheet" type="text/css" href="<%=Url.Content("~/Content/jqueryUI1.8a/css/redmond/jquery.ui.theme.css")%>" />
    <script type="text/javascript" src="<%=Url.Content("~/Content/jqueryUI1.8a/js/jquery-ui-1.8.min.js")%>" ></script>
    <script type="text/javascript" src="<%=Url.Content("~/Content/jqueryUI1.8a/development-bundle/ui/jquery.ui.datepicker.js")%>" ></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="ex" id="hot_news">
		<div class="top_hot_news">
      
			<h2><% =Html.Label(Model.Category.ContentCategory1!= null ?Model.Category.ContentCategory1.CategoryName:"")%> <%=Html.CategoryLink(Model.Category )%> (<small> <% =Model.FilterDate.ToString("MM/yyyy") %> </small>)</h2>
		</div>
		<div class="news_article">
			<div class="top_page clearfix">
				<% Html.RenderPartial("ControlBarEx", Model.Category); %>
				<div class="PagerContainer">
                    <%Html.RenderPartial("~/Views/Shared/Pagination.ascx", new PaginationViewData()
                    {
                        PageIndex = Model.ArticlesPagedList.PageNumber,
                        DisplayItems = 5,
                        TotalPages = Model.ArticlesPagedList.PageCount,
                        PageActionLink = Url.RouteUrl("Category-View-Route-By-Month" , new {month=Model.FilterDate.Month, year = Model.FilterDate.Year, category = Model.Category.Key, page = "{page}" }),
                        TotalCount = Model.ArticlesPagedList.TotalItemCount,
                        PageSize = Model.ArticlesPagedList.PageSize
                    }); %>  
                </div>
			</div>
			<!--top page-->
            <div id="contentholder">
            <% if (Model.ArticlesPagedList.TotalItemCount == 0)
               {%>
               <p>Không có tin nào được đăng vào ngày : <% =Model.FilterDate.ToVNString() %> bạn vui lòng chọn ngày khác hoặc <strong><% = Html.CategoryLink("Click vào đây",Model.Category) %> </strong> để xem các tin khác trong chủ đề này</p>
            <%} %>

            <% bool IsFirstItem = true; %>
            <% foreach (var item in Model.ArticlesPagedList)
               {
                   if(IsFirstItem) //if (item.IsFeatured)
                   {
                       IsFirstItem = !IsFirstItem;
                   %>
                    <div class="im_news clearfix" rel="Item">
        				<div class="pic"> <a href="<%=Url.ContentLink(Model.Category.Key,item) %>"><img width="140" height="110" alt="nguonnhanluc" src="<%=item.ThumbnailUrl %>"/></a> </div>
        				<div class="des">
        					<h3><%=Html.ContentLink(Model.Category.Key,item) %>
                                
                             <small>(<%=item.UpdatedDate.ToVNString() %>)</small></h3>
        					<p><% = Html.Encode(item.Description.StripHTML().ReplaceHtmlEntities().TrimmedWord(100))%></p>
        				</div>
		        	</div>
                   <% }
                   else
                   { %>
                    <div class="im_news_object" rel="Item">
                    	<div class="im_news_pic"><a href="<%=Url.ContentLink(Model.Category.Key,item) %>"><img width="110" alt="nguonnhanluc" src="<%=item.ThumbnailUrl %>"></a></div>
                    	<h3>
                            <%=Html.ContentLink(Model.Category.Key,item) %>
                        <small>(<%=item.UpdatedDate.ToVNString() %>)</small></h3>
                    	<p><% = Html.Encode(item.Description.StripHTML().ReplaceHtmlEntities().TrimmedWord(100))%></p>
                  </div>
            <%}
               }%>
			
			
            </div>
            <div class="ExtendLink">
                <p>
                    <%=Html.RouteLink("Click vào đây", "Category-View-Route-By-Date", new { month = Model.FilterDate.Month, year = Model.FilterDate.Year, category = Model.Category.Key })%> Để xem tất cả nhưng tin đăng vào <%=Model.FilterDate.ToString("MM/yyyy") %>.
                </p>
            </div>
		</div>
		<div class="bottom_news_article">
			<div class="top_page clearfix">
				<% Html.RenderPartial("ControlBarEx", Model.Category); %>

				<div class="PagerContainer">
                   <%Html.RenderPartial("~/Views/Shared/Pagination.ascx", new PaginationViewData()
                    {
                        PageIndex = Model.ArticlesPagedList.PageNumber,
                        DisplayItems = 5,
                        TotalPages = Model.ArticlesPagedList.PageCount,
                        PageActionLink = Url.RouteUrl("Category-View-Route-By-Month" , new {month=Model.FilterDate.Month, year = Model.FilterDate.Year, category = Model.Category.Key, page = "{page}" }),
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

