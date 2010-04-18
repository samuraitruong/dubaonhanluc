<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/FO.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.ViewData.PublicPollViewData>" %>
<%@ Import Namespace="DBNL.App.Models.Extensions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="ex" id="hot_news">
		<div class="top_hot_news">
			<h2>Danh mục nổi bật<a href="#">Kết quả bình chọn</a></h2>
		</div>
		<div class="news_article"  style="min-height:0px;">
			<div class="top_page clearfix">
				<div class="pageitem fr"><a href="#"><img alt="b1" src="/images/icon_b1.png"></a>&nbsp;&nbsp;<a href="#"><img alt="b2" src="/images/icon_b2.png"></a>&nbsp;&nbsp;<a href="#"><img alt="b3" src="/images/icon_b3.png"></a></div>
			</div>
			<!--top page-->
			<div class="news_article_detail">
            <% Html.PollChart(Model, 640, 480, this);%>
				</div>
			<div class="clear"></div>
		</div>
		<div class="bottom_news_article">
			<div class="top_page clearfix">
				<div class="pageitem fr"><a href="#"><img alt="b1" src="images/icon_b1.png"></a>&nbsp;&nbsp;<a href="#"><img alt="b2" src="images/icon_b2.png"></a>&nbsp;&nbsp;<a href="#"><img alt="b3" src="images/icon_b3.png"></a></div>
			</div>
		</div>
	</div>
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="headerPlaceHolder" runat="server">
<link href="<%=Url.Content("~/Content/news_article.css")%>" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="UnderMenuContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MidlePageMainContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LeftBottomNavigationContent" runat="server">
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="BottomMainContent" runat="server">
</asp:Content>

