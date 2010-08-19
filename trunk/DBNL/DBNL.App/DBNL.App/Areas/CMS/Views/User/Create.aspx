<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.User>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Create</h2>

    <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Username) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Username)%>
                <%= Html.ValidationMessageFor(model => model.Username)%>
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
                <%= Html.TextBoxFor(model => model.Password) %>
                <%= Html.ValidationMessageFor(model => model.Password) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Status) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Status) %>
                <%= Html.ValidationMessageFor(model => model.Status) %>
            </div>
            
            <div style="padding-top:50px">
                <table id="grid" cellpadding="0" cellspacing="0">
                </table>
                <div id="pager" style="text-align: center;"/>
            </div>
            
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%= Html.ActionLink("Back to List", "Index") %>
    </div>

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
                     url: "<%=Url.Action("FullList", "Roles" )%>",
                    editurl : "<%=Url.Action("EditRow", "Categories" )%>",
                    ajaxGridOptions: {
                        type: "POST"
                    },
                    datatype: "json",
                    colNames: [ 'Id','Tên nhóm', 'Toàn quyền','QL Nội dung','QL Danh mục','QL người dùng','QL Liên kết website','QL KSYK','QL Hổ sợ','QL Banner','QL Liên hệ','Chọn'],
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
                        { name: 'Permission', index: 'Permission', align:'center',  sortable: true, hidden: false, formatter: customCheckboxFormater}
                      ],

                    rowNum: 10,
                    rowList: [5,10,15, 20,25, 30,40,50,60,70,80,90,100],
                    pager: pager,
                    sortname: 'RoleName',
                    sortorder: "asc",
                    viewrecords: true,
                    width: '100%',
                    height: '100%',
                    autowidth: true,
                    rownumbers: true,
                    caption: 'Danh sách các danh nhóm phân quyền',
                }).navGrid('#pager', { edit: true, add: true, del: true, search: true, view: true })
                }}
</script>
</asp:Content>


