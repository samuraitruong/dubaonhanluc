<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DBNL.App.Models.User>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ListUsers
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Users List</h2>

    <table>
        <tr>
            <th></th>
            <th>
                Id
            </th>
            <th>
                username
            </th>
            <th>
                Name
            </th>
            <th>
                Password
            </th>
            <th>
                Status
            </th>
            <th>
                CreatedDate
            </th>
            <th>
                UpdatedDate
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%= Html.ActionLink("Edit", "EditUser", new { id=item.Id }) %> |
                <%= Html.ActionLink("Details", "ViewUserDetails", new { id=item.Id })%> |
                <%= Html.ActionLink("Delete", "DeleteUser", new { id=item.Id })%>
            </td>
            <td>
                <%= Html.Encode(item.Id) %>
            </td>
            <td>
                <%= Html.Encode(item.username) %>
            </td>
            <td>
                <%= Html.Encode(item.Name) %>
            </td>
            <td>
                <%= Html.Encode(item.Password) %>
            </td>
            <td>
                <%= Html.Encode(item.Status) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:g}", item.CreatedDate)) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:g}", item.UpdatedDate)) %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%= Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

