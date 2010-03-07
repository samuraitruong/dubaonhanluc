<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PublicPollViewData>" %>
<% if(Model.ActivePoll != null) { %>

<div class="module">
	<div class="top_module">
		<h2><a name="poll">THĂM DÒ Ý KIẾN</a></h2>
	</div>
    <% using (Html.BeginForm("DoPoll", "WebPoll", new {id=Model.ActivePoll.Id },FormMethod.Post))
       {%>
            <div class="center_module">
		        <div class="boxy">
			<p><strong><%=Html.Encode(Model.ActivePoll.PollName) %></strong></p>
			<ul>
					<% foreach (var item in Model.Questions)
                      { %>				
                       <li> <%=Html.RadioButton("QuestionId", item.Id.ToString(), new { })%>
                            <label><%=item.Question%></label>
                       </li>
                    <%} %>
			</ul>
			<div class="clear"></div>
			<p>
				<input type="submit" class="k1" value="Biểu quyết" name=""/>
				<input type="button" class="k1" onclick="location.href='<% = Url.Action("View","WebPoll") %>" value="Xem kết quả" name=""/>
                <%--<%= Html.ActionLink("Xem Kết quả", "View", "WebPoll", new { id = Model.ActivePoll.Id}, new { @class = "k1" })%>--%>
			</p>
    </div>
            </div>
    <%} %>
    <div class="bottom_module"><img width="231" height="18" alt="nguonnhanluc" src="images/bg_module_bottom.png"></div>
</div>
<%} %>