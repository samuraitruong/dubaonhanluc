<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/FO.Master" Inherits="System.Web.Mvc.ViewPage<ViewContentDataView>" %>
<%@ Import Namespace="DBNL.App.Models.Extensions" %>
<asp:Content ContentPlaceHolderID="headerPlaceHolder" runat="server">
    <link rel="Stylesheet" type="text/css" href="<%=Url.Content("~/Content/news_article.css")%>"></link>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="ex" id="hot_news">
		<div class="top_hot_news">
			<h2><% =Html.Label(Model.Content.ContentCategory.ContentCategory1 != null ? Model.Content.ContentCategory.ContentCategory1.CategoryName : "")%>
            <% = Html.CategoryLink(Model.Content.ContentCategory) %>
            </h2>
		</div>
		<div class="news_article">
			<div class="top_page clearfix">
				<% Html.RenderPartial("ControlBar"); %>
			</div>
			<!--top page-->
			<div class="news_article_detail">
				<h2><% =Model.Content.Title.ToUpper() %><small>(<% =Model.Content.CreatedDate.ToVNString() %>)</small></h2>
                <% = Model.Content.Content1 %>
			</div>
			<% Html.RenderPartial("OtherNewsView", Model.OtherNewses); %>
			<div class="clear"></div>
		</div>
		<div class="bottom_news_article">
			<div class="top_page clearfix">
				<% Html.RenderPartial("ControlBar"); %>
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
