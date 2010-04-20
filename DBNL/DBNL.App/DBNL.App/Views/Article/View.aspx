<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/FO.Master" Inherits="System.Web.Mvc.ViewPage<ViewContentDataView>" %>
<%@ Import Namespace="DBNL.App.Models.Extensions" %>
<asp:Content ContentPlaceHolderID="headerPlaceHolder" runat="server">
    <link rel="Stylesheet" type="text/css" href="<%=Url.Content("~/Content/news_article.css")%>"></link>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="ex" id="hot_news">
		<div class="top_hot_news">
			<h2>Danh mục nổi bật
            <% = Html.ActionLink(Model.Content.ContentCategory.CategoryName, "Category", "Article", new { id= Model.Content.CategoryId}, null) %>
            </h2>
		</div>
		<div class="news_article">
			<div class="top_page clearfix">
				<div class="pageitem fr"><a href="#"><img alt="b1" src="<%=Url.Content("~/images/icon_b1.png") %>" /></a>&nbsp;&nbsp;<a href="#"><img alt="b2" src="<%=Url.Content("~/images/icon_b2.png") %>" /></a>&nbsp;&nbsp;<a href="#"><img alt="b3" src="<%=Url.Content("~/images/icon_b3.png") %>" /></a></div>
			</div>
			<!--top page-->
			<div class="news_article_detail">
				<h2><% =Model.Content.Title.ToUpper() %><small>(<% =Model.Content.UpdatedDate.ToVNString() %>)</small></h2>
                <% = Model.Content.Content1 %>
			</div>
			<% Html.RenderPartial("OtherNewsView", Model.OtherNewses); %>
			<div class="clear"></div>
		</div>
		<div class="bottom_news_article">
			<div class="top_page clearfix">
				<div class="pageitem fr"><a href="#"><img alt="b1" src="<%=Url.Content("~/images/icon_b1.png") %>"></a>&nbsp;&nbsp;<a href="#"><img alt="b2" src="<%=Url.Content("~/images/icon_b2.png") %>"></a>&nbsp;&nbsp;<a href="#"><img alt="b3" src="<%=Url.Content("~/images/icon_b3.png") %>"></a></div>
			</div>
			<!--top page-->
		</div>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="UnderMenuContent" runat="server">
<% Html.RenderPartial("ListFeatureNews", Model.FeaturedContents); %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MidlePageMainContent" runat="server">
</asp:Content>
