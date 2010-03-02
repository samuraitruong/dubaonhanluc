<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.ContentCategory>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	EditContentCategory
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit ContentCategory</h2>

    <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.ID) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.ID) %>
                <%= Html.ValidationMessageFor(model => model.ID) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.CategoryName) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.CategoryName) %>
                <%= Html.ValidationMessageFor(model => model.CategoryName) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Key) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Key) %>
                <%= Html.ValidationMessageFor(model => model.Key) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.ParentCategoryId) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.ParentCategoryId) %>
                <%= Html.ValidationMessageFor(model => model.ParentCategoryId) %>
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

