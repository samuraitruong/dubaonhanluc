﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DBNL.App.Models.Poll>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ListPolls
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Polls List</h2>

    <table>
        <tr>
            <th></th>
            <th>
                Id
            </th>
            <th>
                PollName
            </th>
            <th>
                Status
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%= Html.ActionLink("Edit", "EditPoll", new { id=item.Id }) %> |
                <%= Html.ActionLink("Details", "ViewPollDetails", new { id=item.Id })%> |
                <%= Html.ActionLink("Delete", "DeletePoll", new { id=item.Id })%>
            </td>
            <td>
                <%= Html.Encode(item.Id) %>
            </td>
            <td>
                <%= Html.Encode(item.PollName) %>
            </td>
            <td>
                <%= Html.Encode(item.Status) %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%= Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>
