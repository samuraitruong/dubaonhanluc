<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.Link>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	AddLink
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>AddLink</h2>

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
                <%= Html.LabelFor(model => model.Title) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Title) %>
                <%= Html.ValidationMessageFor(model => model.Title) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Url) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Url) %>
                <%= Html.ValidationMessageFor(model => model.Url) %>
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
            
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%= Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

