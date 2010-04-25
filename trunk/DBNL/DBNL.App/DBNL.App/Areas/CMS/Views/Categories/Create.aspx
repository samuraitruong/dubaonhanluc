<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<ContentCategory>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Create</h2>

    <%= Html.ValidationSummary("Create was unsuccessful. Please correct the errors and try again.") %>
    <%=Html.ValidationMessage("Exception") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.CategoryName) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.CategoryName) %>
                <%= Html.ValidationMessageFor(model => model.CategoryName) %>
            </div>
          
           <div class="editor-label">
                <%= Html.LabelFor(model => model.ParentCategoryId) %>
            </div>
             <div class="editor-field">
                <%= Html.DropDownList("ParentCategoryId",(IEnumerable<SelectListItem>) ViewData["Categories"])%>
                <%= Html.ValidationMessage("ParentCategoryId", "*") %>
            </div>
            <div class="editor-label">
                <%= Html.LabelFor(model => model.IsFeatured) %>
            </div>
            <div class="editor-field">
                <%= Html.CheckBoxFor(model => model.IsFeatured) %>
                <%= Html.ValidationMessageFor(model => model.IsFeatured) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.ShowOnHP) %>
            </div>
            <div class="editor-field">
                <%= Html.CheckBoxFor(model => model.ShowOnHP)%>
                <%= Html.ValidationMessageFor(model => model.ShowOnHP) %>
            </div>

            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

