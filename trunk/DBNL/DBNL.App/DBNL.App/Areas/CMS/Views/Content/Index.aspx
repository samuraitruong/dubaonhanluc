﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DBNL.App.Models.Content>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <div>
    <p>
        <%= Html.DropDownList("Category", (IEnumerable<SelectListItem>)ViewData["Categories"])%>
    </p>
        <table id="grid" cellpadding="0" cellspacing="0">
        </table>
        <div id="pager" style="text-align: center;">
        
    </div>
    

    <p>
        <%= Html.ActionLink("Thêm mới", "Create") %>
    </p>

</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptContent">
    <script language="javascript" type="text/javascript" src="<%= Url.Content("~/Scripts/GridData.js") %>"></script>
    <script type="text/javascript">
    function imageFormater ( cellvalue, options, rowObject )
{
    return "<img src='" + cellvalue +"' width='75' height='54' />";
    
}

$(document).ready(function () {

            DBNL.Admin.Contents.setupGrid($("#grid"), $("#pager"));
              $("#Category").bind("change", function() {
                jQuery("#grid").setGridParam({ postData: {CategoryId:  $(this).val()}})  
                                      
                                       .trigger('reloadGrid');  
                                       
            
            });
            
        });

        DBNL.Admin.Contents= {
            setupGrid: function (grid, pager) {
                var lastsel;
                grid.jqGrid({
                    url: "<%=Url.Action("GetList", "Content" )%>",
                    editurl : "<%=Url.Action("EditRow", "Content" )%>",
                    ajaxGridOptions: {
                        type: "POST"
                    },
                    datatype: "json",
                    colNames: [ 'Id','Title', 'Thumbnail','Url', 'Status', 'Category',''],
                    colModel: [
                    {
                        name: 'Id', key:true, index: 'Id', width: 20, align: 'left',editable: false, editoptions: {readonly:'readonly'},editrules: { edithidden: true }, hidden: true },

                        { name: 'Title', index: 'Title', width: 160,sortable: true, editable: true, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
                        { name: 'Thumbnail', index: 'Thumbnail', width: 50, align: 'left', formatter: imageFormater, formatoptions: { prefix: "$" }, sortable: true, editable: true, edittype: 'text', editoptions: { size: 20, maxlength:100}, hidden: false },
                        { name: 'Url', index: 'Url', align:'left', formatter:'link', formatoptions: {target:'_blank'},width: 80, sortable: false, editable: false, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
                        { name: 'Status', index: 'Status', width: 40, align: 'center', editable: true, edittype: 'text', editoptions: { size: 20, maxlength:100}, hidden: false },
                        { name: 'Category', index: 'Category', width: 120, align: 'center', sortable: true, editable: true, edittype: 'select', style: 'select', editoptions: { dataUrl: "<%=Url.Action("GetSelectStatus", "Banner" )%>"}, hidden: false },
                        { name: 'Options', index: 'Options', width: 60, align: 'center', sortable: false, editable: false}

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
                    postData : {CategoryId: $("Category").val()},
                    caption: 'Danh sách các bài viết.',
                    loadComplete: function(){ 
                            var ids = jQuery("#grid").getDataIDs(); 
                            for(var i=0;i<ids.length;i++){ 
                                    var cl = ids[i];
                                    var edit = '<a  class="Edit" rel="' +cl + '" href="<%=Url.Action("Edit","Content")%>/' + cl +'" ><img src="<%=Url.Content("~/Images/edit_medium.png") %>" /></a>';
                                    jQuery("#grid").setRowData(ids[i],{Options:edit}) ;
                            } 
                    }, 

                    
                })
        .navGrid('#pager', { edit: true, add: true, del: true, search: true, view: true }, {},{},{url:'<%=Url.Action("JsonDelete", "Content" )%>'}).navButtonAdd('#pager',{
                           caption:"Active/Inactive", 
                           buttonicon:"ui-icon-power", 
                           onClickButton: function(){ 
                             
                                 var myid = jQuery("#grid").jqGrid('getGridParam','selrow'); 
                                 
                                 if (myid) { 
                                        
                                         var ret = jQuery("#grid").getRowData(myid); 
                                         $.ajax({
                                                  type: 'POST',
                                                  url: "<%=Url.Action("ToggleActive", "Content" )%>",
                                                  data: {Id : ret["Id"]},
                                                  success: function() {
                                                    $("#grid").trigger("reloadGrid")
                                                  },
                                                  dataType: 'json'
                                                });

                                 } else { 
                                 alert("Chưa chọn dòng nào");
                                 } 
                             } ,
                           position:"last"
            });;
            }
        };
</script>
</asp:Content>
