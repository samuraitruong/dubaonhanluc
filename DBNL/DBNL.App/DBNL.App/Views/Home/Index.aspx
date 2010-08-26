<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/FO.Master" Inherits="System.Web.Mvc.ViewPage<HomePageViewData>" %>
<%@ Import Namespace="DBNL.App.Models.ViewData" %>

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
<% Html.RenderPartial("TopRecruiters"); %>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="BottomMainContent" runat="server">
<div id="main" class="clearfix">
    <div id="logo">
         <% var Data = ((FOMasterViewData)ViewData["FOMasterViewData"]);%>
        <%= Html.BannerList(Data.TopBanners)%>
     </div>
		    <!--logo-->
    <% Html.RenderPartial("NewestJobControl", Model.JobsList); %>

    <div class="banner">
        <%= Html.BannerList(Data.RightBanners, 204)%>
    </div>
    </div>
</asp:Content>

