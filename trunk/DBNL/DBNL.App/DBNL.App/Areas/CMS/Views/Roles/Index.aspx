<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DBNL.App.Models.Role>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Nhóm người dùng
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Nhóm người dùng</h2>

     <div>
        <table id="grid" cellpadding="0" cellspacing="0">
        </table>
        <div id="pager" style="text-align: center;">
        
    </div>

    <p>
        <%= Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptContent">
    <script language="javascript" type="text/javascript" src="<%= Url.Content("~/Scripts/GridData.js") %>"></script>
    <script type="text/javascript">
    function myelem (value, options) {
      var el = document.createElement("input");
      el.type="checkbox";
      //el.value = value;
      el.checked = $(value).attr("checked");
      
      return el;
    }
 
    function myvalue(elem) {
      return $(elem).val();
    }

$(document).ready(function () {

            DBNL.Admin.Users.setupGrid($("#grid"), $("#pager"));
        });

        DBNL.Admin.Users= {
            setupGrid: function (grid, pager) {
                var lastsel;
                grid.jqGrid({
                    url: "<%=Url.Action("List", "Roles" )%>",
                    editurl : "<%=Url.Action("EditRow", "Roles" )%>",
                    ajaxGridOptions: {
                        type: "POST"
                    },
                    datatype: "json",
                    colNames: [ 'Id','Tên nhóm', 'Toàn quyền','QL Nội dung','QL Danh mục','QL người dùng','QL Liên kết website','QL KSYK','QL Hổ sợ','QL Banner','QL Liên hệ'],
                    colModel: [
                    {
                        name: 'Id', index: 'Id', width: 40, align: 'left', editable: false, key: true, editoptions: {readonly:'readonly'},editrules: { edithidden: true }, hidden: true },

                        { name: 'RoleName', index: 'RoleName', width: 150, sortable: true, editable: true, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
                        { name: 'IsFullPermission', index: 'IsFullPermission', align:'center',formatter:statiCheckboxFormater, width: 150, sortable: true, editable: true, edittype:'custom', editoptions:{custom_element: myelem, custom_value:myvalue} , hidden: false },
                        { name: 'AllowManageContent', index: 'AllowManageContent', align:'center',formatter:statiCheckboxFormater,width: 150, sortable: true, editable: true, edittype:'custom', editoptions:{custom_element: myelem, custom_value:myvalue} , hidden: false },
                        { name: 'AllowManageMenu', index: 'AllowManageMenu',align:'center',formatter:statiCheckboxFormater, width: 150, sortable: true, editable: true, edittype:'custom', editoptions:{custom_element: myelem, custom_value:myvalue} , hidden: false },
                        { name: 'AllowManageUser', index: 'AllowManageUser',align:'center',formatter:statiCheckboxFormater, width: 150, sortable: true, editable: true, edittype:'custom', editoptions:{custom_element: myelem, custom_value:myvalue} , hidden: false },
                        { name: 'AllowManageLink', index: 'AllowManageLink',align:'center',formatter:statiCheckboxFormater, width: 150, sortable: true, editable: true, edittype:'custom', editoptions:{custom_element: myelem, custom_value:myvalue} , hidden: false },
                        { name: 'AllowManagePoll', index: 'AllowManagePoll', align:'center',formatter:statiCheckboxFormater,width: 150, sortable: true, editable: true, edittype:'custom', editoptions:{custom_element: myelem, custom_value:myvalue} , hidden: false },
                        { name: 'AllowManageOnlineSupporter', index: 'AllowManageOnlineSupporter',formatter:statiCheckboxFormater, align:'center',width: 150, sortable: true, editable: true, edittype:'custom', editoptions:{custom_element: myelem, custom_value:myvalue} , hidden: false },
                        { name: 'AllowManageBanner', index: 'AllowManageBanner', align:'center',formatter:statiCheckboxFormater,width: 150, sortable: true, editable: true,edittype:'custom', editoptions:{custom_element: myelem, custom_value:myvalue} , hidden: false },
                        { name: 'AllowManageContact', index: 'AllowManageContact',align:'center',formatter:statiCheckboxFormater, width: 150, sortable: true, editable: true, edittype:'custom', editoptions:{custom_element: myelem, custom_value:myvalue} , hidden: false },
                        
                      ],
                    rowNum: 10,
                    rowList: [10, 20, 30],
                    pager: pager,
                    sortname: 'RoleName',
                    sortorder: "asc",
                    viewrecords: true,
                    width: '100%',
                    height: '100%',
                    autowidth: true,
                    rownumbers: true,
                    caption: 'Nhóm người dùng',
                    postData: {},
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
                    $("#"+subgrid_id).setGridParam({postData: {RoleId: eid}});
                    $("#"+subgrid_id).html("<table id='"+subgrid_table_id+"' class='scroll'></table><div id='"+pager_id+"' class='scroll'></div>"); 
                    jQuery("#"+subgrid_table_id).jqGrid({ 
                    
                    url: "<%=Url.Action("ListByRole", "User" )%>",
                    editurl : "<%=Url.Action("EditRow", "User" )%>",
                    ajaxGridOptions: {
                        type: "POST"
                    },
                    datatype: "json",
                    colNames: [ 'Id','Họ Tên', 'Tên đăng nhập','Trạng Thái','Mật khẩu'],
                    colModel: [
                    {
                        name: 'Id', index: 'Id', width: 40, align: 'left', editable: false, key: true, editoptions: {readonly:'readonly'},editrules: { edithidden: true }, hidden: true },

                        { name: 'Name', index: 'Name', width: 150, sortable: true, editable: true, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
                        { name: 'Username', index: 'Username', width: 60, sortable: true, editable: true, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
                        { name: 'Status', index: 'Status', width: 35, align: 'center', sortable: true, editable: true, edittype: 'text', style: 'select', editoptions: { dataUrl: ""}, hidden: false },
                        { name: 'Password', index: 'Password', width: 35, align: 'center', sortable: true, editable: true, edittype: 'text', style: 'select', editoptions: { dataUrl: ""}, hidden: true },
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
                    postData : {RoleId: eid}
                    }); 
                    jQuery("#"+subgrid_table_id).jqGrid('navGrid',"#"+pager_id,{edit:true,add:true,del:true,search: true, view: true})

               },
                subGridRowColapsed: function(subgrid_id, row_id) {
                     var subgrid_table_id; //
                     subgrid_table_id = subgrid_id+"_t"; //
                     jQuery("#"+subgrid_table_id).remove(); 
                 } 
                }).navGrid('#pager', { edit: true, add: true, del: true, search: true, view: true },{},{},{url:"<%=Url.Action("JsonDelete", "Roles" )%>"})
            }}
        
</script>
</asp:Content>
