<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Supporter>>" %>
<%@ Import Namespace="DBNL.App.Models.Statics" %>
<%--<div class="wrap_support clearfix">
    
    <div class="support">
        <a href="ymsgr:sendIM?cuonglongan">
            <img src="<%=Url.Content("~/images")%>/yahoo_on.jpg" alt="yahoo" /></a><a href="ymsgr:sendIM?cuonglongan">Yahoo</a></div>
</div>--%>

<div class="wrap_support clearfix">
    <% foreach (var item in Model) { %>
        <div class="support">
        <% if(item.Type == SupportTypes.Skype.ToString()) { %>
            <a href="skype:mdnguyen86?chat"><img src="<%=Url.Content("~/images")%>/skype_on.jpg" alt="<% =Html.Encode(item.NickName)%>" /></a>
                <a href="skype:<% =Html.Encode(item.NickName)%>?chat">Skype</a>
                <% } else { %>
                <a href="ymsgr:sendIM:mdnguyen86"><img src="<%=Url.Content("~/images")%>/yahoo_on.jpg" alt="<% =Html.Encode(item.NickName)%>" /></a>
                <a href="ymsgr:sendIM:<% =Html.Encode(item.NickName)%>">Yahoo</a>
                <% } %>
                
        </div>

    <% } %>
</div>