<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.Content>" %>
<%@ Import Namespace="DBNL.App.Config" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Cập nhật chủ đề
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Cập nhật chủ đề</h2>

    <% using ((Html.BeginForm("Edit", "Content", FormMethod.Post, new { enctype = "multipart/form-data" })))
       {%>
        <%= Html.ValidationSummary(true) %>
        <fieldset>
            <legend>Fields</legend>
            <div class="editor-field">
                <%= Html.HiddenFor(model => model.ContentId) %>
                <%= Html.ValidationMessageFor(model => model.ContentId) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Title) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Title, new { size = 80, maxlength = 255 })%>
                <%= Html.ValidationMessageFor(model => model.Title) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Description) %>
            </div>
            <div class="editor-field">
                <%= Html.TextAreaFor(model => model.Description, new { rows = 10, cols = 60 })%>
                <%= Html.ValidationMessageFor(model => model.Description) %>
            </div>

            <div class="editor-label">
                <%= Html.LabelFor(model => model.Content1) %>
            </div>
            <div class="editor-field">
                <%= Html.TextAreaFor(model => model.Content1, new { rows=25, cols="60" })%>
                <%= Html.ValidationMessageFor(model => model.Content1) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.CategoryId) %>
            </div>
            <div class="editor-field">
                <%= Html.DropDownList("CategoryId", (IEnumerable<SelectListItem>)ViewData["Categories"])%>
                <%= Html.ValidationMessageFor(model => model.CategoryId) %>
            </div>
         
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.IsFeatured) %>
            </div>
            <div class="editor-field">
                <%= Html.CheckBox("IsFeatured", Model.IsFeatured) %>
                <%= Html.ValidationMessageFor(model => model.IsFeatured) %>
            </div>
            
            
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Picture) %>
            </div>
            <div class="editor-field">
                <input type="file" name="PictureFile" />
                <img width="114" height="114" src="<%= DBNLConfigurationManager.FileResponsity.PictureRelativeUrl %>/<%= Model.Picture %>
" alt="Alternate Text" />
            </div>
            
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%= Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="headerPlaceHolder" runat="server">
 <script language="javascript" type="text/javascript">
     $(document).ready(function () {
         CKEDITOR.replace('Content1',
             {
                 filebrowserBrowseUrl: '<%= Url.Content("~/Scripts/FileManager/index.html") %>'
             }
          );
     });
    </script>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>

