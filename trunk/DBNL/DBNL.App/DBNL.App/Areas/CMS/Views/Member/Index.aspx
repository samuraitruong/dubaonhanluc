<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.Job>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><% = DBNL.App.Areas.CMS.Views.Member.MemberStrings.Title %></h2>
    <div>
        <table id="grid" cellpadding="0" cellspacing="0">
        </table>
        <div id="pager" style="text-align: center;"/>
        
    </div>
    <%=Html.ActionLink("Quản lí nghề nghiệp", "Index","Career") %>
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

            DBNL.Admin.Members.setupGrid($("#grid"), $("#pager"));

//             $("#BannerPosition").bind("change", function() {
//                jQuery("#grid").setGridParam({ postData: {Position:  $(this).val()}})  
//                                      
//                                       .trigger('reloadGrid');  
//                                       
//            
//            });

        });

        DBNL.Admin.Members= {
            setupGrid: function (grid, pager) {
                var lastsel;
                grid.jqGrid({
                    url: "<%=Url.Action("List", "Member" )%>",
                    editurl : "<%=Url.Action("EditRow", "Member" )%>",
                    ajaxGridOptions: {
                        type: "POST"
                    },
                    datatype: "json",
                    colNames: [ 'Id','Login','Email', 'Tên', 'Nghề nghiệp','Giới tính','Địa chỉ','Ngày Sinh','Ngày đăng ký', 'Trạng thái',''],
                    colModel: [
                    {
                        name: 'Id',index: 'Id',key:true, width: 40, align: 'left',editable: false, editoptions: {readonly:'readonly'},editrules: { edithidden: true }, hidden: true },

                        { name: 'Login', index: 'LoginName',width: 70, sortable: true, editable: true, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
                        { name: 'Email', index: 'Email', width: 100, align: 'left', sortable: false, editable: true, edittype: 'text', editoptions: { size: 20, maxlength:100}, hidden: false },
                        { name: 'Name', index: 'Name', width: 80 , align: 'center', editable: false, edittype: 'text',editoptions:{dataInit: function(element) {$(element).datepicker()}}, hidden: false },
                        { name: 'Career', index: 'Career', width: 90 , align: 'center', editable: false, edittype: 'text',editoptions:{dataInit: function(element) {$(element).datepicker()}}, hidden: false },
                        { name: 'Sex', index: 'IsMale', width: 30 , align: 'center', editable: false, edittype: 'text',editoptions:{dataInit: function(element) {$(element).datepicker()}}, hidden: false },
                        { name: 'Address', index: 'Address', width: 120 , align: 'center', editable: false, edittype: 'text',editoptions:{dataInit: function(element) {$(element).datepicker()}}, hidden: false },
                        { name: 'Birthday', index: 'Birthday', width: 50 , align: 'center', editable: false, edittype: 'text',editoptions:{dataInit: function(element) {$(element).datepicker()}}, hidden: false },
                        { name: 'CreatedDate', index: 'CreatedDate', width: 50 , align: 'center', editable: false, edittype: 'text',editoptions:{dataInit: function(element) {$(element).datepicker()}}, hidden: false },
                        { name: 'Status', index: 'Status', width: 40, align: 'center', sortable: true, editable: true, edittype: 'select', style: 'select', editoptions: { dataUrl: "<%=Url.Action("GetEntityStatus", "Generic" )%>"}, hidden: false },
                         { name: 'Options', index: 'Options', width: 20, align: 'center', sortable: false, editable: false, edittype: 'select', style: 'select', editoptions: { dataUrl: "<%=Url.Action("GetEntityStatus", "Generic" )%>"}, hidden: false },

                      ],
                    rowNum: 10,
                    rowList: [5,10,15, 20,25, 30,40,50,60,70,80,90,100],
                    pager: pager,
                    sortname: 'CreatedDate',
                    sortorder: "desc",
                    viewrecords: true,
                    width: '100%',
                    height: '100%',
                    autowidth: true,
                    rownumbers: true,
                    caption: 'Danh sách công việc đang được tuyển dụng',
                    onSelectRow: function(id){
                        var row = jQuery("#grid").getRowData(id);
                        //alert(row['Status']);
                    },
                    loadComplete: function(){ 
                            var ids = jQuery("#grid").getDataIDs(); 
                            for(var i=0;i<ids.length;i++){ 
                                    var cl = ids[i];
                                    var edit = '<a  class="Edit" rel="' +cl + '" href="<%=Url.Action("Edit","Job")%>/' + cl +'" ><img src="<%=Url.Content("~/Images/edit_medium.png") %>" /></a>';
                                    //jQuery("#grid").setRowData(ids[i],{Options:edit}) ;
                            } 
                    }, 

                    
                })
        .navGrid('#pager', { edit: true, add: true, del: true, search: true, view: true },{},{},{url:'<%=Url.Action("JSonDelete","Member") %>'}).navButtonAdd('#pager',{
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