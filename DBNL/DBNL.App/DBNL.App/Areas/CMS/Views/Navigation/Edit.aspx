<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.Navigation>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Sửa Menu
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Cập nhật thông tin cho Menu :<%-- <% =Html.Encode(Model.Name) %>--%></h2>

    <% using (Html.BeginForm()) {%>
         <% var data = (DBNL.App.Models.ViewData.NavigationDataView)ViewData["ExtraData"]; %>

         <%= Html.ValidationSummary("Create was unsuccessful. Please correct the errors and try again.") %>  
        
        <fieldset>
            <legend>Fields</legend>
           <div class="editor-field">
                <%= Html.HiddenFor(model => model.Id) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Name) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Name) %>
                <%= Html.ValidationMessageFor(model => model.Name) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.ParentId) %>
            </div>
            <div class="editor-field">
                 <%= Html.DropDownList("ParentId", data.RootNavigations, new { Width= 150 })%>
                <%= Html.ValidationMessageFor(model => model.ParentId) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Position) %>
            </div>
            <div class="editor-field">
                 <%= Html.DropDownList("Position", data.NavigationPositions)%>
                <%= Html.ValidationMessageFor(model => model.Position) %>
            </div>
            <div class="editor-field">
                <%= Html.HiddenFor(model => model.Status) %>
            </div>
            
             <div class="editor-label">
                <label for="Component">Component:</label>
            </div>
            <div class="editor-field">
                 <%=Html.DropDownList("Component", data.SiteModules)%>
                <%= Html.ValidationMessage("Component", "*")%>
            </div>
            <div class="editor-label ContentId">
                <%= Html.LabelFor(model => model.ContentId) %>
            </div>
            <div class="editor-field ContentId">
                <%= Html.DropDownList("ContentId", data.Categories, new { width = 150 })%>
                <%= Html.ValidationMessageFor(model => model.ContentId) %>
            </div>

            <div class="editor-label ExternalUrl">
                <%= Html.LabelFor(model => model.ExternalUrl) %>
            </div>
            <div class="editor-field ExternalUrl">
                <%= Html.TextBoxFor(model => model.ExternalUrl) %>
                <%= Html.ValidationMessageFor(model => model.ExternalUrl) %>
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

<script language="javascript" type="text/javascript">

    function ShowHide(val) {
        $(".ContentId").hide();
        $(".ExternalUrl").hide();
        if (val == 'Article') {
            $(".ContentId").show();
        }
        else if (val == 'Url') {
            $(".ExternalUrl").show();
        }
        else {
            $(".ContentId").hide();
            $(".ExternalUrl").hide();
        }
    }
    $(document).ready(function () {
        ShowHide($("#Component").val());

        $("#Component").bind("change", function () {
            
            ShowHide($(this).val());
        });

    });
    </script>

</asp:Content>

