<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    if (Request.IsAuthenticated) {
%>
        Welcome <b><%= Html.Encode(Page.User.Identity.Name) %></b>!
        [ <%= Html.ActionLink("Log Off", "LogOff", "Security") %> ]
        <ul class="Language">
            <li><%= Html.ActionLink("VN", "Lang", "Generic", new { Language = "vi", ReturnUrl=this.Request.RawUrl }, null)%></li>
            <li><%= Html.ActionLink("EN", "Lang", "Generic", new { Language = "en", ReturnUrl = this.Request.RawUrl }, null)%></li>
        </ul>
<%
    }
    else {
%> 
        [ <%= Html.ActionLink("Log On", "LogOn", "Account") %> ]
<%
    }
%>
