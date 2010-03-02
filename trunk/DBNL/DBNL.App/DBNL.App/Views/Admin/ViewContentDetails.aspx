﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.Content>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ViewContentDetails
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Content Details</h2>

    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">ContentId</div>
        <div class="display-field"><%= Html.Encode(Model.ContentId) %></div>
        
        <div class="display-label">Title</div>
        <div class="display-field"><%= Html.Encode(Model.Title) %></div>
        
        <div class="display-label">Content1</div>
        <div class="display-field"><%= Html.Encode(Model.Content1) %></div>
        
        <div class="display-label">CategoryId</div>
        <div class="display-field"><%= Html.Encode(Model.CategoryId) %></div>
        
        <div class="display-label">CreatedDate</div>
        <div class="display-field"><%= Html.Encode(String.Format("{0:g}", Model.CreatedDate)) %></div>
        
        <div class="display-label">UpdatedDate</div>
        <div class="display-field"><%= Html.Encode(String.Format("{0:g}", Model.UpdatedDate)) %></div>
        
        <div class="display-label">IsFeatured</div>
        <div class="display-field"><%= Html.Encode(Model.IsFeatured) %></div>
        
        <div class="display-label">Status</div>
        <div class="display-field"><%= Html.Encode(Model.Status) %></div>
        
        <div class="display-label">Count</div>
        <div class="display-field"><%= Html.Encode(Model.Count) %></div>
        
    </fieldset>
    <p>

        <%= Html.ActionLink("Edit", "EditContent", new { id=Model.ContentId }) %> |
        <%= Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

