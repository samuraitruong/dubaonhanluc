<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.Poll>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Create</h2>

    <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.PollName) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.PollName) %>
                <%= Html.ValidationMessageFor(model => model.PollName) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Status) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Status) %>
                <%= Html.ValidationMessageFor(model => model.Status) %>
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

