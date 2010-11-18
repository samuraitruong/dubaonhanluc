<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/FO.Master" Inherits="System.Web.Mvc.ViewPage<ViewContentDataView>" %>
<%@ Import Namespace="DBNL.App.Models.Extensions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headerPlaceHolder" runat="server">
    <link rel="Stylesheet" type="text/css" href="<%=Url.Content("~/Content/news_article.css")%>"></link>
     <script type="text/javascript" src="<%=Url.Content("~/Content/flowplayer/example/")%>/flowplayer-3.2.4.min.js"></script>
    <script language="JavaScript" type="text/javascript">
        $(document).ready(function () {
            $('.player').each(function () {

                flowplayer($(this).attr('id'), '<%=Url.Content("~/Content/flowplayer")%>/flowplayer-3.2.5.swf');

            });
        });
        
        </script>

	<% var cf = ((SiteConfigurations)ViewData["Configuration"]);%>
    <% if (!cf.ProtectAllContent && Model.Content.Protected)
       { %>
    <%Html.RenderPartial("ProtectedContentControl"); %>
    <%} %>
	
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
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

<asp:Content ID="Content3" ContentPlaceHolderID="UnderMenuContent" runat="server">
<% Html.RenderPartial("ListFeatureNews", Model.FeaturedContents); %>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MidlePageMainContent" runat="server">
</asp:Content>
