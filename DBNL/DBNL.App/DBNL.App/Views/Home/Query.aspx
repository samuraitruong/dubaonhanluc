﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/FO.Master" Inherits="System.Web.Mvc.ViewPage<IPagedList<DBNL.App.Models.Content>>" %>
<%@ Import Namespace="DBNL.App.Models.ViewData" %>
<%@ Import Namespace="DBNL.App.Models.Extensions" %>
<%@ Import Namespace="DBNL.App.Models" %>
<%@ Import Namespace="DBNL.App.Models.Helpers" %>


<asp:Content ID="Content5" ContentPlaceHolderID="headerPlaceHolder" runat="server">
    <link rel="Stylesheet" type="text/css" href="<%=Url.Content("~/Content/news_article.css")%>" />
    <link rel="Stylesheet" type="text/css" href="<%=Url.Content("~/Content/pagination.css")%>" />
    
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="ex" id="hot_news">
		<div class="top_hot_news">
      
			<%--<h2><% =Html.Label(Model.Category.ContentCategory1!= null ?Model.Category.ContentCategory1.CategoryName:"")%> <%=Html.CategoryLink(Model.Category )%></h2>--%>
		</div>
		<div class="news_article">
			<div class="top_page clearfix">
				<% Html.RenderPartial("ControlBar"); %>
				<div class="PagerContainer">
                    <%Html.RenderPartial("~/Views/Shared/Pagination.ascx", new PaginationViewData()
                    {
                        PageIndex = Model.PageNumber-1,
                        DisplayItems = 5,
                        TotalPages = Model.PageCount,
                        PageActionLink = Url.Action("Search", "Home" , new {q = ViewData["keyword"], page = "{page}"}),
                        TotalCount = Model.TotalItemCount,
                        PageSize = Model.PageSize
                    }); %>
                </div>
			</div>
			<!--top page-->
            <% bool IsFirstItem = true; %>
            <% foreach (var item in Model)
               {
                   if(IsFirstItem) //if (item.IsFeatured)
                   {
                       IsFirstItem = !IsFirstItem;
                   %>
                    <div class="im_news clearfix">
        				<div class="pic"> <a href="<%=Url.ContentLink(item.ContentCategory.Key,item) %>"><img width="140" height="110" alt="nguonnhanluc" src="<%=item.ThumbnailUrl %>"/></a> </div>
        				<div class="des">
        					<h3><%=Html.ContentLink(item.ContentCategory.Key, item)%>
                                
                             <small>(<%=item.UpdatedDate.ToVNString() %>)</small></h3>
        					<%--<p><% = Html.Encode(item.Description.TrimmedWord(115).StripHTML().ReplaceHtmlEntities())%></p>--%>
                            <p><%=item.HighlightText %></p>
        				</div>
		        	</div>
                   <% }
                   else
                   { %>
                    <div class="im_news_object">
                    	<div class="im_news_pic"><a href="<%=Url.ContentLink(item.ContentCategory.Key,item) %>"><img width="110" alt="nguonnhanluc" src="<%=item.ThumbnailUrl %>"></a></div>
                    	<h3>
                            <%=Html.ContentLink(item.ContentCategory.Key, item)%>
                        <small>(<%=item.UpdatedDate.ToVNString() %>)</small></h3>
                    	<%--<p><% = Html.Encode(item.Description.TrimmedWord(115).StripHTML().ReplaceHtmlEntities())%></p>--%>
                        <p><%=item.HighlightText %></p>
                  </div>
            <%}
               }%>
			
			

		</div>
		<div class="bottom_news_article">
			<div class="top_page clearfix">
				<% Html.RenderPartial("ControlBar"); %>

				<div class="PagerContainer">
                    <%--<%Html.RenderPartial("~/Views/Shared/Pagination.ascx", new PaginationViewData()
                    {
                        PageIndex = Model.ArticlesPagedList.PageNumber,
                        DisplayItems = 5,
                        TotalPages = Model.ArticlesPagedList.PageCount,
                        PageActionLink = Url.RouteUrl("Category-View-Route" , new { category = Model.Category.Key, page = "{page}" }),
                        TotalCount = Model.ArticlesPagedList.TotalItemCount,
                        PageSize = Model.ArticlesPagedList.PageSize
                    }); %>  --%>
                </div>
			</div>
			<!--top page-->
		</div>
	</div>

    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="UnderMenuContent" runat="server">

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MidlePageMainContent" runat="server">
</asp:Content>

