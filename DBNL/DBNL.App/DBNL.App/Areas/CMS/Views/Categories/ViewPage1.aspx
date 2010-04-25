<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.ContentCategory>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ViewPage1
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>ViewPage1</h2>

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
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.IsFeatured) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.IsFeatured) %>
                <%= Html.ValidationMessageFor(model => model.IsFeatured) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.ShowOnHP) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.ShowOnHP) %>
                <%= Html.ValidationMessageFor(model => model.ShowOnHP) %>
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
                <%= Html.LabelFor(model => model.Status) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Status) %>
                <%= Html.ValidationMessageFor(model => model.Status) %>
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

<asp:Content ID="Content3" ContentPlaceHolderID="headerPlaceHolder" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>

