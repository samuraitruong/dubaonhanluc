﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.Banner>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Thêm mới banner
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Thêm mới banner</h2>
    <% var Data = (BannerViewData)ViewData["Extra"]; %>
    <% using (Html.BeginForm("Create", "Banner", FormMethod.Post, new {enctype="multipart/form-data"})) {%>
        <%= Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Fields</legend>
            <%= Html.ValidationSummary("Create was unsuccessful. Please correct the errors and try again.") %>
            <div class="editor-label">
                <%= Html.LabelFor(p=>p.Name) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(p=>p.Name) %>
                <%= Html.ValidationMessageFor(p=>p.Name) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(p=>p.Url) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(p=>p.Url) %>
                <%= Html.ValidationMessageFor(p=>p.Url) %>
            </div>
            
            <div>
                <label>Banner Image:</label>
                <input type="file" name="banimg" />
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(p=>p.BannerPosition) %>
            </div>
            <div class="editor-field">
                <%=Html.DropDownList("BannerPosition", Data.BannerPositions)%>
                <%=Html.ValidationMessageFor(p=>p.BannerPosition) %>
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

