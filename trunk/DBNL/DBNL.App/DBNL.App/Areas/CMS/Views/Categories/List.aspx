<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DBNL.App.Models.ContentCategory>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Danh Mục
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Danh Mục</h2>

     <div>
        <table id="grid" cellpadding="0" cellspacing="0">
        </table>
        <div id="pager" style="text-align: center;"></div>
        
        
        <p><%=Html.ActionLink("Thêm danh mục", "Create","Categories") %></p>
    </div>
    
     <div style="padding-top:35px">
         
         <div>
            <h2>Danh sách các bài viết</h2>
            <table id="article_grid" cellpadding="0" cellspacing="0">
            </table>
            <div id="article_grid_pager" style="text-align: center;"/>
        </div>
     </div>
        <p id="P1"><%=Html.ActionLink("Thêm bài viết", "Create","Content") %></p>
        <p id="dynamicLink"><%=Html.ActionLink("Thêm bài viết", "Create","Content") %></p>
        <p><%=Html.ActionLink("Xem tất cả", "Index","Content") %></p>

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

            DBNL.Admin.Categories.setupGrid($("#grid"), $("#pager"));
            DBNL.Admin.Categories.Articles.setupGrid($("#article_grid"), $("#article_grid_pager"));
            


        });

        DBNL.Admin.Categories= {
            setupGrid: function (grid, pager) {
                var lastsel;
                grid.jqGrid({
                    url: "<%=Url.Action("List", "Categories" )%>",
                    editurl : "<%=Url.Action("EditRow", "Categories" )%>",
                    ajaxGridOptions: {
                        type: "POST"
                    },
                    datatype: "json",
                    colNames: [ 'Id','Tên','Url', 'Số bài viêt', 'Chủ đề nổi bật', 'Hiển thị trên Trang chủ',''],
                    colModel: [
                        { name: 'Id', index: 'Id', width: 40, align: 'left', editable: false, key: true, editoptions: {readonly:'readonly'},editrules: { edithidden: true }, hidden: true },
                        { name: 'Name', index: 'CategoryName', width: 200, sortable: true, editable: true, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
                        { name: 'Url', index: 'Url', width: 120, sortable: false, editable: false, formatter: 'link', formatoptions: {target : '_blank'}},
                        { name: 'Articles', index: 'Artiles', width:60, align:'center', formatter:'integer',sortable: true, editable: false, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
                        { name: 'IsFeatured', index: 'IsFeatured', align:'center', width: 80, formatter:statiCheckboxFormater, sortable: true, editable: true, edittype: 'checkbox', editoptions: {value:'True:False',dataInit: InitCheckBox} , hidden: false },
                        { name: 'ShowOnHP', index: 'ShowOnHP', align:'center', width: 80,sortable:true, formatter:statiCheckboxFormater, editable: true, edittype: 'checkbox', editoptions: {value:'True:False',dataInit: InitCheckBox} , hidden: false },
                        { name: 'Options', index: 'Options', align:'center', sortable:false, editable: false,width:40 }
                      ],
                    rowNum: 10,
                    rowList: [10, 20, 30],
                    pager: pager,
                    sortname: 'CategoryName',
                    sortorder: "asc",
                    viewrecords: true,
                    width: '100%',
                    height: '100%',
                    autowidth: true,
                    rownumbers: true,
                    caption: 'Các chủ đề',
                    loadComplete: function(){ 
                            var ids = jQuery("#grid").getDataIDs(); 
                            for(var i=0;i<ids.length;i++){ 
                                    var cl = ids[i];
                                    var edit = '<a  class="Edit" rel="' +cl + '" href="<%=Url.Action("Edit","Categories")%>/' + cl +'" ><img src="<%=Url.Content("~/Images/edit_medium.png") %>" /></a>';
                                    jQuery("#grid").setRowData(ids[i],{Options: edit}) ;
                            } 
                    }, 
                    onRightClickRow  : function () {
                            //alert('click');
                    },
                    subGrid: true,
                    subGridRowExpanded: function(subgrid_id, row_id) { 
                    // we pass two parameters // subgrid_id is a id of the div tag created whitin a table data 
                    // the id of this elemenet is a combination of the "sg_" + id of the row // the row_id is the id of the row 
                    // If we wan to pass additinal parameters to the url we can use 
                    // a method getRowData(row_id) - which returns associative array in type name-value 
                    // here we can easy construct the flowing 
                    var subgrid_table_id, pager_id; 
                    subgrid_table_id = subgrid_id+"_t"; 
                    pager_id = "p_"+subgrid_table_id; 
                    var eid = $("#grid").getRowData(row_id)["Id"];
                    $("#"+subgrid_id).html("<table id='"+subgrid_table_id+"' class='scroll'></table><div id='"+pager_id+"' class='scroll'></div>"); 
                    jQuery("#"+subgrid_table_id).jqGrid({ 
                    
                            url:"<%=Url.Action("List", "Categories" )%>", 
                            editurl : "<%=Url.Action("EditRow", "Categories" )%>?ParentCateId="+eid,
                            datatype: "json", 
                            ajaxGridOptions: {
                            type: "POST"
                        },
                            colNames: [ 'Id','Tên','Url', 'Số bài viêt', 'Chủ đề nổi bật', 'Hiển thị trên Trang chủ',''],
                            colModel: [
                                { name: 'Id', index: 'Id', width: 40, align: 'left', editable: false, key: true, editoptions: {readonly:'readonly'},editrules: { edithidden: true }, hidden: true },
                                { name: 'Name', index: 'CategoryName', width: 200, sortable: true, editable: true, edittype: 'text', editoptions: { size: 50, maxlength:200} , hidden: false },
                                { name: 'Url', index: 'Url', width: 120, sortable: false, editable: false, formatter: 'link', formatoptions: {target : '_blank'}},
                                { name: 'Articles', index: 'Artiles', width:60, align:'center', formatter:'integer',sortable: true, editable: false, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
                                { name: 'IsFeatured', index: 'IsFeatured', align:'center', formatter:statiCheckboxFormater,width: 80, sortable: true, editable: true, edittype: 'checkbox', editoptions: {value:'True:False',dataInit: InitCheckBox} , hidden: false },
                                { name: 'ShowOnHP', index: 'ShowOnHP', align:'center',formatter:statiCheckboxFormater,width: 80, sortable:true, editable: true, edittype: 'checkbox', editoptions: {value:'True:False',dataInit: InitCheckBox},hidden: false },
                                { name: 'Options', index: 'Options', align:'center', sortable:false, editable: false , width:40},
                                ],
                             rowNum:20, 
                             rowList: [10, 20, 30],
                             pager: pager_id, 
                             sortname: 'CategoryName', 
                             sortorder: "asc", 
                             height: '100%' ,
                             width:'100%',
                             viewrecords: true,
                             autowidth: true,
                            rownumbers: true,
                            caption: 'Danh sách  chủ đề con trong mục này',
                             userdata: {PollId:$("#grid").getRowData(row_id)["id"]},
                             postData: {ParentId:eid},
                            onSelectRow: function(ids) {  
                                if (ids != null) {  
                                       var data = $("#"+subgrid_table_id).getRowData(ids);  
                                       jQuery("#article_grid").setGridParam({ postData: {CategoryId: data["Id"]}, page: 1 })  
                                       .setCaption("<b>Danh sách các bài viết trong mục : " + data["Name"]+"</b>")  
                                       .trigger('reloadGrid'); 
                                       
                                       UpdateCreateInLink(data["Id"]) 
                                    } 
                            },
                            loadComplete: function(){ 

                            $("tr[role='row']").contextMenu({
                                    menu: 'myMenu'
                                },
                                 function(action, el, pos) {
                                  alert(action);
                                });

                            var ids = jQuery("#grid").getDataIDs(); 
                            for(var i=0;i<ids.length;i++){ 
                                    var cl = ids[i];
                                    var edit = '<a  class="Edit" rel="' +cl + '" href="<%=Url.Action("Edit","Categories")%>/' + cl +'" ><img src="<%=Url.Content("~/Images/edit_medium.png") %>" /></a>';
                                    jQuery("#grid").setRowData(ids[i],{Options: edit}) ;
                            } 
                    }, 
                             
                    }); 
                    jQuery("#"+subgrid_table_id).jqGrid('navGrid',"#"+pager_id,{edit:true,add:true,del:true,search: true, view: true},{afterShowForm : afterShowFormEdit},{},{})

               },
                subGridRowColapsed: function(subgrid_id, row_id) {
                     var subgrid_table_id; //
                     subgrid_table_id = subgrid_id+"_t"; //
                     jQuery("#"+subgrid_table_id).remove(); 
                 },
                 onSelectRow: function(ids) { 
                  
                    if (ids != null) {  
                        alert(ids);
                           var data = $("#grid").getRowData(ids);  
                           jQuery("#article_grid").setGridParam({ postData: {CategoryId: data["Id"]}, page: 1 })  
                           .setCaption("<b>Danh sách các bài viết trong mục : " + data["Name"]+"</b>")  
                           .trigger('reloadGrid');  

                           UpdateCreateInLink(data["Id"]) 
                        }
                }
                }).navGrid('#pager', { edit: true, add: true, del: true, search: true, view: true }, {},{},{url : '<%=Url.Action("JsonDelete", "Categories" )%>'}).navButtonAdd('#pager',{
                           caption:"Public", 
                           buttonicon:"ui-icon-add", 
                           onClickButton: function(){ 
                             
                                 var id = jQuery("#grid").jqGrid('getGridParam','selrow'); 
                                 
                                 if (id) { 
                                         var ret = jQuery("#grid").getRowData(id); 
                                         $.ajax({
                                                  type: 'POST',
                                                  url: "<%=Url.Action("Public", "Poll" )%>",
                                                  data: {Id : ret["Id"]},
                                                  success: function() {
                                                    $("#grid").trigger("reloadGrid")
                                                  },
                                                  dataType: 'json'
                                                });

                                 } else { 
                                 alert("Chưa chọn dòng nào");
                                 } 
                             } ,
                           position:"last"
            });
            }}
        
        DBNL.Admin.Categories.Articles= {
            setupGrid: function (grid, pager) {
                var lastsel;
                grid.jqGrid({
                    url: "<%=Url.Action("List", "Content" )%>",
                    editurl : "<%=Url.Action("EditRow", "Poll" )%>",
                    ajaxGridOptions: {
                        type: "POST"
                    },
                    datatype: "json",
                    colNames: [ 'Id','Tiêu đề', 'Hình','Ngày đăng', 'Url','Trạng Thái',''],
                    colModel: [
                        { name: 'Id', index: 'Id', width: 40, align: 'left', sortable: false,editable: false, key: true, editoptions: {readonly:'readonly'},editrules: { edithidden: true }, hidden: true },
                        { name: 'Title', index: 'Title', width: 250, sortable: true, editable: true, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
                        { name: 'Thumbnail', index: 'Thumbnail', align:'center', formatter:imageFormater,width: 60, sortable: false, editable: false, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
                        { name: 'PostedDate', index: 'PostedDate', align:'center',width: 60, sortable: true, editable: false, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
                        { name: 'Url', index: 'Url', align:'left', formatter:'link', formatoptions: {target:'_blank'},width: 80, sortable: false, editable: false, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
                        { name: 'Status', index: 'Status', align:'center', formatter:'text',width: 50, sortable: true, editable: false, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
                        { name: 'Options', index: 'Options', align:'center', formatter:'text',width: 50, sortable: false, editable: false, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false }
                      ],
                    rowNum: 10,
                    rowList: [10, 20, 30],
                    pager: pager,
                    sortname: 'Title',
                    sortorder: "asc",
                    viewrecords: true,
                    width: '100%',
                    height: '100%',
                    autowidth: true,
                    rownumbers: true,
                    postData : {CategoryId: 0},
                    caption: '',
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
            });
            }}
            
</script>
</asp:Content>

