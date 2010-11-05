<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.Content>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Thêm mới chủ đề.
</asp:Content>
<asp:Content ID="Content11" runat="server" ContentPlaceHolderID="headerPlaceHolder" >
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
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Thêm mới chủ đề.</h2>

    <%= Html.ValidationSummary("Create was unsuccessful. Please correct the errors and try again.") %>

    <% using (Html.BeginForm("CreateIn", "Content", FormMethod.Post, new {enctype="multipart/form-data"})) {%>

        <fieldset>
            
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
                <%= Html.TextAreaFor(model => model.Content1, new { rows=32, cols="60" })%>
                <%= Html.ValidationMessageFor(model => model.Content1) %>
            </div>
           <div class="editor-label">
                <%= Html.LabelFor(model => model.CategoryId) %>
            </div>
            <div class="editor-field">
                <%=Html.Label(((ContentCategory) ViewData["Category"]).CategoryName) %>
                <%= Html.HiddenFor(p=>p.CategoryId)%>
                <%= Html.ValidationMessageFor(model => model.CategoryId) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.IsFeatured) %>
            </div>
            <div class="editor-field">
                <%= Html.CheckBox("IsFeatured",false) %>
                <%= Html.ValidationMessageFor(model => model.IsFeatured) %>
            </div>
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Picture) %>
            </div>
            <div class="editor-field">
                <input type="file" name="Picture" />
            </div>
           <div class="editor-label">
                <%= Html.LabelFor(model => model.Protected) %>
            </div>
            <div class="editor-field">
                <%=Html.CheckBoxFor(model=>model.Protected) %>
            </div>
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>
