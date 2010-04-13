<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.Role>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Create</h2>

    <%= Html.ValidationSummary("Create was unsuccessful. Please correct the errors and try again.") %>
     <% Html.EnableClientValidation(); %>


    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend>Fields</legend>
            <p>
                <label for="RoleName">RoleName:</label>
                <%= Html.TextBox("RoleName") %>
                <%= Html.ValidationMessage("RoleName", "*") %>
            </p>
            <div>
            <table id="grid_ex" cellpadding="0" cellspacing="0">
                </table>
                <div id="pager_ex" style="text-align: center;"/>
            
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
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptContent">
    <script language="javascript" type="text/javascript" src="<%= Url.Content("~/Scripts/GridData.js") %>"></script>
    <script type="text/javascript">
$(document).ready(function () {

            DBNL.Admin.Users.setupGrid($("#grid"), $("#pager"));
            DBNL.Admin.Users.setupGridEx($("#grid_ex"), $("#pager_ex"));
            var mydata = [ 
            {Id:1,Name:'Toàn quyền', Permission:'FullControl'},
            {Id:2,Name:'Cho phép quản lí nhóm/phân quyền', Permission:'Role'},
            {Id:3,Name:'Cho phép quản lí thành viên quản trị', Permission:'User'},
            {Id:4,Name:'Cho phép quản lí website menu', Permission:'Menu'},
            {Id:5,Name:'Cho phép quản lí tất cả danh mục tin tức', Permission:'AllContent'},
            {Id:6,Name:'Cho phép quản lí liên kết website', Permission:'Link'},
            {Id:7,Name:'Cho phép quản lí Hổ trợ trực tuyến', Permission:'OnlineSupport'},
            {Id:8,Name:'Cho phép quản lí liên hệ', Permission:'Contact'},
            {Id:8,Name:'Cho phép quản lí khảo sát', Permission:'Poll'},
            {Id:8,Name:'Cho phép quản lí Banner', Permission:'Banner'}
            
            ];
            for(var i=0;i<=mydata.length;i++) 
            jQuery("#grid_ex").jqGrid('addRowData',i+1,mydata[i]); 
            
        });

        DBNL.Admin.Users= {
            setupGrid: function (grid, pager) {
                var lastsel;
                grid.jqGrid({
                     url: "<%=Url.Action("FullList", "Categories" )%>",
                    editurl : "<%=Url.Action("EditRow", "Categories" )%>",
                    ajaxGridOptions: {
                        type: "POST"
                    },
                    datatype: "json",
                    colNames: [ 'Id','Tên', 'Phân quyền'],
                    colModel: [
                                { name: 'Id', index: 'Id', width: 40, align: 'left', editable: false, key: true, editoptions: {readonly:'readonly'},editrules: { edithidden: true }, hidden: true },
                                { name: 'Name', index: 'CategoryName', width: 250, sortable: true, editable: true, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
                                { name: 'Permission', index: 'Permission', align:'center',  sortable: true, hidden: false, formatter: customCheckboxFormater}
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
                    caption: 'Danh sách các danh mục tin tức',
                }).navGrid('#pager', { edit: true, add: true, del: true, search: true, view: true })
                },
                
                setupGridEx: function (grid, pager) {
                grid.jqGrid({
                    datatype: "local",
                    colNames: [ 'Id','Tên Module', 'Phân quyền'],
                    colModel: [
                                { name: 'Id', index: 'Id', width: 40, align: 'left', editable: false, key: true, editoptions: {readonly:'readonly'},editrules: { edithidden: true }, hidden: true },
                                { name: 'Name', index: 'CategoryName', width: 250, sortable: true, editable: true, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
                                { name: 'Permission', index: 'Permission', align:'center',  sortable: true, hidden: false, formatter: customCheckboxFormater}
                              ],
                    width: '100%',
                    height: '100%',
                    autowidth: true,
                    rownumbers: true,
                    caption: 'Phân quyền theo Module',
                }).navGrid('#pager_ex', { })
                }
                
                }
        
</script>
</asp:Content>
