<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/FO.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="ex" id="hot_news">
		<div class="top_hot_news">
			<%--<h2>Danh mục nổi bật<a href="#">Liên kết Website</a></h2>--%>
		</div>
		<div class="news_article">
			<div class="top_page clearfix">
				<%--<% Html.RenderPartial("ControlBar"); %>--%>
			</div>
            <div id="container">
			   <p>Tài khoản của bạn đã được tạo thành công, bạn có thể <%=Html.ActionLink("Đăng nhập", "Login", "Account") %> tại đây :<%=Html.ActionLink("Click vào đây để đăng nhập", "Login", "Account") %></p>
               </div>
			<div class="clear"></div>
		</div>
		<div class="bottom_news_article">
			<div class="top_page clearfix">
				<%--<% Html.RenderPartial("ControlBar"); %>--%>
			</div>
			<!--top page-->
		</div>
	</div>
    
    

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="headerPlaceHolder" runat="server">
    <link rel="Stylesheet" type="text/css" href="<%=Url.Content("~/Content/news_article.css")%>"/>
   <style type="text/css">
        
        
         .news_article
         {
             min-height:234px !important;
         }
        </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="UnderMenuContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MidlePageMainContent" runat="server">
</asp:Content>

