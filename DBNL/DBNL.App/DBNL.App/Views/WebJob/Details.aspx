<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/FO.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.Job>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="ex" id="hot_news">
		<div class="top_hot_news">
			<h2>Thông tin chi tiết về công việc</h2>
		</div>
		<div class="news_article">
			<div class="top_page clearfix">
            <% Html.RenderPartial("ControlBar"); %>
			</div>
			<div class="content">
                <div class="ns_temp_top">
                    <div class="left"></div>
                        <div class="center">Thông tin công ty.</div>
                        <div class="right"></div>
                    </div>
                <div class="ns_temp_content">
                    <div class="ns_detail">
                        <h3><%=Model.Company %></h3>
                        <p><%=Model.CompanyInfo %></>p

                        <div class="clear"></div>
                    </div>
                </div>

                <div class="break_module"></div>


                <div class="ns_temp_top">
                    <div class="left"></div>
                        <div class="center">Thông tin công việc.</div>
                        <div class="right"></div>
                    </div>
                <div class="ns_temp_content">
                    <div class="ns_detail">
                        <h3><%=Model.Title %></h3>
                        <p><%=Model.Description %></>p
                        <p><%=Model.JobDetail %></>p

                        <p>Hạn nộp hồ sơ : <span><%=Model.Deadline.ToShortDateString() %></span></p>

                        <div class="clear"></div>
                    </div>
                </div>

                <div class="break_module"></div>


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

