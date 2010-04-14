<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.ViewData.BannerViewData>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Create</h2>
    
    <% using (Html.BeginForm("Create", "Banner", FormMethod.Post, new {enctype="multipart/form-data"})) {%>
        <%= Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Fields</legend>

            <div class="editor-label">
                <%= Html.LabelFor(model => model.banner.Name) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.banner.Name) %>
                <%= Html.ValidationMessageFor(model => model.banner.Name) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.banner.Url) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.banner.Url) %>
                <%= Html.ValidationMessageFor(model => model.banner.Url) %>
            </div>
            
            <div>
                <label>Banner Image:</label>
                <input type="file" name="banimg" />
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.banner.BannerPosition) %>
            </div>
            <div class="editor-field">
                <%=Html.DropDownList("BannerPosition", Model.BannerPositions) %>
                <%=Html.ValidationMessageFor(model => model.banner.BannerPosition) %>
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

