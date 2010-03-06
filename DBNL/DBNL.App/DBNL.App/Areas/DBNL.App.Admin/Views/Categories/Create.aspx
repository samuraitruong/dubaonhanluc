<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<ContentCategory>" %>

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
                <label for="CategoryName">CategoryName:</label>
                <%= Html.TextBox("CategoryName") %>
                <%= Html.ValidationMessage("CategoryName", "*") %>
            </p>
            <p>
                <label for="ParentCategoryId">ParentCategoryId:</label>
                <%= Html.DropDownList("ParentCategoryId", (SelectList) ViewData["Categories"])%>
                <%= Html.ValidationMessage("ParentCategoryId", "*") %>
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

