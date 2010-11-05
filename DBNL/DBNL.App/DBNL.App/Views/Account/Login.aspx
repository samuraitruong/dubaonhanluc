<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/FO.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="DBNL.App.Extensions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headerPlaceHolder" runat="server">

<link href="<%= Url.Content("~/Content/jqueryUI1.8a/css/redmond/jquery-ui-1.8.css") %>" rel="stylesheet" type="text/css" />
<link href="<%= Url.Content("~/Content/reset.css") %>" rel="stylesheet" type="text/css" />
<script src="<%= Url.Content("~/Content/jqueryUI1.8a/js/jquery-ui-1.8.min.js")%>" type="text/javascript"></script>
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
    
<link rel="Stylesheet" type="text/css" href="<%=Url.Content("~/Content/account.css")%>"/>

 <script type="text/javascript" src="<% =Url.Content("~/Content/jqueryUI1.8a/development-bundle/ui/minified/jquery.ui.datepicker.min.js")%>"></script>
     <script language="javascript" type="text/javascript">
         $(document).ready(function () {

             $('#Birthday').datepicker({ dateFormat: 'dd/mm/yy', yearRange: '2000:2020', showButtonPanel: true, buttonImage: 'http://www.marocotel.com/images/btn_datepicker.gif', buttonImageOnly: true, changeMonth: true, changeYear: true });

         });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="ex" id="hot_news">
		<div class="top_hot_news">
			<h2>Đăng nhập</h2>
		</div>
		<div class="news_article">
<div class="top_page clearfix">
				<% Html.RenderPartial("ControlBar"); %>
			</div>

            <div class="alpha">
      <div class="cage" id="join-flow-main">
        <div class="section-head">
          <div class="main-head">
            
            <h2>Nhập tên đăng nhập và mật khẩu</h2>
            
          </div>
        </div>
        <div class="section last main-info">
          <% using (Html.BeginForm("Login", "Account", FormMethod.Post, new { enctype = "multipart/form-data", @class = "international" , id="form-join" }))
             {%>
                     <%= Html.ValidationSummary(true)%>
  
  <ul>
    
    <li class="field-container"><label class="" for="inp-join-email">
      <span class="field-name">Tên tài khoản<span class="required">*</span></span>
      <%=Html.TextBox("Login")%>
      <span class="alert-error"></span></label>
      <div class="tooltip hidden link-arrow" style="display: none;">
    Check your inbox. You'll receive a confirmation email.
  </div>
    </li>
    <li class="field-container"><label class="" for="inp-join-password1">
      <span class="field-name">Mật khẩu</span>
      <%=Html.Password("Password")%><span class="alert-error"></span></label>
      <div class="tooltip hidden link-arrow">
    At least six characters.
  </div>
    </li>
    
      <li id="captcha-field-container" class="field-container" style="height:120px">
        <label class="" for="inp-captcha">
      <span class="field-name">Mã xác nhận</span>
    <span id="img-captcha" class="input-captcha" style="background-image: url(&quot;/tools/captcha/image?image=a20gl6wq7&amp;v=2&quot;);">
    
    <%= Html.GenerateCaptcha()%>	</span><span class="alert-error">
         </span></label> 
        
        
        <div class="tooltip hidden link-arrow">
    To make sure that you're not a robot from the future.
  </div>
      </li>
    <li class="field-container"><label class="" for="inp-join-email">
      <span class="field-name"></span></label>
      <%=Html.ValidationMessage("Captcha") %><br />
      <%=Html.ValidationMessage("System")%>
      

    </li>

    <li class="buttons">
      <button tabindex="21" class="shiny-positive-large-jumbo" type="submit" id="inp-join-submit">Đăng nhập</button>
      <p id="form-summary" class="form-summary"></p>
      <p class="progress"></p>
    </li>
  </ul>
  
  
<%} %>

        </div>
       <div id="disclaimer">
          Bạn chưa có tài khoản có thể đăng kí miễn phí tại đây: <%=Html.ActionLink("Đăng kí tài khoản", "Register", "Account") %>
        </div>
      </div>
    </div>	
		</div>
	</div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="UnderMenuContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MidlePageMainContent" runat="server">
</asp:Content>

