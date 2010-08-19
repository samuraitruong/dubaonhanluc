<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.ContentCategory>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Danh Mục
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Danh Mục :<%=Model.CategoryName %></h2>

    <ul class="topnav">
            <li>
                <%=Html.ActionLink("Xem tất cả bài viết", "Index","Content") %>
            </li>
            <li>
                <%=Html.ActionLink("Thêm bài viết mới", "CreateIn", "Content", new { id= Model.ID}, null)%>
                
            </li>
        </ul>
        <div style="clear:both"/>
     <div style="padding-top:5px">
         
         <div>
            <table id="article_grid" cellpadding="0" cellspacing="0">
            </table>
            <div id="article_grid_pager" style="text-align: center;"/>
        </div>
     </div>
        <ul id="myMenu" class="contextMenu">
            <li class="edit">
                <a href="#add" id="ctCreateIn">Thêm bài viết</a>
            </li>
            <li class="cut separator">
                <a href="#cut">Cut</a>
            </li>
            <li class="copy">
                <a href="#copy">Copy</a>
            </li>
            <li class="paste">
                <a href="#paste">Paste</a>
            </li>
            <li class="delete">
                <a href="#delete">Delete</a>
            </li>
            <li class="quit separator">
                <a href="#quit">Quit</a>
            </li>
        </ul>
        
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptContent">
    <script language="javascript" type="text/javascript" src="<%= Url.Content("~/Scripts/GridData.js") %>"></script>
    <script type="text/javascript">
    function UpdateCreateInLink(id) {
        var createInAction = '<% = Url.Action("CreateIn", "Content") %>/';
        $("#dynamicLink").empty();
        var a = $("<a/>", {href:createInAction +id, text:'Thêm bài viết vào mục này.' });
        $("#dynamicLink").append(a);

        $(".topnav >li:last a").attr("href", createInAction +id);
    }

    function afterShowFormEdit(form) {
        //alert(form[0].IsFeatured);
        //ABC = form;
    }
    function InitCheckBox(element) {
        if($(element).val()=="True") {
            
            $(element).attr("checked", 'checked')
            }
    }
$(document).ready(function () {

            DBNL.Admin.Categories.Articles.setupGrid($("#article_grid"), $("#article_grid_pager"));
        });

        DBNL.Admin.Categories.Articles= {
            setupGrid: function (grid, pager) {
                var lastsel;
                grid.jqGrid({
                    url: "<%=Url.Action("List", "Content" )%>",
                    editurl : "<%=Url.Action("EditRow", "Content" )%>",
                    ajaxGridOptions: {
                        type: "POST"
                    },
                    datatype: "json",
                    colNames: [ 'Id','Tiêu đề', 'Hình','Ngày đăng', 'Url','Featured' ,'Forcusing','Trạng Thái',''],
                    colModel: [
                        { name: 'Id', index: 'Id', width: 40, align: 'left', sortable: false,editable: false, key: true, editoptions: {readonly:'readonly'},editrules: { edithidden: true }, hidden: true },
                        { name: 'Title', index: 'Title', width: 250, sortable: true, editable: true, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
                        { name: 'Thumbnail', index: 'Thumbnail', align:'center', formatter:imageFormater,width: 60, sortable: false, editable: false, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
                        { name: 'PostedDate', index: 'CreatedDate', align:'center',width: 60, sortable: true, editable: false, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
                        { name: 'Url', index: 'Url', align:'left', formatter:'link', formatoptions: {target:'_blank'},width: 80, sortable: false, editable: false, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
                        { name: 'Featured', index: 'Featured', align:'center', formatter:'checkbox', formatoptions: {disabled:true},width: 80, sortable: false, editable: false, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
                        { name: 'IsForcusing', index: 'IsForcusing', align:'center', formatter:'checkbox', formatoptions: {disabled:true},width: 80, sortable: false, editable: false, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
                        { name: 'Status', index: 'Status', align:'center', formatter:'text',width: 50, sortable: true, editable: false, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
                        { name: 'Options', index: 'Options', align:'center', formatter:'text',width: 50, sortable: false, editable: false, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false }
                      ],
                    rowNum: 10,
                    rowList: [5,10,15, 20,25, 30,40,50,60,70,80,90,100],
                    pager: pager,
                    sortname: 'ContentId',
                    sortorder: "desc",
                    viewrecords: true,
                    width: '100%',
                    height: '100%',
                    autowidth: true,
                    rownumbers: true,
                    postData : {CategoryId: <%= Model.ID %>},
                    caption: 'Danh sách bài viết trong mục : <%= Model.CategoryName %>',
                    loadComplete: function(){ 
                            var ids = jQuery("#article_grid").getDataIDs(); 
                            for(var i=0;i<ids.length;i++){ 
                                    var cl = ids[i];
                                    //var up = '<a  class="Up" rel="' +cl + '" href="<%=Url.Action("Up","Navigation")%>/' + cl +'" ><img src="<%=Url.Content("~/Images/arrow_up.png") %>" /></a>';
                                    //var down = '<a  class="Down" rel="' +cl + '" href="<%=Url.Action("Up","Navigation")%>/' + cl +'" ><img src="<%=Url.Content("~/Images/arrow_down.png") %>" /></a>';
                                    var edit = '<a  class="Edit" rel="' +cl + '" href="<%=Url.Action("Edit","Content")%>/' + cl +'" ><img src="<%=Url.Content("~/Images/edit_medium.png") %>" /></a>';
                                    jQuery("#article_grid").setRowData(ids[i],{Options:edit}) ;
                            } 
                    } ,
                    onRightClickRow  : function () {
                            //alert('click');
                    },


                }).navGrid('#article_grid_pager', { edit: true, add: true, del: true, search: true, view: true },{},{},{url:'<%=Url.Action("JsonDelete", "Content" )%>'}).navButtonAdd('#article_grid_pager',{
                           caption:"Active/Inactive", 
                           buttonicon:"ui-icon-power", 
                           onClickButton: function(){ 
                             
                                 var myid = jQuery("#article_grid").jqGrid('getGridParam','selrow'); 
                                 
                                 if (myid) { 
                                        
                                         var ret = jQuery("#article_grid").getRowData(myid); 
                                         $.ajax({
                                                  type: 'POST',
                                                  url: "<%=Url.Action("ToggleActive", "Content" )%>",
                                                  data: {Id : ret["Id"]},
                                                  success: function() {
                                                    $("#article_grid").trigger("reloadGrid")
                                                  },
                                                  dataType: 'json'
                                                });

                                 } else { 
                                 alert("Chưa chọn dòng nào");
                                 } 
                             } ,
                           position:"last"
            }).navButtonAdd('#article_grid_pager',{
                           caption:"Show/Unshow on HP", 
                           buttonicon:"ui-icon-power", 
                           onClickButton: function(){ 
                             
                                 var myid = jQuery("#article_grid").jqGrid('getGridParam','selrow'); 
                                 
                                 if (myid) { 
                                        
                                         var ret = jQuery("#article_grid").getRowData(myid); 
                                         $.ajax({
                                                  type: 'POST',
                                                  url: "<%=Url.Action("ToggleOnHP", "Content" )%>",
                                                  data: {Id : ret["Id"]},
                                                  success: function() {
                                                    $("#article_grid").trigger("reloadGrid")
                                                  },
                                                  dataType: 'json'
                                                });

                                 } else { 
                                 alert("Bạn phải chọn một dòng để thực hiện thao tác này.");
                                 } 
                             } ,
                           position:"last"
            });
            }}
            
</script>
</asp:Content>

