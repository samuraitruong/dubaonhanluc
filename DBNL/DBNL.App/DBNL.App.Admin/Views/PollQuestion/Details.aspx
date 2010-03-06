<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.PollQuestion>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Details</h2>

    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">Id</div>
        <div class="display-field"><%= Html.Encode(Model.Id) %></div>
        
        <div class="display-label">Question</div>
        <div class="display-field"><%= Html.Encode(Model.Question) %></div>
        
        <div class="display-label">PollId</div>
        <div class="display-field"><%= Html.Encode(Model.PollId) %></div>
        
        <div class="display-label">Status</div>
        <div class="display-field"><%= Html.Encode(Model.Status) %></div>
        
        <div class="display-label">CreatedDate</div>
        <div class="display-field"><%= Html.Encode(String.Format("{0:g}", Model.CreatedDate)) %></div>
        
        <div class="display-label">UpdatedDate</div>
        <div class="display-field"><%= Html.Encode(String.Format("{0:g}", Model.UpdatedDate)) %></div>
        
        <div class="display-label">Responses</div>
        <div class="display-field"><%= Html.Encode(Model.Responses) %></div>
        
    </fieldset>
    <p>

        <%= Html.ActionLink("Edit", "Edit", new { id=Model.Id }) %> |
        <%= Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

