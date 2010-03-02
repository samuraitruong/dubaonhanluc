<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DBNL.App.Models.Role>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ListRoles
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>List Roles</h2>

    <table>
        <tr>
            <th></th>
            <th>
                Id
            </th>
            <th>
                RoleName
            </th>
            <th>
                ContentPermission
            </th>
            <th>
                ComponentPermission
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%= Html.ActionLink("Edit", "EditRole", new { id=item.Id }) %> |
                <%= Html.ActionLink("Details", "ViewRoleDetails", new { id=item.Id })%> |
                <%= Html.ActionLink("Delete", "DeleteRole", new { id=item.Id })%>
            </td>
            <td>
                <%= Html.Encode(item.Id) %>
            </td>
            <td>
                <%= Html.Encode(item.RoleName) %>
            </td>
            <td>
                <%= Html.Encode(item.ContentPermission) %>
            </td>
            <td>
                <%= Html.Encode(item.ComponentPermission) %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%= Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

