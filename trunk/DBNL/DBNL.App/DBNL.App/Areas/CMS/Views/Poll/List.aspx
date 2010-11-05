<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DBNL.App.Models.Poll>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Khảo sát ý kiến
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Khảo sát ý kiến</h2>

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

    function moveup(id, grid) {
        
     $.ajax({
        type: 'POST',
        url: '<%=Url.Action("Up", "PollQuestion" )%>',
        data: {Id : id},
        success: function() {
            $("#"+$(grid).attr('rel')).trigger("reloadGrid")
        },
        dataType: 'json'
    });
}

function movedown(id, grid) {
     $.ajax({
        type: 'POST',
        url: '<%=Url.Action("Down", "PollQuestion" )%>',
        data: {Id : id},
        success: function() {
            $("#" +$(grid).attr('rel')).trigger("reloadGrid")
        },
        dataType: 'json'
    });
}

$(document).ready(function () {

            DBNL.Admin.Polls.setupGrid($("#grid"), $("#pager"));
        });

        DBNL.Admin.Polls= {
            setupGrid: function (grid, pager) {
                var lastsel;
                grid.jqGrid({
                    url: "<%=Url.Action("List", "Poll" )%>",
                    editurl : "<%=Url.Action("EditRow", "Poll" )%>",
                    ajaxGridOptions: {
                        type: "POST"
                    },
                    datatype: "json",
                    colNames: [ 'Id','Tên', 'Trạng thái'],
                    colModel: [
                    {
                        name: 'Id', index: 'Id', width: 40, align: 'left', editable: false, key: true, editoptions: {readonly:'readonly'},editrules: { edithidden: true }, hidden: true },

                        { name: 'PollName', index: 'PollName', width: 250, sortable: true, editable: true, edittype: 'text', editrules : {required:true}, editoptions: { size: 60, maxlength:100} , hidden: false },
                        { name: 'Status', index: 'Status', width: 35, align: 'center', sortable: true, editable: true, edittype: 'select', style: 'select', editoptions: { dataUrl: "<%=Url.Action("GetSelectStatus", "Poll" )%>"}, hidden: false },
                      ],
                    rowNum: 10,
                    rowList: [5,10,15, 20,25, 30,40,50,60,70,80,90,100],
                    pager: pager,
                    sortname: 'PollName',
                    sortorder: "asc",
                    viewrecords: true,
                    width: '100%',
                    height: '100%',
                    autowidth: true,
                    rownumbers: true,
                    caption: 'Danh sách các khảo sát hiện tại',
                    postData : {},
                    
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
                    
                            url:"<%=Url.Action("GetQuestions", "PollQuestion" )%>/", 
                            editurl : "<%=Url.Action("EditRow", "PollQuestion" )%>/?PollId=" + eid,
                            datatype: "json", 
                            ajaxGridOptions: {
                                                    type: "POST"
                                                },
                            colNames: ['Id','Câu hỏi','Số lần chọn', '%',''], 
                            colModel: [ 
                                        {name:"Id", index:"Id", width:100, sortable: false, editable: false, editoptions: {readonly:'readonly'}, editrules: { edithidden: true }, key:true, hidden:true},
                                        {name:"Question", index:"Question", width:625, sortable: true, editable: true, editrules : {required:true}, editoptions: { size: 60, maxlength:100}}, 
                                        {name:"Responses", index:"Responses", width:150, align: 'center',editrules : {readonly:true}, editable:true, sortable:true} ,                                
                                        {name:"Percent", index:"Responses", width:150, align: 'center', sortable:true}    , 
                                        {name:"Options", index:"Options", width:150, align: 'center', sortable:false,editable:false }   
                                      ],
                             rowNum:20, 
                             rowList: [5,10,15, 20,25, 30,40,50,60,70,80,90,100],
                             pager: pager_id, 
                             sortname: 'Order', 
                             sortorder: "asc", 
                             height: '100%' ,
                             width:'100%',
                             viewrecords: true,
                             autowidth: true,
                            rownumbers: true,
                            caption: 'Danh sách câu hỏi trong mục này',
                            userdata: {PollId:$("#grid").getRowData(row_id)["Id"]},
                            postData: {PollId:eid},
                            loadComplete: function(xhr){ 
                            
                            var ids = jQuery("#"+subgrid_table_id).getDataIDs(); 
                            for(var i=0;i<ids.length;i++){ 
                                    var cl = ids[i];
                                    var idup = "up_"+ subgrid_table_id+"_" + cl;

                                    var up = '<a  class="Up" Id="' +idup+'" onclick="moveup('+cl+', this);return false" rel="' +subgrid_table_id + '" href="<%=Url.Action("Up","PollQuestion")%>/' + cl +'" ><img src="<%=Url.Content("~/Images/arrow_up.png") %>" /></a>';
                                    var down = '<a  class="Down" onclick="movedown('+cl+', this);return false" rel="' +subgrid_table_id + '" href="<%=Url.Action("Down","PollQuestion")%>/' + cl +'" ><img src="<%=Url.Content("~/Images/arrow_down.png") %>" /></a>';

                                    jQuery("#"+subgrid_table_id).setRowData(ids[i],{Options: up + down });
                            } 
                    },
                             
                    }); 
                    jQuery("#"+subgrid_table_id).jqGrid('navGrid',"#"+pager_id,{edit:true,add:true,del:true,search: true, view: true}, {width:'450'},{},{url:'<%=Url.Action("JsonDelete", "PollQuestion" )%>'})

               },
                subGridRowColapsed: function(subgrid_id, row_id) {
                     var subgrid_table_id; //
                     subgrid_table_id = subgrid_id+"_t"; //
                     jQuery("#"+subgrid_table_id).remove(); 
                 } 
                }).navGrid('#pager', { edit: true, add: true, del: true, search: true, view: true }, {width:'450'},{},{url:'JsonDelete'}).navButtonAdd('#pager',{
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
                                 alert("Bạn phải chọn một dòng để thực hiện thao tác này.");
                                 } 
                             } ,
                            
                           position:"last"
            });
            }}
        
</script>
</asp:Content>

                  