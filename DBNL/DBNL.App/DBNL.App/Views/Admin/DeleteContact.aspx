<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.Contact>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	DeleteContact
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Delete Contact</h2>

    <h3>Are you sure you want to delete this?</h3>
    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">Id</div>
        <div class="display-field"><%= Html.Encode(Model.Id) %></div>
        
        <div class="display-label">Name</div>
        <div class="display-field"><%= Html.Encode(Model.Name) %></div>
        
        <div class="display-label">Email</div>
        <div class="display-field"><%= Html.Encode(Model.Email) %></div>
        
        <div class="display-label">Status</div>
        <div class="display-field"><%= Html.Encode(Model.Status) %></div>
        
    </fieldset>
    <% using (Html.BeginForm()) { %>
        <p>
		    <input type="submit" value="Delete" /> |
		    <%= Html.ActionLink("Back to List", "Index") %>
        </p>
    <% } %>

</asp:Content>

