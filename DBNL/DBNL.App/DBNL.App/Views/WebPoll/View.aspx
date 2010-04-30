<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/FO.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.ViewData.PublicPollViewData>" %>
<%@ Import Namespace="DBNL.App.Models.Extensions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<div class="ex" id="hot_news">
		<div class="top_hot_news">
			<h2>Danh mục nổi bật<a href="#">Kết quả bình chọn</a></h2>
		</div>
		<div class="news_article"  style="min-height:0px;">
			<div class="top_page clearfix">
				<% Html.RenderPartial("ControlBar"); %>
			</div>
			<!--top page-->
			<div class="news_article_detail">
            <table width="100%" cellspacing="0" cellpadding="0" border="0">
					<tbody><tr>
						<td><table width="100%" cellspacing="0" cellpadding="0" border="0">
								<tbody><tr>
									<td align="right" class="VoteRemark">&nbsp;</td>
								</tr>
								<tr>
									<td class="Title"><font color="#000000" style="font-weight: bold; font-size: 12px;"><%=Model.ActivePoll.PollName %></font></td>
								</tr>
							</tbody></table>
							<table width="100%" cellspacing="1" cellpadding="3" border="0">
								<tbody>
                                <% var colors = new string[] { "#ff3300", "#004000", "#004080", "#ff0080", "#008080", "#a89395", "#28ab35", "#8b4617", "#6d74ba", "#21cbc9" }; %>
                                <%var index = 0; %>
                                <% foreach (var item in Model.Questions)
                                   { %>
                                <tr height="22">
									<td bgcolor="#cafdf7" class="VoteShow"><% =Html.Encode(item.Question) %></td>
									<td bgcolor="#cafdf7" class="VoteShow"><table height="20" cellspacing="0" cellpadding="0" border="0" align="left">
											<tbody><tr>
												<td width="<%=Math.Round((item.Percent *100)) %>" bgcolor="<%=colors[index++] %>">&nbsp;</td>
												<td class="VoteShow">&nbsp;<% = string.Format("{0:#.00%}", item.Percent)%></td>
											</tr>
										</tbody></table></td>
									<td bgcolor="#cafdf7" align="right" class="VoteShow"><% = item.Responses %>&nbsp;phiếu</td>
								</tr>
								<%} %>	
                                <tr height="25">
									<td bgcolor="#cafdf7" align="right" class="VoteShow" colspan="3">Tổng cộng: <%= Model.TotalResponses %>&nbsp;phiếu</td>
								</tr>
                                							
							</tbody></table></td>
					</tr>
				</tbody></table>

            <% Html.PollChart(Model, 640, 480, System.Web.UI.DataVisualization.Charting.SeriesChartType.Pie, this);%>
				</div>
			<div class="clear"></div>
		</div>
		<div class="bottom_news_article">
			<div class="top_page clearfix">
				<% Html.RenderPartial("ControlBar"); %>
			</div>
		</div>
	</div>
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="headerPlaceHolder" runat="server">
<link href="<%=Url.Content("~/Content/news_article.css")%>" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="UnderMenuContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MidlePageMainContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LeftBottomNavigationContent" runat="server">
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="BottomMainContent" runat="server">
</asp:Content>

