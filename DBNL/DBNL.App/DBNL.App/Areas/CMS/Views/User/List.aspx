<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DBNL.App.Models.User>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Quản trị viên hệ thống
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Quản trị viên hệ thống</h2>

     <div>
        <table id="grid" cellpadding="0" cellspacing="0">
        </table>
        <div id="pager" style="text-align: center;">
        
    </div>
    <p><%=Html.ActionLink("Thêm Quyền", "Create","Roles") %></p>
     <p><%=Html.ActionLink("Thêm Người quản trị", "Create","User") %></p>
    </div>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptContent">
    <script language="javascript" type="text/javascript" src="<%= Url.Content("~/Scripts/GridData.js") %>"></script>
    <script type="text/javascript">
$(document).ready(function () {

            DBNL.Admin.Users.setupGrid($("#grid"), $("#pager"));
        });

        DBNL.Admin.Users= {
            setupGrid: function (grid, pager) {
                var lastsel;
                grid.jqGrid({
                    url: "<%=Url.Action("List", "User" )%>",
                    editurl : "<%=Url.Action("EditRow", "User" )%>",
                    ajaxGridOptions: {
                        type: "POST"
                    },
                    datatype: "json",
                    colNames: [ 'Id','Họ Tên', 'Tên đăng nhập','Nhóm','Trạng Thái','Mật khẩu',''],
                    colModel: [
                        { name: 'Id', index: 'Id', width: 40, align: 'left', editable: false, key: true, editoptions: {readonly:'readonly'},editrules: { edithidden: true }, hidden: true },
                        { name: 'Name', index: 'Name', width: 150, sortable: true, editable: true, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
                        { name: 'Username', index: 'Username', width: 60, sortable: true, editable: true, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
                        { name: 'Roles', index: 'Roles', width: 150, sortable: true, editable: false, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
                        { name: 'Status', index: 'Status', width: 35, align: 'center', sortable: true, editable: true, edittype: 'text', style: 'select', editoptions: { dataUrl: ""}, hidden: false },
                        { name: 'Password', index: 'Password', width: 35, align: 'center', sortable: false, editable: true, edittype: 'password', style: 'text', editoptions: { dataUrl: ""}, hidden: false },
                        { name: 'Options',index:'Options',width:40,editable: false}
                    ],
                    rowNum: 10,
                    rowList: [10, 20, 30],
                    pager: pager,
                    sortname: 'Name',
                    sortorder: "asc",
                    viewrecords: true,
                    width: '100%',
                    height: '100%',
                    autowidth: true,
                    rownumbers: true,
                    caption: 'Danh sách quản trị viên',
                     loadComplete: function(){ 
                            var ids = jQuery("#grid").getDataIDs(); 
                            for(var i=0;i<ids.length;i++){ 
                                    var cl = ids[i];
                                    send = "<input class='sendbuttons' id='tbuttonSend"+cl+"' type='button' value='Send' /><br />"; 
                                    clear = "<input class='sendbuttons' id='tbuttonClear"+cl+"' type='button' value='Send' /><br />"; 
                                    var edit = '<a  class="EditRecord" href="<%=Url.Action("Edit","User")%>/' + cl +'" ><img src="<%=Url.Content("~/Images/edit-small.png") %>" /></a>';
                                    jQuery("#grid").setRowData(ids[i],{Options:edit}) 
                            } 
                    }, 
                    subGrid: false,
                    subGridRowExpanded: function(subgrid_id, row_id) { 
                    // we pass two parameters // subgrid_id is a id of the div tag created whitin a table data 
                    // the id of this elemenet is a combination of the "sg_" + id of the row // the row_id is the id of the row 
                    // If we wan to pass additinal parameters to the url we can use 
                    // a method getRowData(row_id) - which returns associative array in type name-value 
                    // here we can easy construct the flowing 
                    var subgrid_table_id, pager_id; 
                    subgrid_table_id = subgrid_id+"_t"; 
                    pager_id = "p_"+subgrid_table_id; 
                    var eid = $("#grid").getRowData(row_id)["EntityId"];
                    $("#"+subgrid_id).html("<table id='"+subgrid_table_id+"' class='scroll'></table><div id='"+pager_id+"' class='scroll'></div>"); 
                    jQuery("#"+subgrid_table_id).jqGrid({ 
                    
                            url:"<%=Url.Action("GetQuestions", "PollQuestion" )%>/", 
                            datatype: "json", 
                            ajaxGridOptions: {
                            type: "POST"
                        },
                            colNames: ['Id','Question','Responses'], 
                            colModel: [ 
                                        {name:"Id",index:"Id",width:100, sortable: false, editable: true, editoptions: {readonly:'readonly'},editrules: { edithidden: true }, key:true, hidden:true},
                                        {name:"Question",index:"Question",width:625, sortable: true, editable: true}, 
                                        {name:"Responses",index:"Responses",width:150, align: 'center'},
                                        
                                      ],
                             rowNum:20, 
                             rowList: [10, 20, 30],
                             pager: pager_id, 
                             sortname: 'Question', 
                             sortorder: "asc", 
                             height: '100%' ,
                             width:'100%',
                             viewrecords: true,
                             autowidth: true,
                            rownumbers: true,
                            caption: 'Danh sách câu hỏi trong mục này',
                             userdata: {PollId:$("#grid").getRowData(row_id)["id"]},
                             postData: {PollId:eid}
                             
                    }); 
                    jQuery("#"+subgrid_table_id).jqGrid('navGrid',"#"+pager_id,{edit:true,add:true,del:true,search: true, view: true})

               },
                subGridRowColapsed: function(subgrid_id, row_id) {
                     var subgrid_table_id; //
                     subgrid_table_id = subgrid_id+"_t"; //
                     jQuery("#"+subgrid_table_id).remove(); 
                 } 
                }).navGrid('#pager', { edit: true, add: true, del: true, search: true, view: true },{},{},{url:'<%=Url.Action("JsonDelete", "User" )%>'}).navButtonAdd('#pager',{
                           caption:"Active/Inactive", 
                           buttonicon:"ui-icon-power", 
                           onClickButton: function(){ 
                             
                                 var id = jQuery("#grid").jqGrid('getGridParam','selrow'); 
                                 
                                 if (id) { 
                                         var ret = jQuery("#grid").getRowData(id); 
                                         $.ajax({
                                                  type: 'POST',
                                                  url: "<%=Url.Action("Active", "User" )%>",
                                                  data: {Id : ret["Id"]},
                                                  success: function() {
                                                    $("#grid").trigger("reloadGrid")
                                                  },
                                                  dataType: 'json'
                                                });

                                 } else { 
                                 alert("Please select row");
                                 } 
                             } ,
                            
                           position:"last"
            });
            }}
        
</script>
</asp:Content>

