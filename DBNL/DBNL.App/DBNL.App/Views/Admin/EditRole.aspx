<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.Role>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	EditRole
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit Role</h2>

    <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Id) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Id) %>
                <%= Html.ValidationMessageFor(model => model.Id) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.RoleName) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.RoleName) %>
                <%= Html.ValidationMessageFor(model => model.RoleName) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.ContentPermission) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.ContentPermission) %>
                <%= Html.ValidationMessageFor(model => model.ContentPermission) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.ComponentPermission) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.ComponentPermission) %>
                <%= Html.ValidationMessageFor(model => model.ComponentPermission) %>
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

