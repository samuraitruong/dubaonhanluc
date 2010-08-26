<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Job>>" %>
		
			<div class="main_inside">
				<div class="top_main_inside">
					<h2>VIỆC LÀM MỚI NHẤT</h2>
				</div>
				<div class="center_main_inside">
					<div class="object">
						<ul>
                        <% foreach (var item in Model)
                           { %>
							<li>
								<div class="lstitle"><%=Html.ActionLink(item.Title, "Details", "WebJob", new { id = item.Id }, null)%></div>
								<div class="object_mt"><%--<%=Html.ActionLink(item.Company == null ? "Unknow" : item.Company, "View", "WebJob", new { id = item.Id }, null)%>--%>
                                    <%= Html.Encode(item.Company == null ? "Unknow" : item.Company) %>
                                </div>
							</li>
                            <%} %>
						</ul>
						<div class="clear"></div>
						<div class="cont_object"><strong>»</strong> <a href="<%=Url.Action("Search", "WebJob") %>">Nhấp vào đây để xem việc làm tốt nhất</a></div>
					</div>
				</div>
				<div class="bottom_main_inside"><img src="<%=Url.Content("~/images/bg_main_bottom.png") %>" alt="nguonnhanluc" height="18" width="523"></div>
			</div>
			
	