﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.Banner>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ViewBannerDetails
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Banner Details</h2>

    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">Id</div>
        <div class="display-field"><%= Html.Encode(Model.Id) %></div>
        
        <div class="display-label">Name</div>
        <div class="display-field"><%= Html.Encode(Model.Name) %></div>
        
        <div class="display-label">Url</div>
        <div class="display-field"><%= Html.Encode(Model.Url) %></div>
        
        <div class="display-label">BannerImage</div>
        <div class="display-field"><%= Html.Encode(Model.BannerImage) %></div>
        
        <div class="display-label">Status</div>
        <div class="display-field"><%= Html.Encode(Model.Status) %></div>
        
        <div class="display-label">CreatedDate</div>
        <div class="display-field"><%= Html.Encode(String.Format("{0:g}", Model.CreatedDate)) %></div>
        
        <div class="display-label">UpdatedDate</div>
        <div class="display-field"><%= Html.Encode(String.Format("{0:g}", Model.UpdatedDate)) %></div>
        
        <div class="display-label">BannerPosition</div>
        <div class="display-field"><%= Html.Encode(Model.BannerPosition) %></div>
        
    </fieldset>
    <p>

        <%= Html.ActionLink("Edit", "EditBanner", new { id=Model.Id }) %> |
        <%= Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>
