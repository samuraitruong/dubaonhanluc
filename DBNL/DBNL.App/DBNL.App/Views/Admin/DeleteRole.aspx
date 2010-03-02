<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.Role>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	DeleteRole
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Delete Role</h2>

    <h3>Are you sure you want to delete this?</h3>
    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">Id</div>
        <div class="display-field"><%= Html.Encode(Model.Id) %></div>
        
        <div class="display-label">RoleName</div>
        <div class="display-field"><%= Html.Encode(Model.RoleName) %></div>
        
        <div class="display-label">ContentPermission</div>
        <div class="display-field"><%= Html.Encode(Model.ContentPermission) %></div>
        
        <div class="display-label">ComponentPermission</div>
        <div class="display-field"><%= Html.Encode(Model.ComponentPermission) %></div>
        
    </fieldset>
    <% using (Html.BeginForm()) { %>
        <p>
		    <input type="submit" value="Delete" /> |
		    <%= Html.ActionLink("Back to List", "Index") %>
        </p>
    <% } %>

</asp:Content>

