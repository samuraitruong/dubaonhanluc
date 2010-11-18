<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DBNL.App.Models.Navigation>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Tạo Danh mục (Menu)
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Tạo Danh mục (Menu) mới :</h2>
    <% var data = (DBNL.App.Models.ViewData.NavigationDataView)ViewData["ExtraData"]; %>

    <%= Html.ValidationSummary("Create was unsuccessful. Please correct the errors and try again.") %>

    <% using (Html.BeginForm()) {%>
    <%= Html.ValidationSummary(true) %>
        <fieldset>
            <legend>&nbsp;</legend>
            
            <p>
                <label for="Name">Tên:</label>
                <%= Html.TextBox("Name") %>
                <%=Html.ValidationMessageFor(p=>p.Name) %>
            </p>
            <p>
                <label for="ParentId">Chọn danh mục cha:</label>
                <%= Html.DropDownList("ParentId", data.RootNavigations)%>
                <%= Html.ValidationMessage("ParentId", "*")%>
            </p>
            <p>
                <label for="Possition">Vị trí:</label>
                <%= Html.DropDownList("Position", data.NavigationPositions)%>
                <%= Html.ValidationMessage("Position", "*")%>
                <%= Html.ValidationMessageFor(p=>p.Position)%>

            </p>
             <p>
                <label for="Component">Component:</label>
                <%=Html.DropDownList("Component", data.SiteModules)%>
                <%= Html.ValidationMessage("Component", "*")%>
            </p>
            
            <p id="extCategory">
                <label for="ContentId">Chọn nhóm nội dung:</label>
                <%=Html.DropDownList("CategoryId", data.Categories)%>
                <%= Html.ValidationMessage("CategoryId", "*")%>
            </p>
            
            <p id="extLink">
                <label for="ExternalUrl">Liên kết bên ngoài:</label>
                <%=Html.TextBox("ExternalUrl")%>
                
            </p>
            <p id="articleLink">
                <label for="ExternalUrl">Chọn bài viết:</label>
                 <%=Html.DropDownList("ContentId", data.OrphanArticles)%>
                
            </p>
            
             

            <p>
                <input type="submit" value="Thêm mới" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>
<asp:Content ID="scrit"  ContentPlaceHolderID="ScriptContent" runat="server">
    <script language="javascript" type="text/javascript">
        $("#extCategory").hide();
        $("#extLink").hide();
        $("#articleLink").hide();


        $(document).ready(function () {
            $("#Component").bind("change", function () {
                if ($(this).val() == 'Article') {
                    $("#extCategory").show();
                }
                else if ($(this).val() == 'Url') {
                    $("#extLink").show();
                }
                else if ($(this).val() == 'Post') {
                    $("#articleLink").show();
                }
                else {
                    $("#extCategory").hide();
                    $("#extLink").hide();
                    $("#articleLink").hide();
                }
            });
        });
    </script>
</asp:Content>

