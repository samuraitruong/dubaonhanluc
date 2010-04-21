<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/FO.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.Job>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2>View</h2>

    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">Id</div>
        <div class="display-field"><%= Html.Encode(Model.Id) %></div>
        
        <div class="display-label">Title</div>
        <div class="display-field"><%= Html.Encode(Model.Title) %></div>
        
        <div class="display-label">Description</div>
        <div class="display-field"><%= Html.Encode(Model.Description) %></div>
        
        <div class="display-label">JobDetail</div>
        <div class="display-field"><%= Html.Encode(Model.JobDetail) %></div>
        
        <div class="display-label">Company</div>
        <div class="display-field"><%= Html.Encode(Model.Company) %></div>
        
        <div class="display-label">CompanyInfo</div>
        <div class="display-field"><%= Html.Encode(Model.CompanyInfo) %></div>
        
        <div class="display-label">CreatedDate</div>
        <div class="display-field"><%= Html.Encode(String.Format("{0:g}", Model.CreatedDate)) %></div>
        
        <div class="display-label">Deadline</div>
        <div class="display-field"><%= Html.Encode(String.Format("{0:g}", Model.Deadline)) %></div>
        
        <div class="display-label">UpdatedDate</div>
        <div class="display-field"><%= Html.Encode(String.Format("{0:g}", Model.UpdatedDate)) %></div>
        
        <div class="display-label">Status</div>
        <div class="display-field"><%= Html.Encode(Model.Status) %></div>
        
        <div class="display-label">Key</div>
        <div class="display-field"><%= Html.Encode(Model.Key) %></div>
        
    </fieldset>
    <p>

        <%= Html.ActionLink("Edit", "Edit", new { id=Model.Id }) %> |
        <%= Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="headerPlaceHolder" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="UnderMenuContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MidlePageMainContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LeftBottomNavigationContent" runat="server">
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="BottomMainContent" runat="server">
</asp:Content>

