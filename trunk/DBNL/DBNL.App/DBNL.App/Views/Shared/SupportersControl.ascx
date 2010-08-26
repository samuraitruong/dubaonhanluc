<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Supporter>>" %>
<%@ Import Namespace="DBNL.App.Models.Statics" %>

<div class="wrap_support clearfix">
    <% foreach (var item in Model) { %>
        <div class="support">
        <% if(item.Type == SupportTypes.Skype.ToString()) { %>
            <a href="skype:?chat"><img src="<%=Url.Content("~/images")%>/skype_on.jpg" alt="<% =Html.Encode(item.NickName)%>" /></a>
                <a href="skype:<% =Html.Encode(item.NickName)%>?chat">Skype</a>
                <% } else { %>
                <a href="ymsgr:sendIM:<% =Html.Encode(item.NickName)%>"><img src="http://artseed.vn/yahoo.php?n=<% =Html.Encode(item.NickName)%>&s=108&tick=<%=DateTime.Now.Ticks %>" alt="<% =Html.Encode(item.NickName)%>" /></a>
                <a href="ymsgr:sendIM:<% =Html.Encode(item.NickName)%>" title="<%=item.Name %>"><%=item.Name %></a>
                <% } %>
                
        </div>

    <% } %>
</div>