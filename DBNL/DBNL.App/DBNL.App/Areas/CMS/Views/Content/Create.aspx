<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.Content>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="headerPlaceHolder" >
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            CKEDITOR.replace('Content');
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Create</h2>

    <%= Html.ValidationSummary("Create was unsuccessful. Please correct the errors and try again.") %>

    <% using (Html.BeginForm("Create", "Content", FormMethod.Post, new {enctype="multipart/form-data"})) {%>

        <fieldset>
            <legend>Fields</legend>
            <p>
                <label for="Title">Title:</label>
                <%= Html.TextBox("Title") %>
                <%= Html.ValidationMessage("Title", "*") %>
            </p>
            
            <p>
                <label for="Description">Mô tả:</label>
                <%= Html.TextArea("Description","", 3, 40, null) %>
                <%= Html.ValidationMessage("Description", "*")%>
            </p>
            <p>
                <label for="Content1">Content1:</label>
                <%= Html.TextArea("Content","", 10, 40, null) %>
                <%= Html.ValidationMessage("Content", "*") %>
            </p>
            <p>
                <label for="CategoryId">CategoryId:</label>
                 <%= Html.DropDownList("CategoryId", (IEnumerable<SelectListItem>)ViewData["Categories"])%>
                <%= Html.ValidationMessage("CategoryId", "*") %>
            </p>
            
            <p>
                <label for="IsFeatured">IsFeatured:</label>
                 <%= Html.CheckBox("IsFeatured")%>
            </p>
            <p>
                <label>Hình minh họa</label>
                <input type="file" id="Picture" name="Picture" />
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

