<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Hổ trợ trực tuyến.
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Hổ trợ trực tuyến</h2>

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

            DBNL.Admin.Supporters.setupGrid($("#grid"), $("#pager"));
        });

        DBNL.Admin.Supporters= {
            setupGrid: function (grid, pager) {
                var lastsel;
                grid.jqGrid({
                    url: "<%=Url.Action("List", "Supporter" )%>",
                    editurl : "<%=Url.Action("EditRow", "Supporter" )%>",
                    ajaxGridOptions: {
                        type: "POST"
                    },
                    datatype: "json",
                    colNames: [ 'Id','Họ Tên', 'Nickname','Loại','Trạng Thái'],
                    colModel: [
                    {
                        name: 'Id',key:true, index: 'Id', width: 40, align: 'left',editable: false, editoptions: {readonly:'readonly'},editrules: { edithidden: true }, hidden: true },

                        { name: 'Name', index: 'Name', width: 200,sortable: true, editable: true, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
                        { name: 'NickName', index: 'NickName', width: 120, align: 'left', formatter: 'text',  sortable: true, editable: true, edittype: 'text', editoptions: { size: 20, maxlength:100}, hidden: false },
                        { name: 'Type', index: 'Url', width: 50, align: 'center', formatter: 'text', sortable: true, editable: true, edittype: 'text', editoptions: {value:'Yahoo',dataInit : function (elem) { $(elem).val('Yahoo');} , size: 20, maxlength:100, readonly:'readonly', disabled:'disabled'}, hidden: false },
                        { name: 'Status', index: 'Url', width: 75, align: 'center', formatter: 'text',  sortable: true, editable: false, edittype: 'text', editoptions: { size: 20, maxlength:100}, hidden: false },
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
                    caption: 'Danh sách thành viên hổ trợ trực tuyến.',
//                    search : {
//                                 caption: "Search...",
//                                 Find: "Find",
//                                 Reset: "Reset",
//                                 odata : ['equal', 'not equal', 'less', 'less or equal','greater','greater or equal', 'begins with','does not begin with','is in','is not in','ends with','does not end with','contains','does not contain'],
//                                 groupOps: [ { op: "AND", text: "all" }, { op: "OR", text: "any" } ],
//                                 matchText: " match",
//                                 rulesText: " rules"
//                               }
                }).navGrid('#pager', { edit: true, add: true, del: true, search: true, view: true }, {}, {}).navButtonAdd('#pager',{
                           caption:"Active/Inactive", 
                           title:'Active or Inactive',
                           buttonicon:"ui-icon-power", 
                           onClickButton: function(){ 
                             
                                 var id = jQuery("#grid").jqGrid('getGridParam','selrow'); 
                                 
                                 if (id) { 
                                         var ret = jQuery("#grid").getRowData(id); 
                                         
                                         
                                         $.ajax({
                                                  type: 'POST',
                                                  url: "<%=Url.Action("Public", "Supporter" )%>",
                                                  data: {Id : ret["Id"]},
                                                  success: function() {
                                                    $("#grid").trigger("reloadGrid")
                                                  },
                                                  dataType: 'json'
                                                });

                                 } else { 
                                 alert("Bạn phải chọn một dòng để thực hiện thao tác này.");
                                 } 
                             } ,
                            
                           position:"last"
            });;
            }
        };
</script>
</asp:Content>