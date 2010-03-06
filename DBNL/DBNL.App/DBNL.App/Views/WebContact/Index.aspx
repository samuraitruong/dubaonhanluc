<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/FO.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DBNL.App.Models.Contact>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="ex" id="hot_news">
		<div class="top_hot_news">
			<h2>Danh mục nổi bật<a href="#">Liên kết Website</a></h2>
		</div>
		<div class="news_article">
			<div class="top_page clearfix">
				<div class="pageitem fr"><a href="#"><img alt="b1" src="images/icon_b1.png"></a>&nbsp;&nbsp;<a href="#"><img alt="b2" src="images/icon_b2.png"></a>&nbsp;&nbsp;<a href="#"><img alt="b3" src="images/icon_b3.png"></a></div>
			</div>
			<!--top page-->
	        <ul>
                <% foreach (var item in Model)
                   { %>
                        <li><a href="mailto:<% =item.Email %>" target="_blank"><%=Html.Encode(item.Name)%></a></li>
                <%} %>
           </ul>
			<div class="clear"></div>
		</div>
		<div class="bottom_news_article">
			<div class="top_page clearfix">
				<div class="pageitem fr"><a href="#"><img alt="b1" src="images/icon_b1.png"></a>&nbsp;&nbsp;<a href="#"><img alt="b2" src="images/icon_b2.png"></a>&nbsp;&nbsp;<a href="#"><img alt="b3" src="images/icon_b3.png"></a></div>
			</div>
			<!--top page-->
		</div>
	</div>
    
    

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="headerPlaceHolder" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="UnderMenuContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="UnderMainContent" runat="server">
</asp:Content>

