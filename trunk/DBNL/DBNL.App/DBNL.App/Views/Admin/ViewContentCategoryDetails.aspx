<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.ContentCategory>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ViewContentCategoryDetails
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>ContentCategory Details</h2>

    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">ID</div>
        <div class="display-field"><%= Html.Encode(Model.ID) %></div>
        
        <div class="display-label">CategoryName</div>
        <div class="display-field"><%= Html.Encode(Model.CategoryName) %></div>
        
        <div class="display-label">Key</div>
        <div class="display-field"><%= Html.Encode(Model.Key) %></div>
        
        <div class="display-label">ParentCategoryId</div>
        <div class="display-field"><%= Html.Encode(Model.ParentCategoryId) %></div>
        
    </fieldset>
    <p>

        <%= Html.ActionLink("Edit", "EditContentCategory", new { id=Model.ID }) %> |
        <%= Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

