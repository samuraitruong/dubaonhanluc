<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DBNL.App.Models.ContentRelation>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ListContentRelations
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>ContentRelations List</h2>

    <table>
        <tr>
            <th></th>
            <th>
                ContentId
            </th>
            <th>
                RelatedId
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%= Html.ActionLink("Delete", "DeleteContentRelation", new { id=item.ContentId })%>
            </td>
            <td>
                <%= Html.Encode(item.ContentId) %>
            </td>
            <td>
                <%= Html.Encode(item.RelatedId) %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%= Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

