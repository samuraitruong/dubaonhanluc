<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DBNL.App.Models.Navigation>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ListNavigations
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Navigations List</h2>

    <table>
        <tr>
            <th></th>
            <th>
                Id
            </th>
            <th>
                Name
            </th>
            <th>
                ParentId
            </th>
            <th>
                Possition
            </th>
            <th>
                Status
            </th>
            <th>
                RelativeUrl
            </th>
            <th>
                DisplayOrder
            </th>
            <th>
                Image
            </th>
            <th>
                ContentId
            </th>
            <th>
                Component
            </th>
            <th>
                ExternalUrl
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%= Html.ActionLink("Edit", "EditNavigation", new { id=item.Id }) %> |
                <%= Html.ActionLink("Details", "ViewNavigationDetails", new { id=item.Id })%> |
                <%= Html.ActionLink("Delete", "DeleteNavigation", new { id=item.Id })%>
            </td>
            <td>
                <%= Html.Encode(item.Id) %>
            </td>
            <td>
                <%= Html.Encode(item.Name) %>
            </td>
            <td>
                <%= Html.Encode(item.ParentId) %>
            </td>
            <td>
                <%= Html.Encode(item.Possition) %>
            </td>
            <td>
                <%= Html.Encode(item.Status) %>
            </td>
            <td>
                <%= Html.Encode(item.RelativeUrl) %>
            </td>
            <td>
                <%= Html.Encode(item.DisplayOrder) %>
            </td>
            <td>
                <%= Html.Encode(item.Image) %>
            </td>
            <td>
                <%= Html.Encode(item.ContentId) %>
            </td>
            <td>
                <%= Html.Encode(item.Component) %>
            </td>
            <td>
                <%= Html.Encode(item.ExternalUrl) %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%= Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

