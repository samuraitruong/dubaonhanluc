<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/FO.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DBNL.App.Models.Contact>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="ex" id="hot_news">
		<div class="top_hot_news">
			<h2>Danh mục nổi bật<a href="#">Liên Hệ</a></h2>
		</div>
		<div class="news_article">
<div class="top_page clearfix">
				<% Html.RenderPartial("ControlBar"); %>
			</div>

            <% var i = 1; %>
            <h2>DANH SÁCH EMAIL TRUNG TÂM TRUNG TÂM DỰ BÁO NHU CẦU NHÂN LỰC VÀ THÔNG TIN THỊ TRƯỜNG LAO ĐỘNG TP.HCM</h2>
            <br />

	        <table width="100%" border="1" cellpadding="20" cellspacing="0" class="stripeMe">
                <thead>
                <tr style="font-weight:bolder">
                    <th>STT</th>
                    <th>DANH SÁCH</th>
                    <th>EMAIL</th>
                    </tr>
                </thead>
            <tbody>
                <% foreach (var item in Model)
                   { %>
                        <tr>
                            <td>
                            <%=i++ %>
                            </td>
                            <td><%=item.Name %></td>
                            <td><a href="mailto:<% =item.Email %>" target="_blank"><%=Html.Encode(item.Email)%></a></td>
                        </tr>
                <%} %>
                </tbody>
                </table>
			<div class="clear"></div>
            <p>
                <%=Html.ActionLink("Download PDF", "Pdf", null, new {target = "_blank" })%>
            </p>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headerPlaceHolder" runat="server">
    <link type="text/css" rel="Stylesheet" href="<%=Url.Content("~/Content/table.css") %>" />
    <link rel="Stylesheet" type="text/css" href="<%=Url.Content("~/Content/news_article.css")%>"></link>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".stripeMe tr").mouseover(function () { $(this).addClass("over"); }).mouseout(function () { $(this).removeClass("over"); });
            $(".stripeMe tr:even").addClass("alt");
        });
</script>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="UnderMenuContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MidlePageMainContent" runat="server">
</asp:Content>

