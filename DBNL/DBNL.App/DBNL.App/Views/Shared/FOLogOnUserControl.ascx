<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="DBNL.App.Views.Shared"%>
<ul class="login_menu">
<%
    if (SessionManager.Account !=null)
    {
%>
       <li> [ <%= Html.ActionLink("Logout", "SignOut", "Account") %> ]</li>
<%
    }
    else {
%> 
            
            <li> [ <%= Html.ActionLink("Đăng ký", "Register", "Account") %> ]</li>
            <li> [ <%= Html.ActionLink("Đăng nhập", "Login", "Account") %> ]</li>
            
       
<%
    }
%>
</ul>