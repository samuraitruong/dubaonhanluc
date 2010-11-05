<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.ViewData.BannerViewData>" %>
<%@ Import Namespace="DBNL.App.Config"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit</h2>

    <% using (Html.BeginForm("Edit", "Banner", FormMethod.Post, new {enctype="multipart/form-data"})) {%>
        <%= Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%= Html.Label("Name:") %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.banner.Name) %>
                <%= Html.ValidationMessageFor(model => model.banner.Name) %>
            </div>
            
            <div class="editor-label">
                <%= Html.Label("URL:") %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.banner.Url) %>
                <%= Html.ValidationMessageFor(model => model.banner.Url) %>
            </div>
            
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.banner.Width)%>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.banner.Width)%>
                
            </div>
            <div class="editor-label">
                <%= Html.LabelFor(model => model.banner.Height)%>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.banner.Height)%>
            </div>

            <div class="editor-label">
                <%= Html.Label("Banner Image:") %>
            </div>
            <div>
                <img id="ban_img" class="ban_pre_img" alt="<%= Model.banner.BannerImage %>" src="<%= DBNLConfigurationManager.FileResponsity.BannerRelativeUrl+"/" + Model.banner.BannerImage %>" />
            </div>
            
            <div class="editor-field">
                <input type="file" name="banimg" />
            </div>
            
            <div class="editor-label">
                <%= Html.Label("Status:") %>
            </div>
            <div class="editor-field">
                <%= Html.DropDownList("BannerStatus", Model.BannerStatus) %>
                <%= Html.ValidationMessageFor(model => model.banner.Status) %>
            </div>
            
            <div class="editor-label">
                <%= Html.Label("Banner Position:") %>
            </div>
            <div class="editor-field">
                <%= Html.DropDownList("BannerPosition", Model.BannerPositions) %>
                <%= Html.ValidationMessageFor(model => model.banner.BannerPosition) %>
            </div>
            
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%= Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

