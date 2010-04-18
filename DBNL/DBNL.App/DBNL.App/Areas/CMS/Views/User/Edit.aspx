<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.User>" %>
<%@ Import Namespace="DBNL.App.Extensions"%>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Cập nhật thông tin
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Cập nhật thông tin</h2>

    <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary("Không thể lưu thông tin, vui lòng kiểm tra và nhập lại") %>
        
        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-field">
                <%= Html.HiddenFor(model => model.Id) %>
            </div>
             <div class="editor-field">
                <%= Html.HiddenFor(model => model.CreatedDate) %>
            </div>
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Username) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Username) %>
                <%= Html.ValidationMessageFor(model => model.Username) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Name) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Name) %>
                <%= Html.ValidationMessageFor(model => model.Name) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Password) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBox("Password","") %>
            </div>
             <div style="padding-top:50px">
             <h3>Chọn nhóm cho quản trị viên này:</h3>
                <table id="grid" cellpadding="0" cellspacing="0">
                </table>
                <div id="pager" style="text-align: center;"/>
            </div>

            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%= Html.ActionLink("Back to List", "Index") %>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="headerPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ScriptContent">
    <script language="javascript" type="text/javascript" src="<%= Url.Content("~/Scripts/GridData.js") %>"></script>
    <script type="text/javascript">
    var roles =eval('<%=ViewData["RoleIds"].ToJson() %>');

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
                     url: "<%=Url.Action("FullList", "Roles" )%>",
                    editurl : "<%=Url.Action("EditRow", "Categories" )%>",
                    ajaxGridOptions: {
                        type: "POST"
                    },
                    datatype: "json",
                    colNames: [ 'Id','Tên nhóm', 'Toàn quyền','QL Nội dung','QL Danh mục','QL người dùng','QL Liên kết website','QL KSYK','QL Hổ sợ','QL Banner','QL Liên hệ','Chọn'],
                    colModel: [
                    {
                        name: 'Id', index: 'Id', width: 80, align: 'left', editable: false, key: true, editoptions: {readonly:'readonly'},editrules: { edithidden: true }, hidden: true },

                        { name: 'RoleName', index: 'RoleName',width: 160, sortable: true, editable: true, edittype: 'text', editoptions: { size: 160, maxlength:100} , hidden: false },
                        { name: 'IsFullPermission', index: 'IsFullPermission', align:'center',formatter:statiCheckboxFormater, sortable: true, editable: true, edittype:'custom', editoptions:{custom_element: myelem, custom_value:myvalue} , hidden: false },
                        { name: 'AllowManageContent', index: 'AllowManageContent', align:'center',formatter:statiCheckboxFormater,sortable: true, editable: true, edittype:'custom', editoptions:{custom_element: myelem, custom_value:myvalue} , hidden: false },
                        { name: 'AllowManageMenu', index: 'AllowManageMenu',align:'center',formatter:statiCheckboxFormater, sortable: true, editable: true, edittype:'custom', editoptions:{custom_element: myelem, custom_value:myvalue} , hidden: false },
                        { name: 'AllowManageUser', index: 'AllowManageUser',align:'center',formatter:statiCheckboxFormater, sortable: true, editable: true, edittype:'custom', editoptions:{custom_element: myelem, custom_value:myvalue} , hidden: false },
                        { name: 'AllowManageLink', index: 'AllowManageLink',align:'center',formatter:statiCheckboxFormater, sortable: true, editable: true, edittype:'custom', editoptions:{custom_element: myelem, custom_value:myvalue} , hidden: false },
                        { name: 'AllowManagePoll', index: 'AllowManagePoll', align:'center',formatter:statiCheckboxFormater,sortable: true, editable: true, edittype:'custom', editoptions:{custom_element: myelem, custom_value:myvalue} , hidden: false },
                        { name: 'AllowManageOnlineSupporter', index: 'AllowManageOnlineSupporter',formatter:statiCheckboxFormater, align:'center',sortable: true, editable: true, edittype:'custom', editoptions:{custom_element: myelem, custom_value:myvalue} , hidden: false },
                        { name: 'AllowManageBanner', index: 'AllowManageBanner', align:'center',formatter:statiCheckboxFormater,sortable: true, editable: true,edittype:'custom', editoptions:{custom_element: myelem, custom_value:myvalue} , hidden: false },
                        { name: 'AllowManageContact', index: 'AllowManageContact',align:'center',formatter:statiCheckboxFormater, sortable: true, editable: true, edittype:'custom', editoptions:{custom_element: myelem, custom_value:myvalue} , hidden: false },
                        { name: 'Permission', index: 'Permission', align:'center',  sortable: true, hidden: false, formatter: customCheckboxFormater}
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
                    caption: 'Danh sách các danh nhóm phân quyền',
                     loadComplete: function(){ 
                            //var ids = jQuery("#grid").getDataIDs(); 
                            for(var i=0;i<roles.length;i++){ 
                                  $("#roleid_"+ roles[i]).attr("checked","checked");
                            } 
                    }, 

                }).navGrid('#pager', { edit: true, add: true, del: true, search: true, view: true })
                }}
</script>
</asp:Content>


