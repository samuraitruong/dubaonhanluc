<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Administration</h2>

    <ul>
        <li><% =Html.ActionLink("Role Managements", "Create","Roles", new { area = "DBNL.App.Admin" },null) %></li>
        <li><% =Html.ActionLink("Content Categories Managements", "Create", "Categories", new { area = "DBNL.App.Admin" }, null)%></li>
        <li><% =Html.ActionLink("Navigation", "Create", "Navigation", new { area = "DBNL.App.Admin" }, null)%></li>
    </ul>
</asp:Content>
