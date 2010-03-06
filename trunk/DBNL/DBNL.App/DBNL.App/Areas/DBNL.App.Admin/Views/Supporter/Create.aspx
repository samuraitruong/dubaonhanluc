<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.Supporter>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	AddSupporter
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>AddSupporter</h2>

    <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Fields</legend>

            <div class="editor-label">
                <%= Html.LabelFor(model => model.Name) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Name) %>
                <%= Html.ValidationMessageFor(model => model.Name) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Type) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Type) %>
                <%= Html.ValidationMessageFor(model => model.Type) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Nickname) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Nickname) %>
                <%= Html.ValidationMessageFor(model => model.Nickname) %>
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

