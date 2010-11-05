<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="DBNL.App.Extensions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>ContactUsSimple</title>
    <link rel="Stylesheet" type="text/css" href="<%=Url.Content("~/Content/text.css")%>"/>
    <style type="text/css">
        .news_article 
        {
            min-height:950px !important;
        }
        .field-validation-error
        {
            color:Red;
        }
        body
        {
            width:600px;
        }
    </style>
</head>
<body>
    <div id="feedback">
            <p class="small"><span class="asterisk">*</span> = bắt buộc</p>
			    <% using (Html.BeginForm("ContactUs", "WebContact", FormMethod.Post, new { enctype = "multipart/form-data" })){%>
                     <%= Html.ValidationSummary(true)%>
				<label for="title2">
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																							
					Tên
					<span class="small">
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																									
						(Họ, Tên)
					</span>
				</label>
                <%= Html.TextBox("Name", null, new { @class="field"}) %> 

				<br>
                <%=Html.ValidationMessage("Name")%>
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
				<button class="button" type="submit">Gởi đi</button>
			<%} %>
		    </div>
</body>
</html>
