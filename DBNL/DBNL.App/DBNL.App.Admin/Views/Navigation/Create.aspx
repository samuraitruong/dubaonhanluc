<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.Navigation>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Create</h2>

    <%= Html.ValidationSummary("Create was unsuccessful. Please correct the errors and try again.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend>Fields</legend>
            
            <p>
                <label for="Name">Name:</label>
                <%= Html.TextBox("Name") %>
                <%= Html.ValidationMessage("Name", "*") %>
            </p>
            <p>
                <label for="ParentId">ParentId:</label>
                <%= Html.TextBox("ParentId") %>
                <%= Html.ValidationMessage("ParentId", "*") %>
            </p>
            <p>
                <label for="Possition">Possition:</label>
                <%= Html.DropDownList("Possition", DBNL.App.Models.Statics.CustomSelectList.CreateMenuPosition())%>
                <%= Html.ValidationMessage("Possition", "*") %>
            </p>
            <p>
                <label for="ContentId">ContentId:</label>
                <%=Html.DropDownList("ContentId", (SelectList)ViewData["Categories"])%>
                <%= Html.ValidationMessage("ContentId", "*") %>
            </p>
            <p>
                <label for="Component">Component:</label>
                <%= Html.TextBox("Component") %>
                <%= Html.ValidationMessage("Component", "*") %>
            </p>
            <p>
                <label for="ExternalUrl">ExternalUrl:</label>
                <%= Html.TextBox("ExternalUrl") %>
                <%= Html.ValidationMessage("ExternalUrl", "*") %>
            </p>
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

