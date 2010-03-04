<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.Role>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Create</h2>

    <%= Html.ValidationSummary("Create was unsuccessful. Please correct the errors and try again.") %>
     <% Html.EnableClientValidation(); %>


    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend>Fields</legend>
            <p>
                <label for="RoleName">RoleName:</label>
                <%= Html.TextBox("RoleName") %>
                <%= Html.ValidationMessage("RoleName", "*") %>
            </p>
            <%--<p>
                <label for="ContentPermission">ContentPermission:</label>
                <%= Html.TextBox("ContentPermission") %>
                <%= Html.ValidationMessage("ContentPermission", "*") %>
            </p>
            <p>
                <label for="ComponentPermission">ComponentPermission:</label>
                <%= Html.TextBox("ComponentPermission") %>
                <%= Html.ValidationMessage("ComponentPermission", "*") %>
            </p>--%>
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

