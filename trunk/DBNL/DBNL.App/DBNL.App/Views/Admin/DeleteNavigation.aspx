<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.Navigation>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	DeleteNavigation
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Delete Navigation</h2>

    <h3>Are you sure you want to delete this?</h3>
    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">Id</div>
        <div class="display-field"><%= Html.Encode(Model.Id) %></div>
        
        <div class="display-label">Name</div>
        <div class="display-field"><%= Html.Encode(Model.Name) %></div>
        
        <div class="display-label">ParentId</div>
        <div class="display-field"><%= Html.Encode(Model.ParentId) %></div>
        
        <div class="display-label">Possition</div>
        <div class="display-field"><%= Html.Encode(Model.Possition) %></div>
        
        <div class="display-label">Status</div>
        <div class="display-field"><%= Html.Encode(Model.Status) %></div>
        
        <div class="display-label">RelativeUrl</div>
        <div class="display-field"><%= Html.Encode(Model.RelativeUrl) %></div>
        
        <div class="display-label">DisplayOrder</div>
        <div class="display-field"><%= Html.Encode(Model.DisplayOrder) %></div>
        
        <div class="display-label">Image</div>
        <div class="display-field"><%= Html.Encode(Model.Image) %></div>
        
        <div class="display-label">ContentId</div>
        <div class="display-field"><%= Html.Encode(Model.ContentId) %></div>
        
        <div class="display-label">Component</div>
        <div class="display-field"><%= Html.Encode(Model.Component) %></div>
        
        <div class="display-label">ExternalUrl</div>
        <div class="display-field"><%= Html.Encode(Model.ExternalUrl) %></div>
        
    </fieldset>
    <% using (Html.BeginForm()) { %>
        <p>
		    <input type="submit" value="Delete" /> |
		    <%= Html.ActionLink("Back to List", "Index") %>
        </p>
    <% } %>

</asp:Content>

