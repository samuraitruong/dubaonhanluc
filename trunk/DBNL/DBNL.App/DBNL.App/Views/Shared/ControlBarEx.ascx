<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ContentCategory>" %>


<div class="fl">
    <a href="" onclick="return toListView();"><img alt="nguonnhanluc" src="<%=Url.Content("~/") %>images/sort_a.jpg"/></a> 
    <a href="#neo_content" onclick="return toColumnView();"><img  alt="nguonnhanluc" src="<%=Url.Content("~/") %>images/sort_b.jpg"/></a> 
    <a href="#neo_content" id="showPicker"><img id="datepickerImage"  alt="nguonnhanluc" src="<%=Url.Content("~/") %>images/sort_c.jpg"/></a>
    <input type="hidden" id="hiddenDate" />
    <div id="datepicker"></div>
    <script language="javascript" type="text/javascript">
        function onSelectDate(dateText, inst) {
            var redirectUrl = "/" + dateText + '<%= Url.CategoryLink(Model) %>'
            window.location.href = redirectUrl;
         }
    </script>
</div>

<div class="pageitem fr">
    &nbsp;&nbsp;
    <a href="#" rel="CtrlEmail"><img alt="b2" src="<%=Url.Content("~/")%>images/icon_b2.png"></a>&nbsp;&nbsp;
    <a href="#" rel="CtrlPrint"><img alt="b3" src="<%=Url.Content("~/")%>images/icon_b3.png"></a>
</div>