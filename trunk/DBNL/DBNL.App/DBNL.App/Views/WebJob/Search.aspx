<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/FO.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.Job>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="ex" id="hot_news">
		<div class="top_hot_news">
			<h2>Tìm kiếm công việc</h2>
		</div>
		<div class="news_article">
			<div class="top_page clearfix">
            <% Html.RenderPartial("ControlBar"); %>
			</div>
			<div class="content">
                Trang này hiện tại chưa hoàn thành, bạn vui lòng quay lại sau.
            </div>
        </div>
		<div class="bottom_news_article">
			<div class="top_page clearfix">
                <% Html.RenderPartial("ControlBar"); %>
			</div>
			<!--top page-->
		</div>
        
        </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="headerPlaceHolder" runat="server">
<link type="text/css" rel="Stylesheet" href="<%=Url.Content("~/Content/job.css") %>" />
<link type="text/css" rel="Stylesheet" href="<%=Url.Content("~/Content/news_article.css") %>" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="UnderMenuContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MidlePageMainContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LeftBottomNavigationContent" runat="server">
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="BottomMainContent" runat="server">
</asp:Content>

