<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DBNL.App.Models.ContentCategory>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ListContentCategories
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>List ContentCategories</h2>

    <table>
        <tr>
            <th></th>
            <th>
                ID
            </th>
            <th>
                CategoryName
            </th>
            <th>
                Key
            </th>
            <th>
                ParentCategoryId
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%= Html.ActionLink("Edit", "EditContentCategory", new { id=item.ID }) %> |
                <%= Html.ActionLink("Details", "ViewContentCategoryDetails", new { id=item.ID })%> |
                <%= Html.ActionLink("Delete", "DeleteContentCategory", new { id=item.ID })%>
            </td>
            <td>
                <%= Html.Encode(item.ID) %>
            </td>
            <td>
                <%= Html.Encode(item.CategoryName) %>
            </td>
            <td>
                <%= Html.Encode(item.Key) %>
            </td>
            <td>
                <%= Html.Encode(item.ParentCategoryId) %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%= Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

