<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    About Us
</asp:Content>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>About</h2>
    <p>
        Put content here.
        
        <% =DBNL.App.Config.DBNLConfigurationManager.FileResponsity.BannerRelativeUrl%>
    </p>
    
    <div>
        <table id="grid" cellpadding="0" cellspacing="0">
        </table>
        <div id="pager" style="text-align: center;">
        
    </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script language="javascript" type="text/javascript" src="<%= Url.Content("~/Scripts/GridData.js") %>"></script>
    <script type="text/javascript">
    $(document).ready(function () {
    GridDemo.Home.GridData.setupGrid($("#grid"), $("#pager"));
});

GridDemo.Home.GridData = {
    setupGrid: function (grid, pager) {
        var lastsel;
        grid.jqGrid({
            url: "/Home/List",
            mtype: "get",
            datatype: "json",
            colNames: ['Product ID', 'Product Name', 'Unit Price', 'Discontinued'],
            colModel: [
                        { name: 'ProductID', index: 'ProductID', width: 50, align: 'center', sortable: false, editable: false, hidden: false },
                        { name: 'ProductName', index: 'ProductName', sortable: true, editable: false, hidden: false },
                        { name: 'UnitPrice', index: 'UnitPrice', width: 40, align: 'center', formatter: 'currency', formatoptions: { prefix: "$" }, sortable: true, editable: false, hidden: false },
                        { name: 'Discontinued', index: 'Discontinued', width: 50, align: 'center', sortable: false, hidden: false }
                      ],
            rowNum: 10,
            rowList: [10, 20, 30],
            pager: pager,
            sortname: 'ProductID',
            sortorder: "asc",
            viewrecords: true,
            width: '100%',
            height: '100%',
            autowidth: true,
            rownumbers: true,
            caption: 'Grid Data Example'
        })
        .navGrid('#pager', { edit: true, add: true, del: false, search: true, view: true });
    }
};
</script>
</asp:Content>
