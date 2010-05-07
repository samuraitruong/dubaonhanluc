<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DBNL.App.Models.Link>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Liên kết website.
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Liên kết website.</h2>

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

            DBNL.Admin.Links.setupGrid($("#grid"), $("#pager"));
        });

        DBNL.Admin.Links= {
            setupGrid: function (grid, pager) {
                var lastsel;
                grid.jqGrid({
                    url: "<%=Url.Action("List", "Link" )%>",
                    editurl : "<%=Url.Action("EditRow", "Link" )%>",
                    ajaxGridOptions: {
                        type: "POST"
                    },
                    datatype: "json",
                    colNames: [ 'EntityId','Tên cơ quan', 'Website'],
                    colModel: [
                    {
                        name: 'EntityId',key:true, index: 'EntityId', width: 40, align: 'left',editable: false, editoptions: {readonly:'readonly'},editrules: { edithidden: true }, hidden: true },

                        { name: 'Title', index: 'Title', sortable: true, editable: true, edittype: 'text', editrules : {required:true}, editoptions: { size: 60, maxlength:100} , hidden: false },
                        { name: 'Url', index: 'Url', width: 150, align: 'left', formatter: 'link', formatoptions: { prefix: "$" }, sortable: true, editable: true, edittype: 'text', editrules : {required:true}, editoptions: { size: 60, maxlength:100} , hidden: false },
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
                    caption: 'Danh sách các website có liên kết',
//                    search : {
//                                 caption: "Search...",
//                                 Find: "Find",
//                                 Reset: "Reset",
//                                 odata : ['equal', 'not equal', 'less', 'less or equal','greater','greater or equal', 'begins with','does not begin with','is in','is not in','ends with','does not end with','contains','does not contain'],
//                                 groupOps: [ { op: "AND", text: "all" }, { op: "OR", text: "any" } ],
//                                 matchText: " match",
//                                 rulesText: " rules"
//                               }
                })
        .navGrid('#pager', { edit: true, add: true, del: true, search: true, view: true }, {width:'450'}, {}, {url: "Delete"});
            }
        };
</script>
</asp:Content>