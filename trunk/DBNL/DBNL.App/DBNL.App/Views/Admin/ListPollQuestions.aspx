<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DBNL.App.Models.PollQuestion>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ListPollQuestions
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>List PollQuestions</h2>

    <table>
        <tr>
            <th></th>
            <th>
                Id
            </th>
            <th>
                Question
            </th>
            <th>
                PollId
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
            <th>
                Responses
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%= Html.ActionLink("Edit", "EditPollQuestion", new { id=item.Id }) %> |
                <%= Html.ActionLink("Details", "ViewPollQuestionDetails", new { id=item.Id })%> |
                <%= Html.ActionLink("Delete", "DeletePollQuestion", new { id=item.Id })%>
            </td>
            <td>
                <%= Html.Encode(item.Id) %>
            </td>
            <td>
                <%= Html.Encode(item.Question) %>
            </td>
            <td>
                <%= Html.Encode(item.PollId) %>
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
            <td>
                <%= Html.Encode(item.Responses) %>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%= Html.ActionLink("Create New", "Create") %>
    </p>

</asp:Content>

