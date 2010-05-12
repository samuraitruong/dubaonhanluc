<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DBNL.App.Models.Banner>>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Danh sách banner
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Danh sách banner</h2>
        <p>
            Chọn vị trí banner : 
            <%=Html.DropDownList("BannerPosition", DBNL.App.Models.Statics.CustomSelectList.CreateBannerPosition()) %>
        </p>
     <div>
        <table id="grid" cellpadding="0" cellspacing="0">
        </table>
        <div id="pager" style="text-align: center;">
        
    </div>
    <p>
        <%=Html.ActionLink("Thêm Mới ", "Create", "Banner") %>
    </p>
    <div id="dynamicLink"></div>
    </div>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptContent">
    <script language="javascript" type="text/javascript" src="<%= Url.Content("~/Scripts/GridData.js") %>"></script>
    <script type="text/javascript">
    function bannerImageElem (value, options) {
      var el = document.createElement("img");
      el.type="img";
      el.src = value;
      return value;
    }
 function bannerImageVal(elem) {
  return $(elem).attr("src");
}
 function UpdateCreateInLink(id) {
        var createInAction = '<% = Url.Action("CreateIn", "Banner") %>/';
        $("#dynamicLink").empty();
        var a = $("<a/>", {href:createInAction +id, text:'Thêm banner vào mục này.' });
        $("#dynamicLink").append(a);
    }

$(document).ready(function () {
            DBNL.Admin.Banners.setupGrid($("#grid"), $("#pager"));

             $("#BannerPosition").bind("change", function() {
                UpdateCreateInLink($(this).val())
                jQuery("#grid").setGridParam({ postData: {Position:  $(this).val()}})  
                                      
                                       .trigger('reloadGrid');  
                                       
            
            });

        });

        DBNL.Admin.Banners= {
            setupGrid: function (grid, pager) {
                var lastsel;
                grid.jqGrid({
                    url: "<%=Url.Action("List", "Banner" )%>",
                    editurl : "<%=Url.Action("EditRow", "Banner" )%>",
                    ajaxGridOptions: {
                        type: "POST"
                    },
                    datatype: "json",
                    colNames: [ 'Id','Tên', 'Đường dẫn', 'Hình', 'Vị trí', 'Tình trạng'],
                    colModel: [
                    {
                        name: 'Id',index: 'Id',key:true, width: 40, align: 'left',editable: false, editoptions: {readonly:'readonly'},editrules: { edithidden: true }, hidden: true },

                        { name: 'Name', index: 'Name', sortable: true, editable: true, edittype: 'text', editrules : {required:true}, editoptions: { size: 60, maxlength:100} , hidden: false },
                        { name: 'Url', index: 'Url', width: 150, align: 'left', formatter: 'link', editrules : {required:true},sortable: true, editable: true, edittype: 'text', editoptions: { size: 60, maxlength:100}, hidden: false },
                        { name: 'Image', index: 'Image', width: 80,formatter:imageFormater , align: 'center', editable: true, edittype: 'custom',editoptions:{custom_element: bannerImageElem, custom_value:bannerImageVal}, hidden: false },
                        { name: 'Position', index: 'Position', width: 40, align: 'center', sortable: true, editable: true, edittype: 'select', style: 'select', editoptions: { dataUrl: "<%=Url.Action("GetSelectPosition", "Banner" )%>"}, hidden: false },
                        { name: 'Status', index: 'Status', width: 50, align: 'center', sortable: true, editable: true, edittype: 'select', style: 'select', editoptions: { dataUrl: "<%=Url.Action("GetSelectStatus", "Banner" )%>"}, hidden: false },

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
                    caption: 'Danh sách các banner',
                    onSelectRow: function(id){
                        var row = jQuery("#grid").getRowData(id);
                        //alert(row['Status']);
                    }

                    
                })
        .navGrid('#pager', { edit: true, add: true, del: true, search: true, view: true },{width:'450'},{},{url:'JsonDelete'}).navButtonAdd('#pager',{
                           caption:"Active/Inactive", 
                           title:'Active or Inactive',
                           buttonicon:"ui-icon-power", 
                           onClickButton: function(){ 
                             
                                 var id = jQuery("#grid").jqGrid('getGridParam','selrow'); 
                                 
                                 if (id) { 
                                         var ret = jQuery("#grid").getRowData(id); 
                                         
                                         
                                         $.ajax({
                                                  type: 'POST',
                                                  url: "<%=Url.Action("Public", "Banner" )%>",
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