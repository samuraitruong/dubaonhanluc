<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.ContentCategory>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit</h2>

    <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Fields</legend>
            
           
            <div class="editor-field">
                <%= Html.HiddenFor(model => model.ID) %>
                <%= Html.ValidationMessageFor(model => model.ID) %>
            </div>
            
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
                <%= Html.DropDownListFor(model => model.ParentCategoryId  ,(IEnumerable<SelectListItem>) ViewData["Categories"], "Chọn danh mục con") %>
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
                <%= Html.CheckBoxFor(model => model.ShowOnHP) %>
                <%= Html.ValidationMessageFor(model => model.ShowOnHP) %>
            </div>

            <div class="editor-label">
                <%= Html.LabelFor(model => model.Status) %>
            </div>
            <div class="editor-field">
            <%=Html.DropDownList("Status",(IEnumerable<SelectListItem>)ViewData["Status"])  %>
                 <%--<%= Html.DropDownListFor(model => model.Status, (IEnumerable<SelectListItem>)ViewData["Status"], "Chọn trạng thái")%>--%>
                <%= Html.ValidationMessageFor(model => model.Status) %>
            </div>
            
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%= Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="headerPlaceHolder" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>

