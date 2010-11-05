<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DBNL.App.Models.Content>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <p> Chọn danh mục:
        <%= Html.DropDownList("Category", (IEnumerable<SelectListItem>)ViewData["Categories"])%>
    </p>
    <div id="container" style="width:100%">
        <ul id="categoryTreeView" class="treeview">
     
         </ul>
         <div class="GridBox" style="float:right;">
            <table id="grid" cellpadding="0" cellspacing="0">
            </table>
            <div id="pager" style="text-align: center;"/>
            

        </div>
        <div style="clear:both">
                <%= Html.ActionLink("Thêm mới", "Create") %>
                <span style="float:right;padding-right: 20px; pading-top:10px;display:inline-block" id="deleteLink">
                
                </span>
                <p id="dynamicLink">
                
                </p>
       </div>
    </div>
    

    

</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptContent">
    <script language="javascript" type="text/javascript" src="<%= Url.Content("~/Scripts/GridData.js") %>"></script>
    <script type="text/javascript">
    
    function imageFormater ( cellvalue, options, rowObject )
    {
        return "<img src='" + cellvalue +"' width='75' height='54' />";
    
    }

    function UpdateCreateInLink(id) {
        var createInAction = '<% = Url.Action("CreateIn", "Content") %>/';
        var deleteAction = '<% = Url.Action("JSonDelete", "Categories") %>/';
        $("#dynamicLink").empty();
        $("#deleteLink").empty();
        var a = $("<a/>", {href:createInAction +id, text:'Thêm bài viết vào mục này.' });

        var a1 = $("<a/>", {href:'#' +id, text:'Xoá danh mục này.' });
        a1.bind("click", function() {
			if(!confirm("Bạn chắc là muốn thực hiện lệnh xoá này chứ. Mọi thông tin bài viết của chủ đề này sẽ bị xoá vĩnh viễn")) {
				return;
			}
            $.ajax({
                    type: 'POST',
                    url: '<%=Url.Action("JSonDelete", "Categories" )%>/',
                    data: {Id : id},
                    success: function() {
                    window.location.reload();
                    },
                    dataType: 'json'
                });
            return false;
        });
        $("#dynamicLink").append(a);
        
        $("#deleteLink").append(a1);
    }
$(document).ready(function () {

            DBNL.Admin.Contents.setupGrid($("#grid"), $("#pager"));

              $("#Category").bind("change", function() {
                UpdateCreateInLink($(this).val());
                jQuery("#grid").setGridParam({ postData: {CategoryId:  $(this).val()}})  
                                      
                                       .trigger('reloadGrid');  
                                       
            });
            $("#categoryTreeView").treeview({
			    url: "<%=Url.Action("TreeNode", "Categories" )%>",
                 toggle: function() {
                    
                   },

                nodeClick : function () {
                    var id = this.id;
                    $("#Category").val(id);
                    jQuery("#grid").setGridParam({ postData: {CategoryId:  id}}).trigger('reloadGrid');  
                    UpdateCreateInLink(id);
                }
		    })
            
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
                    colNames: [ 'Id','Title', 'Thumbnail','Url','Featured','IsForcusing','Ngày đăng', 'Status', 'Category',''],
                    colModel: [
                    {
                        name: 'Id', key:true, index: 'Id', width: 20, align: 'left',editable: false, editoptions: {readonly:'readonly'},editrules: { edithidden: true }, hidden: true },

                        { name: 'Title', index: 'Title', width: 160,sortable: true, editable: true, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
                        { name: 'Thumbnail', index: 'Thumbnail', width: 50,softable:false, align: 'left', formatter: imageFormater, formatoptions: { prefix: "$" }, sortable: true, editable: true, edittype: 'text', editoptions: { size: 20, maxlength:100}, hidden: false },
                        { name: 'Url', index: 'Url', align:'left', formatter:'link', formatoptions: {target:'_blank'},width: 80, sortable: false, editable: false, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
                        { name: 'Featured', index: 'Featured', align:'center', sortable: true,formatter:'checkbox', formatoptions: {disabled:true},width: 80, sortable: false, editable: false, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
                        { name: 'IsForcusing', index: 'IsForcusing', align:'center',sortable: true, formatter:'checkbox', formatoptions: {disabled:true},width: 80, sortable: false, editable: false, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
                        { name: 'PostedDate', index: 'CreatedDate', align:'center',width: 60, sortable: true, editable: false, edittype: 'text', editoptions: { size: 20, maxlength:100} , hidden: false },
                        { name: 'Status', index: 'Status', width: 40, align: 'center', editable: true, edittype: 'text', editoptions: { size: 20, maxlength:100}, hidden: false },
                        { name: 'Category', index: 'Category', width: 120, align: 'center', sortable: true, editable: true, edittype: 'select', style: 'select', editoptions: { dataUrl: "<%=Url.Action("GetSelectStatus", "Banner" )%>"}, hidden: false },
                        { name: 'Options', index: 'Options', width: 60, align: 'center', sortable: false, editable: false}

                      ],
                    rowNum: 10,
                    rowList: [5,10,15, 20,25, 30,40,50,60,70,80,90,100],
                    pager: pager,
                    sortname: 'ContentId',
                    sortorder: "desc",
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
                    } ,
                    loadError : function (xhr,status,error) { 
                        window.location.reload(true);
                    },
                }).navGrid('#pager', { edit: true, add: true, del: true, search: true, view: true }, {},{},{url:'<%=Url.Action("JsonDelete", "Content" )%>'}).navButtonAdd('#pager',{
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
            }).navButtonAdd('#pager',{
                           caption:"Show/Unshow on HP", 
                           buttonicon:"ui-icon-power", 
                           onClickButton: function(){ 
                             
                                 var myid = jQuery("#grid").jqGrid('getGridParam','selrow'); 
                                 
                                 if (myid) { 
                                        
                                         var ret = jQuery("#grid").getRowData(myid); 
                                         $.ajax({
                                                  type: 'POST',
                                                  url: "<%=Url.Action("ToggleOnHP", "Content" )%>",
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
