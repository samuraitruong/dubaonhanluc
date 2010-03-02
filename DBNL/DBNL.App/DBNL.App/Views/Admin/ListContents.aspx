<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DBNL.App.Models.Content>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ListContents
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Contents List</h2>

    <table>
        <tr>
            <th></th>
            <th>
                ContentId
            </th>
            <th>
                Title
            </th>
            <th>
                Content1
            </th>
            <th>
                CategoryId
            </th>
            <th>
                CreatedDate
            </th>
            <th>
                UpdatedDate
            </th>
            <th>
                IsFeatured
            </th>
            <th>
                Status
            </th>
            <th>
                Count
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%= Html.ActionLink("Edit", "EditContent", new { id=item.ContentId }) %> |
                <%= Html.ActionLink("Details", "ViewContentDetails", new { id=item.ContentId })%> |
                <%= Html.ActionLink("Delete", "DeleteContent", new { id=item.ContentId })%>
            </td>
            <td>
                <%= Html.Encode(item.ContentId) %>
            </td>
            <td>
                <%= Html.Encode(item.Title) %>
            </td>
            <td>
                <%= Html.Encode(item.Content1) %>
            </td>
            <td>
                <%= Html.Encode(item.CategoryId) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:g}", item.CreatedDate)) %>
            </td>
            <td>
                <%= Html.Encode(String.Format("{0:g}", item.UpdatedDate)) %>
            </td>
            <td>
                <%= Html.Encode(item.IsFeatured) %>
            </td>
            <td>
                <%= Html.Encode(item.Status) %>
            </td>
            <td>
                <%= Html.Encode(item.Count) %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%= Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

