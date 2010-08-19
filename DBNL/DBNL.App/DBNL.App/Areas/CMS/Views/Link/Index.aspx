<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.Link>" %>

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
                    colNames: [ 'EntityId','Title', 'Url'],
                    colModel: [
                    {
                        name: 'EntityId', index: 'EntityId', width: 40, align: 'left',editable: true, editoptions: {readonly:'readonly'},editrules: { edithidden: true }, hidden: true },

                        { name: 'Title', index: 'Title', sortable: true, editable: true, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
                        { name: 'Url', index: 'Url', width: 150, align: 'center', formatter: 'showlink', formatoptions: { prefix: "$" }, sortable: true, editable: true, edittype: 'text', editoptions: { size: 20, maxlength:100}, hidden: false },
                      ],
                    rowNum: 10,
                    rowList: [5,10,15, 20,25, 30,40,50,60,70,80,90,100],
                    pager: pager,
                    sortname: 'Title',
                    sortorder: "asc",
                    viewrecords: true,
                    width: '100%',
                    height: '100%',
                    autowidth: true,
                    rownumbers: true,
                    caption: 'Link list'
                    
                })
        .navGrid('#pager', { edit: true, add: true, del: false, search: true, view: true });
            }
        };
</script>
</asp:Content>