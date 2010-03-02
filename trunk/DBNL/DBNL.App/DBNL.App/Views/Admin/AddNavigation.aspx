<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.Navigation>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	AddNavigation
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Add Navigation</h2>

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
                <%= Html.LabelFor(model => model.Name) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Name) %>
                <%= Html.ValidationMessageFor(model => model.Name) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.ParentId) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.ParentId) %>
                <%= Html.ValidationMessageFor(model => model.ParentId) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Possition) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Possition) %>
                <%= Html.ValidationMessageFor(model => model.Possition) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Status) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Status) %>
                <%= Html.ValidationMessageFor(model => model.Status) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.RelativeUrl) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.RelativeUrl) %>
                <%= Html.ValidationMessageFor(model => model.RelativeUrl) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.DisplayOrder) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.DisplayOrder) %>
                <%= Html.ValidationMessageFor(model => model.DisplayOrder) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Image) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Image) %>
                <%= Html.ValidationMessageFor(model => model.Image) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.ContentId) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.ContentId) %>
                <%= Html.ValidationMessageFor(model => model.ContentId) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Component) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Component) %>
                <%= Html.ValidationMessageFor(model => model.Component) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.ExternalUrl) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.ExternalUrl) %>
                <%= Html.ValidationMessageFor(model => model.ExternalUrl) %>
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

