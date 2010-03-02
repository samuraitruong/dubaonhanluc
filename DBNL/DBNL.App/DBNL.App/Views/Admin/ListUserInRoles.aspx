<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DBNL.App.Models.UserInRole>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ListUserInRoles
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>UserInRoles List</h2>

    <table>
        <tr>
            <th></th>
            <th>
                RoleId
            </th>
            <th>
                UserId
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%= Html.ActionLink("Delete", "DeleteUserInRole", new { id=item.RoleId })%>
            </td>
            <td>
                <%= Html.Encode(item.RoleId) %>
            </td>
            <td>
                <%= Html.Encode(item.UserId) %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%= Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

