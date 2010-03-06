<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Navigation>>" %>
<%--<div id="mainnav" class="clearfix">
                <ul id="nav">
                    <li class="active"><a href='index.html#neo_content'>TRANG CHỦ</a></li>
                    <li class=""><a href='##neo_content'>GIỚI THIỆU</a>
                        <ul>
                            <li><a href='intro-358-358-Gioi-thieu-ve-trung-tam.html&amp;idActive=267#neo_content'>
                                Giới thiệu về trung tâm</a></li>
                            <li><a href='intro-359-359-Co-cau-to-chuc-bo-may.html&amp;idActive=267#neo_content'>
                                Cơ cấu tổ chức bộ máy</a></li>
                        </ul>
                    </li>
                    <li class=""><a href='articles-268-268-Viec-Lam.html#neo_content'>Việc Làm</a></li>
                    <li class=""><a href='articles-344-344-Khoa-hoc--Dao-tao.html#neo_content'>Khóa học
                        - Đào tạo</a></li>
                    <li class=""><a href='articles-345-345-Gop-y.html#neo_content'>Góp ý</a></li>
                    <li class=" end"><a href='intro-254-254-LIEN-HE.html#neo_content'>LIÊN HỆ</a></li>
                </ul>
                <!--<div id="flag"><a href='#'><img src="<%=Url.Content("~/images")%>/vn.jpg" alt="nguonnhanluc" /></a><a href='#'><img src="<%=Url.Content("~/images")%>/en.jpg" alt="nguonnhanluc" /></a></div>-->
            </div>--%>
            
<div id="mainnav" class="clearfix">
    <ul id="nav">
        <% foreach (var item in Model) { %>
        <%  %>
        <li class=""><a href="<%=item.RelativeUrl %>"><%= Html.Encode(item.Name) %></a>
            <% if(item.Navigations != null && item.Navigations.Count>0){ %>
            <ul>
                <%   
               foreach (var subItem in item.Navigations) { %>
                <li><%=Html.ActionLink(subItem.Name,subItem.Action, subItem.Controller, null,null) %></li>
            <% } %>
            </ul>
            <%} %>
        </li>
    <% } %>
    
    </ul>
</div>