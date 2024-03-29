﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DBNL.App.Models.Navigation>>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	List
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>List</h2>
        <div>
        <label>Chọn vị trí menu</label>
            <%=Html.DropDownList("Position", DBNL.App.Models.Statics.CustomSelectList.CreateMenuPosition() )%>
        </div>
     <div>
        <table id="grid" cellpadding="0" cellspacing="0">
        </table>
        <div id="pager" style="text-align: center;"/>
        
    </div>
    
     <div style="padding-top:35px">
     <h2>Danh sách các bài viết</h2>
        <table id="article_grid" cellpadding="0" cellspacing="0">
        </table>
        <div id="article_grid_pager" style="text-align: center;"/>
        
    </div>
    
    </div>
    <p>
        <%= Html.ActionLink("Create New", "Create") %>
    </p>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptContent">
    <script language="javascript" type="text/javascript" src="<%= Url.Content("~/Scripts/GridData.js") %>"></script>
    <script type="text/javascript">
$(document).ready(function () {

            DBNL.Admin.Navigations.setupGrid($("#grid"), $("#pager"));
            
            $("#Position").bind("change", function() {
                jQuery("#grid").setGridParam({ postData: {Position:  $(this).val()}})  
                                      
                                       .trigger('reloadGrid');  
                                       
            
            });
            //DBNL.Admin.Categories.Articles.setupGrid($("#article_grid"), $("#article_grid_pager"));
        });

        DBNL.Admin.Navigations= {
            setupGrid: function (grid, pager) {
                var lastsel;
                grid.jqGrid({
                    url: "<%=Url.Action("List", "Navigation" )%>",
                    editurl : "<%=Url.Action("EditRow", "Navigation" )%>",
                    ajaxGridOptions: {
                        type: "POST"
                    },
                    datatype: "json",
                    colNames: [ 'Id','Name'],
                    colModel: [
                    {
                        name: 'Id', index: 'ID', width: 40, align: 'left', editable: false, key: true, editoptions: {readonly:'readonly'},editrules: { edithidden: true }, hidden: true },

                        { name: 'Name', index: 'Name', width: 250, sortable: true, editable: true, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false }
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
                    caption: 'Categories List',
                    postData : {Position: $("#Position").val()},
                    subGrid: true,
                    subGridRowExpanded: function(subgrid_id, row_id) { 
                    // we pass two parameters // subgrid_id is a id of the div tag created whitin a table data 
                    // the id of this elemenet is a combination of the "sg_" + id of the row // the row_id is the id of the row 
                    // If we wan to pass additinal parameters to the url we can use 
                    // a method getRowData(row_id) - which returns associative array in type name-value 
                    // here we can easy construct the flowing 
                    var subgrid_table_id, pager_id; 
                    subgrid_table_id = subgrid_id+"_t"; 
                    pager_id = "p_"+subgrid_table_id; 
                    var eid = $("#grid").getRowData(row_id)["Id"];
                    $("#"+subgrid_id).html("<table id='"+subgrid_table_id+"' class='scroll'></table><div id='"+pager_id+"' class='scroll'></div>"); 
                    jQuery("#"+subgrid_table_id).jqGrid({ 
                    
                            url:"<%=Url.Action("List", "Navigation" )%>", 
                            datatype: "json", 
                            ajaxGridOptions: {
                            type: "POST"
                        },
                            colNames: [ 'Id','Name'],
                            colModel: [
                            {
                                name: 'Id', index: 'ID', width: 40, align: 'left', editable: false, key: true, editoptions: {readonly:'readonly'},editrules: { edithidden: true }, hidden: true },

                                { name: 'Name', index: 'Name', width: 250, sortable: true, editable: true, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false }
                              ],
                             rowNum:20, 
                             rowList: [10, 20, 30],
                             pager: pager_id, 
                             sortname: 'Name', 
                             sortorder: "asc", 
                             height: '100%' ,
                             width:'100%',
                             viewrecords: true,
                             autowidth: true,
                            rownumbers: true,
                            caption: 'Danh sách menu con',
                             userdata: {PollId:$("#grid").getRowData(row_id)["id"]},
                             postData: {ParentId:eid},
                            onSelectRow: function(ids) {  
                                return;
                                if (ids != null) {  
                                       var data = $("#"+subgrid_table_id).getRowData(ids);  
                                       jQuery("#article_grid").setGridParam({ postData: {ParentId: data["Id"]}, page: 1 })  
                                       .setCaption("<b>Danh sách các menu con trong mục : " + data["Name"]+"</b>")  
                                       .trigger('reloadGrid');  
                                    } 
                            }
                             
                    }); 
                    jQuery("#"+subgrid_table_id).jqGrid('navGrid',"#"+pager_id,{edit:true,add:true,del:true,search: true, view: true})

               },
                subGridRowColapsed: function(subgrid_id, row_id) {
                     var subgrid_table_id; //
                     subgrid_table_id = subgrid_id+"_t"; //
                     jQuery("#"+subgrid_table_id).remove(); 
                 },
                 onSelectRow: function(ids) {  
                    if (ids != null) {  
                           var data = $("#grid").getRowData(ids);  
                           jQuery("#article_grid").setGridParam({ postData: {CategoryId: data["Id"]}, page: 1 })  
                           .setCaption("<b>Danh sách các bài viết trong mục : " + data["Name"]+"</b>")  
                           .trigger('reloadGrid');  
                        } 
                }
                }).navGrid('#pager', { edit: true, add: true, del: true, search: true, view: true }).navButtonAdd('#pager',{
                           caption:"Public", 
                           buttonicon:"ui-icon-add", 
                           onClickButton: function(){ 
                             
                                 var id = jQuery("#grid").jqGrid('getGridParam','selrow'); 
                                 
                                 if (id) { 
                                         var ret = jQuery("#grid").getRowData(id); 
                                         $.ajax({
                                                  type: 'POST',
                                                  url: "<%=Url.Action("Public", "Poll" )%>",
                                                  data: {Id : ret["Id"]},
                                                  success: function() {
                                                    $("#grid").trigger("reloadGrid")
                                                  },
                                                  dataType: 'json'
                                                });

                                 } else { 
                                 alert("Please select row");
                                 } 
                             } ,
                           position:"last"
            });
            }}
        
//        DBNL.Admin.Categories.Articles= {
//            setupGrid: function (grid, pager) {
//                var lastsel;
//                grid.jqGrid({
//                    url: "<%=Url.Action("List", "Content" )%>",
//                    editurl : "<%=Url.Action("EditRow", "Poll" )%>",
//                    ajaxGridOptions: {
//                        type: "POST"
//                    },
//                    datatype: "json",
//                    colNames: [ 'Id','Title'],
//                    colModel: [
//                    {
//                        name: 'Id', index: 'ContentId', width: 40, align: 'left', editable: false, key: true, editoptions: {readonly:'readonly'},editrules: { edithidden: true }, hidden: true },

//                        { name: 'Title', index: 'Title', width: 250, sortable: true, editable: true, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false }
//                      ],
//                    rowNum: 10,
//                    rowList: [10, 20, 30],
//                    pager: pager,
//                    sortname: 'Title',
//                    sortorder: "asc",
//                    viewrecords: true,
//                    width: '100%',
//                    height: '100%',
//                    autowidth: true,
//                    rownumbers: true,
//                    postData : {CategoryId: 0},
//                    caption: 'Categories List'
//                }).navGrid('#article_grid_pager', { edit: true, add: true, del: true, search: true, view: true }).navButtonAdd('#article_grid_pager',{
//                           caption:"Public", 
//                           buttonicon:"ui-icon-add", 
//                           onClickButton: function(){ 
//                             
//                                 var id = jQuery("#article_grid").jqGrid('getGridParam','selrow'); 
//                                 
//                                 if (id) { 
//                                         var ret = jQuery("#artile_grid").getRowData(id); 
//                                         $.ajax({
//                                                  type: 'POST',
//                                                  url: "<%=Url.Action("Public", "Poll" )%>",
//                                                  data: {Id : ret["EntityId"]},
//                                                  success: function() {
//                                                    $("#grid").trigger("reloadGrid")
//                                                  },
//                                                  dataType: 'json'
//                                                });

//                                 } else { 
//                                 alert("Please select row");
//                                 } 
//                             } ,
//                           position:"last"
//            });
//            }}
            
</script>



    

</asp:Content>

