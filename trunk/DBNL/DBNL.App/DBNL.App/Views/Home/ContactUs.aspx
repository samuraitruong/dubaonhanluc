<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/FO.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="ex" id="hot_news">
		<div class="top_hot_news">
			<h2>Liên hệ ban quản trị</h2>
		</div>
		<div class="news_article">
			<div class="top_page clearfix">
				<% Html.RenderPartial("ControlBar"); %>
			</div>
            <div id="container">
			   <iframe src="http://www.123contactform.com/contact-form-samuraitruong-90615.html" height="500"  width="100%" frameborder="0" marginheight="10" marginwidth="0" scrolling="no">
               </iframe>
               </div>
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

<asp:Content ID="Content2" ContentPlaceHolderID="headerPlaceHolder" runat="server">
    <link rel="Stylesheet" type="text/css" href="<%=Url.Content("~/Content/news_article.css")%>"/>
   <style type="text/css">
        
        #container{
            width:100%;
            height:510px;
            overflow:hidden;
    
        }
        #container iframe {
            width:100%;
            height:510;
            margin-left:-0px;
            margin-top:-69px;   
            border:0;
         }
         .news_article
         {
             min-height:0px !important;
         }
        </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="UnderMenuContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MidlePageMainContent" runat="server">
</asp:Content>

