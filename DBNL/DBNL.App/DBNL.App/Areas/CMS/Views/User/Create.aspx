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
                    colNames: [ 'Id','Nhóm', 'Chọn'],
                    colModel: [
                                { name: 'Id', index: 'Id', width: 40, align: 'left', editable: false, key: true, editoptions: {readonly:'readonly'},editrules: { edithidden: true }, hidden: true },
                                { name: 'Name', index: 'RoleName', width: 250, sortable: true, editable: true, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
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
                }).navGrid('#pager', { edit: true, add: true, del: true, search: true, view: true })
                }}
</script>
</asp:Content>


