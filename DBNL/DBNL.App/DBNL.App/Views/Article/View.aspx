<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/FO.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.Content>" %>
<%@ Import Namespace="DBNL.App.Models.Extensions" %>
<asp:Content ContentPlaceHolderID="headerPlaceHolder" runat="server">
    <link rel="Stylesheet" type="text/css" href="<%=Url.Content("~/Content/news_article.css")%>"></link>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="ex" id="hot_news">
		<div class="top_hot_news">
			<h2>Danh mục nổi bật<a href="#">Tin tức và sự kiện</a></h2>
		</div>
		<div class="news_article">
			<div class="top_page clearfix">
				<div class="pageitem fr"><a href="#"><img alt="b1" src="<%=Url.Content("~/images/icon_b1.png") %>"></a>&nbsp;&nbsp;<a href="#"><img alt="b2" src="<%=Url.Content("~/images/icon_b2.png") %>"></a>&nbsp;&nbsp;<a href="#"><img alt="b3" src="<%=Url.Content("~/images/icon_b3.png") %>"></a></div>
			</div>
			<!--top page-->
			<div class="news_article_detail">
				<h2><% =Model.Title.ToUpper() %><small>(<% =Model.UpdatedDate.ToVNString() %>)</small></h2>
                <% = Model.Content1 %>
			</div>
			<div style="clear: both;" class="otherpage">
				<h4>Chuyên mục khác</h4>
				<ul class="k_otherpage">
										<li><a href="ad-349-349-630--THANG-DAU-NAM--KINH-TE-TP-DANG-PHUC-HOI-VA-MOT-SO-LINH-VUC-CO-TOC-DO-TANG-TRUONG-CAO.html#neo_content"> 2 THÁNG ĐẦU NĂM 2010: KINH TẾ TP ĐANG PHỤC HỒI VÀ MỘT SỐ LĨNH VỰC CÓ TỐC ĐỘ TĂNG TRƯỞNG CAO </a></li>
										<li><a href="ad-349-349-622-LAO-DONG-PHO-THONG-CAU-CAO--CUNG-THAP.html#neo_content"> LAO ĐỘNG PHỔ THÔNG: CẦU CAO - CUNG THẤP </a></li>
										<li><a href="ad-349-349-617-DAU-NAM-DOANH-NGHIEP-DO-MAT-TIM-LAO-DONG.html#neo_content"> ĐẦU NĂM DOANH NGHIỆP "ĐỎ MẮT" TÌM LAO ĐỘNG </a></li>
										<li><a href="ad-349-349-612-CO-HOI-VIEC-LAM-CHO-LAO-DONG-CO-TRINH-DO-THAP.html#neo_content"> CƠ HỘI VIỆC LÀM CHO LAO ĐỘNG CÓ TRÌNH ĐỘ THẤP </a></li>
										<li><a href="ad-349-349-593-THI-TRUONG-LAO-DONG-THIEU-TAY-NGANG-THUA-CO-NGHE.html#neo_content"> THỊ TRƯỜNG LAO ĐỘNG: THIẾU "TAY NGANG" THỪA "CÓ NGHỀ" </a></li>
										<li><a href="ad-349-349-588-THI-TRUONG-LAO-DONG-TPHCM-DAU-NAM-.html#neo_content"> THỊ TRƯỜNG LAO ĐỘNG TPHCM ĐẦU NĂM 2010 </a></li>
										<li><a href="ad-349-349-584-NHUNG-NGANH-NGHE-THOI-THUONG-HIEN-NAY.html#neo_content"> "NHỮNG NGÀNH NGHỀ THỜI THƯỢNG HIỆN NAY" </a></li>
										<li><a href="ad-349-349-577-KHAT-NHAN-SU-DAU-NAM.html#neo_content"> "KHÁT" NHÂN SỰ ĐẦU NĂM </a></li>
										<li><a href="ad-349-349-565-SAU-TET-CAN--LAO-DONG.html#neo_content"> SAU TẾT, CẦN 50.000 LAO ĐỘNG </a></li>
										<li><a href="ad-349-349-562-NAM--TAO-VIEC-LAM-CHO-TREN--TRIEU-NGUOI.html#neo_content"> NĂM 2010: TẠO VIỆC LÀM CHO TRÊN 1,5 TRIỆU NGƯỜI </a></li>
									</ul>
			</div>
			<div class="clear"></div>
		</div>
		<div class="bottom_news_article">
			<div class="top_page clearfix">
				<div class="pageitem fr"><a href="#"><img alt="b1" src="images/icon_b1.png"></a>&nbsp;&nbsp;<a href="#"><img alt="b2" src="images/icon_b2.png"></a>&nbsp;&nbsp;<a href="#"><img alt="b3" src="images/icon_b3.png"></a></div>
			</div>
			<!--top page-->
		</div>
	</div>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="UnderMenuContent" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MidlePageMainContent" runat="server">
</asp:Content>
