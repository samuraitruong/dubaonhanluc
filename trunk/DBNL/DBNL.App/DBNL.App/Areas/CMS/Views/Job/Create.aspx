<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.Job>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Create</h2>

    <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Fields</legend>
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Title) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Title) %>
                <%= Html.ValidationMessageFor(model => model.Title) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Description) %>
            </div>
            <div class="editor-field">
                <%= Html.TextAreaFor(model => model.Description, new { rows= 10, cols= 60})%>
                <%= Html.ValidationMessageFor(model => model.Description) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.JobDetail) %>
            </div>
            <div class="editor-field">
                <%= Html.TextAreaFor(model => model.JobDetail, new { rows = 30, cols = 60 }) %>
                <%= Html.ValidationMessageFor(model => model.JobDetail)%>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Deadline) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Deadline, new {@class="DatePicker", value=Model.Deadline.ToShortDateString()})%>
                <%= Html.ValidationMessageFor(model => model.Deadline)%>
            </div>

            <div class="editor-label">
                <%= Html.LabelFor(model => model.Company) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Company) %>
                <%= Html.ValidationMessageFor(model => model.Company) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.CompanyInfo) %>
            </div>
            <div class="editor-field">
                <%= Html.TextAreaFor(model => model.CompanyInfo, new { rows = 10, cols = 60 })%>
                <%= Html.ValidationMessageFor(model => model.CompanyInfo) %>
            </div>
            
           

            <p>
                <input type="submit" value="Thêm mới" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%= Html.ActionLink("Back to List", "Index") %>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="headerPlaceHolder" runat="server">
    <script type="text/javascript" src="<% =Url.Content("~/Content/jqueryUI1.8a/development-bundle/ui/minified/jquery.ui.datepicker.min.js")%>"></script>
     <script language="javascript" type="text/javascript">
         $(document).ready(function () {

             CKEDITOR.replace('JobDetail',
             {
                 filebrowserBrowseUrl: '<%= Url.Content("~/Scripts/FileManager/index.html") %>'
             });
             //$(".DatePicker").datepicker();
             $('.DatePicker').datepicker({ dateFormat: 'dd/mm/yy', yearRange: '2000:2020', showButtonPanel: true, appendText: '(dd/mm/yyyy)', buttonImage: 'http://www.marocotel.com/images/btn_datepicker.gif', buttonImageOnly: true, changeMonth: true, changeYear: true });

         });
    </script>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>

