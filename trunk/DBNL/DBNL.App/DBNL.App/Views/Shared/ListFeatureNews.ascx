<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<DBNL.App.Models.Content>>" %>

<div id="r_module">
	<div class="r_module_top"><img width="291" height="11" alt="nguonnhanluc" src="<%=Url.Content("~/images/top_module.jpg") %>"></div>
	<div class="r_module_center">
		<h2>TIÊU ĐIỂM</h2>
         <% foreach (var item in Model)
            { %>
               <div class="tieudiem">
        			<div class="pic"><a href="<%= Url.Action( item.Title, "View","Article")%>"><img width="99" height="73" alt="nguonnhanluc" src="upload/images/artseed-1270221892.jpeg"></a></div>
        			<div class="des">
        				<p>
                            <%=Html.ActionLink(item.Title, "View","Article") %> <small><%= item.UpdatedDate.ToString("dd/MM/yyyy") %></small>
                        </p>
        			</div>
            
			        <div class="clear"></div>
		        </div>
               
           <%} %>
               
				
			
			</div>
	<div class="bottom_cat"><img width="291" height="14" alt="nguonnhanluc" src="<%=Url.Content("~/images/bg_lsdm_bottom.jpg")%>"></div>
</div>