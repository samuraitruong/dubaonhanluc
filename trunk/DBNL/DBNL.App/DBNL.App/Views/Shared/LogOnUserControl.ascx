<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="DBNL.App.Views.Shared"%>
<%
    if (Request.IsAuthenticated) {
%>
        <% = BOMasterStrings.Welcome%> <b><%= Html.Encode(Page.User.Identity.Name) %></b>!
        [ <%= Html.ActionLink(BOMasterStrings.LogOff, "LogOff", "Security") %> ]
        <ul class="Language">
            <li><%= Html.ActionLink(BOMasterStrings.Vn, "Lang", "Generic", new { Language = "vi", ReturnUrl = this.Request.RawUrl }, null)%></li>
            <li><%= Html.ActionLink(BOMasterStrings.En, "Lang", "Generic", new { Language = "en", ReturnUrl = this.Request.RawUrl }, null)%></li>
        </ul>
<%
    }
    else {
%> 
        [ <%= Html.ActionLink("Log On", "LogOn", "Account") %> ]
<%
    }
%>
