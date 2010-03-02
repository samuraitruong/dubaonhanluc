<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.UserInRole>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	AddUserInRole
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Add UserInRole</h2>

    <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.RoleId) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.RoleId) %>
                <%= Html.ValidationMessageFor(model => model.RoleId) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.UserId) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.UserId) %>
                <%= Html.ValidationMessageFor(model => model.UserId) %>
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

