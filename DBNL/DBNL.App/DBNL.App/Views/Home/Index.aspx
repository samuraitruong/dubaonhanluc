<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/FO.Master" Inherits="System.Web.Mvc.ViewPage<HomePageViewData>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <% Html.RenderPartial("FeatureCategoryView", Model.FeaturedCategory);%>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="UnderMenuContent" runat="server">
    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MidlePageMainContent" runat="server">
<% Html.RenderPartial("CategoriesOnHPView", Model.CategoriesOnHP);%>

</asp:Content>
<asp:Content ContentPlaceHolderID="LeftBottomNavigationContent" runat="server">
<% Html.RenderPartial("PublicPollControl", Model.PublicPoll); %>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BottomMainContent" runat="server">
<% Html.RenderPartial("NewestJobControl"); %>
</asp:Content>

