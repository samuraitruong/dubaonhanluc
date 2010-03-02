<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.Content>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	AddContent
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Add Content</h2>

    <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.ContentId) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.ContentId) %>
                <%= Html.ValidationMessageFor(model => model.ContentId) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Title) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Title) %>
                <%= Html.ValidationMessageFor(model => model.Title) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Content1) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Content1) %>
                <%= Html.ValidationMessageFor(model => model.Content1) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.CategoryId) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.CategoryId) %>
                <%= Html.ValidationMessageFor(model => model.CategoryId) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.CreatedDate) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.CreatedDate) %>
                <%= Html.ValidationMessageFor(model => model.CreatedDate) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.UpdatedDate) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.UpdatedDate) %>
                <%= Html.ValidationMessageFor(model => model.UpdatedDate) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.IsFeatured) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.IsFeatured) %>
                <%= Html.ValidationMessageFor(model => model.IsFeatured) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Status) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Status) %>
                <%= Html.ValidationMessageFor(model => model.Status) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Count) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Count) %>
                <%= Html.ValidationMessageFor(model => model.Count) %>
            </div>
            
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%= Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

