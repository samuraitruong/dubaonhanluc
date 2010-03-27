<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DBNL.App.Models.Contact>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	List
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>List</h2>

     <div>
        <table id="grid" cellpadding="0" cellspacing="0">
        </table>
        <div id="pager" style="text-align: center;">
        
    </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptContent">
    <script language="javascript" type="text/javascript" src="<%= Url.Content("~/Scripts/GridData.js") %>"></script>
    <script type="text/javascript">
$(document).ready(function () {

            DBNL.Admin.Contacts.setupGrid($("#grid"), $("#pager"));
        });

        DBNL.Admin.Contacts= {
            setupGrid: function (grid, pager) {
                var lastsel;
                grid.jqGrid({
                    url: "<%=Url.Action("List", "Contact" )%>",
                    editurl : "<%=Url.Action("EditRow", "Contact" )%>",
                    ajaxGridOptions: {
                        type: "POST"
                    },
                    datatype: "json",
                    colNames: [ 'EntityId','Name', 'Email', 'Status'],
                    colModel: [
                    {
                        name: 'EntityId', index: 'EntityId', width: 40, align: 'left',editable: true, editoptions: {readonly:'readonly'},editrules: { edithidden: true }, hidden: true },

                        { name: 'Name', index: 'Name', sortable: true, editable: true, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
                        { name: 'Email', index: 'Email', width: 150, align: 'left', sortable: true, editable: true, edittype: 'text', editoptions: { size: 20, maxlength:100}, hidden: false },
                        { name: 'Status', index: 'Status', width: 150, align: 'center', sortable: true, editable: true, edittype: 'text', editoptions: { size: 20, maxlength:100}, hidden: false },
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
                    caption: 'Contact list'
                    
                })
        .navGrid('#pager', { edit: true, add: true, del: false, search: true, view: true });
            }
        };
</script>
</asp:Content>