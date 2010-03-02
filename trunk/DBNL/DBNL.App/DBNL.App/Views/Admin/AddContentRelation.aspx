<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.ContentRelation>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	AddContentRelation
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Add ContentRelation</h2>

    <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.ContentId) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.ContentId) %>
                <%= Html.ValidationMessageFor(model => model.ContentId) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.RelatedId) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.RelatedId) %>
                <%= Html.ValidationMessageFor(model => model.RelatedId) %>
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

