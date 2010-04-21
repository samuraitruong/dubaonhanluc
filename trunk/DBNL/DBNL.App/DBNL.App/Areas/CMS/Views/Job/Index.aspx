<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.Job>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>
    <div>
        <table id="grid" cellpadding="0" cellspacing="0">
        </table>
        <div id="pager" style="text-align: center;">
        
    </div>
    <p>
        <%=Html.ActionLink("Thêm Mới ", "Create", "Job") %>
    </p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="headerPlaceHolder" runat="server">
</asp:Content>


<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ScriptContent">
    <script language="javascript" type="text/javascript" src="<%= Url.Content("~/Scripts/GridData.js") %>"></script>

    <script type="text/javascript" src="<% =Url.Content("~/Content/jqueryUI1.8a/development-bundle/ui/minified/jquery.ui.datepicker.min.js")%>"></script>
    

    <script type="text/javascript">
    function datePickerElem (value, options) {
      var el = document.createElement("input");
      el = $("<input/>", {type:'text',value:value});
      el.datepicker();
      return el;
    }
 function datePickerVal(elem) {
  return $(elem).val()
}


$(document).ready(function () {

            DBNL.Admin.Banners.setupGrid($("#grid"), $("#pager"));

             $("#BannerPosition").bind("change", function() {
                jQuery("#grid").setGridParam({ postData: {Position:  $(this).val()}})  
                                      
                                       .trigger('reloadGrid');  
                                       
            
            });

        });

        DBNL.Admin.Banners= {
            setupGrid: function (grid, pager) {
                var lastsel;
                grid.jqGrid({
                    url: "<%=Url.Action("List", "Job" )%>",
                    editurl : "<%=Url.Action("EditRow", "Job" )%>",
                    ajaxGridOptions: {
                        type: "POST"
                    },
                    datatype: "json",
                    colNames: [ 'Id','Công việc', 'Công ty', 'Hạn nộp HS', 'Trạng thái',''],
                    colModel: [
                    {
                        name: 'Id',index: 'Id',key:true, width: 40, align: 'left',editable: false, editoptions: {readonly:'readonly'},editrules: { edithidden: true }, hidden: true },

                        { name: 'Title', index: 'Title', sortable: true, editable: true, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
                        { name: 'Company', index: 'Company', width: 150, align: 'left', sortable: true, editable: true, edittype: 'text', editoptions: { size: 20, maxlength:100}, hidden: false },
                        { name: 'Deadline', index: 'Deadline', width: 80 , align: 'center', editable: true, edittype: 'text',editoptions:{dataInit: function(element) {$(element).datepicker()}}, hidden: false },
                        { name: 'Status', index: 'Status', width: 50, align: 'center', sortable: true, editable: true, edittype: 'select', style: 'select', editoptions: { dataUrl: "<%=Url.Action("GetEntityStatus", "Generic" )%>"}, hidden: false },
                         { name: 'Options', index: 'Options', width: 50, align: 'center', sortable: false, editable: false, edittype: 'select', style: 'select', editoptions: { dataUrl: "<%=Url.Action("GetEntityStatus", "Generic" )%>"}, hidden: false },

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
                    caption: 'Danh sách các banner',
                    onSelectRow: function(id){
                        var row = jQuery("#grid").getRowData(id);
                        //alert(row['Status']);
                    },
                    loadComplete: function(){ 
                            var ids = jQuery("#grid").getDataIDs(); 
                            for(var i=0;i<ids.length;i++){ 
                                    var cl = ids[i];
                                    var edit = '<a  class="Edit" rel="' +cl + '" href="<%=Url.Action("Edit","Job")%>/' + cl +'" ><img src="<%=Url.Content("~/Images/edit_medium.png") %>" /></a>';
                                    jQuery("#grid").setRowData(ids[i],{Options:edit}) ;
                            } 
                    }, 

                    
                })
        .navGrid('#pager', { edit: true, add: true, del: true, search: true, view: true },{},{},{url:'JsonDelete'}).navButtonAdd('#pager',{
                           caption:"Active/Inactive", 
                           title:'Active or Inactive',
                           buttonicon:"ui-icon-power", 
                           onClickButton: function(){ 
                             
                                 var id = jQuery("#grid").jqGrid('getGridParam','selrow'); 
                                 
                                 if (id) { 
                                         var ret = jQuery("#grid").getRowData(id); 
                                         
                                         
                                         $.ajax({
                                                  type: 'POST',
                                                  url: "<%=Url.Action("Public", "Job" )%>",
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
            });
            }
        };
</script>
</asp:Content>