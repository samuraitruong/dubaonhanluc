<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.PollQuestion>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	AddPollQuestion
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Add PollQuestion</h2>

    <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Id) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Id) %>
                <%= Html.ValidationMessageFor(model => model.Id) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Question) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Question) %>
                <%= Html.ValidationMessageFor(model => model.Question) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.PollId) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.PollId) %>
                <%= Html.ValidationMessageFor(model => model.PollId) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Status) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Status) %>
                <%= Html.ValidationMessageFor(model => model.Status) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.CreatedDate) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.CreatedDate) %>
                <%= Html.ValidationMessageFor(model => model.CreatedDate) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.UpdatedDate) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.UpdatedDate) %>
                <%= Html.ValidationMessageFor(model => model.UpdatedDate) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Responses) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Responses) %>
                <%= Html.ValidationMessageFor(model => model.Responses) %>
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

