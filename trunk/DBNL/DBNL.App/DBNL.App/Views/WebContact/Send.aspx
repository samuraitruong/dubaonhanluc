<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/FO.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="DBNL.App.Extensions" %>
<asp:Content ContentPlaceHolderID="headerPlaceHolder" runat="server">
<link type="text/css" rel="Stylesheet" href="<%=Url.Content("~/Content/table.css") %>" />
    <link rel="Stylesheet" type="text/css" href="<%=Url.Content("~/Content/news_article.css")%>"></link>
    <style type="text/css">
        .news_article 
        {
            min-height:950px !important;
        }
        .field-validation-error
        {
            color:Red;
        }
        
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".stripeMe tr").mouseover(function () { $(this).addClass("over"); }).mouseout(function () { $(this).removeClass("over"); });
            $(".stripeMe tr:even").addClass("alt");
        });
</script>
<link rel="Stylesheet" type="text/css" href="<%=Url.Content("~/Content/text.css")%>"/>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="ex" id="hot_news">
		<div class="top_hot_news">
			<h2>Gửi ý kiến/Yêu cầu</h2>
		</div>
		<div class="news_article">
<div class="top_page clearfix">
				<% Html.RenderPartial("ControlBar"); %>
			</div>

            <div id="feedback">
            <p class="intro">Trong quá trình sử dụng website để tra cứu thông tin nếu quý khách thấy có nhưng sai sót hoặc có những ý kiến đóng góp khác giúp phát triển website trung tâm tốt hơn xin vui lòng điền form bên dưới và  gửi phản hồi cho chúng tôi. Mọi sự đóng góp của quý khách đều có giá trị và rất đáng trân trọng.</p>
            <p class="small"><span class="asterisk">*</span> = bắt buộc</p>
			    <% using (Html.BeginForm("Send", "WebContact", FormMethod.Post, new { enctype = "multipart/form-data" })){%>
                     <%= Html.ValidationSummary(true)%>
				<label for="title2">
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																							
					Tên
					<span class="small">
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																									
						(Họ, Tên)
					</span>
				</label>
                <%= Html.TextBox("Name", null, new { @class="field"}) %> 

				<br>
                <%=Html.ValidationMessage("Name")%>	<br />
                <label for="title2">
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																							
					Công ty
					<span class="small">
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																									
						(nếu có)
					</span>
				</label>
				<%= Html.TextBox("Company", null, new { @class="field"}) %><br>

                <label for="title2">Địa chỉ</label>
				<%= Html.TextBox("Address", null, new { @class="field"}) %><br>
                <label for="title2">Điện Thoại</label>
				<%= Html.TextBox("Phone", null, new { @class="field"}) %><br>

				<label for="title">
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																					
					Email
					<span class="asterisk">*</span>
				</label>
				<%= Html.TextBox("Email", null, new { @class="field"}) %><br>
                <%=Html.ValidationMessage("Email")%>	<br />
                <label for="title">
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																					
					Chủ đề
					<span class="asterisk">*</span>
				</label>
				<%= Html.TextBox("Subject", null, new { @class="field"}) %><br>
                <%=Html.ValidationMessage("Subject")%>	<br />
				<label for="message">
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																							
					Nội dung
					
				</label>
                <% = Html.TextArea("Message", new { scroll="auto", @class ="field", rows=14})%>
                <br>
				<%= Html.GenerateCaptcha()%>	
                <%=Html.ValidationMessage("_FORM")%>		
                <br>																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																													
				<button class="button" type="submit">Gởi đi</button>
			<%} %>
		    </div>
	
		</div>
	</div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="UnderMenuContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MidlePageMainContent" runat="server">
</asp:Content>

