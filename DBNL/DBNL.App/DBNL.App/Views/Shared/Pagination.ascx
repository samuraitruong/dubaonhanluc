<%@ Control Language="C#" AutoEventWireup="true"  Inherits="DBNL.App.Models.Entities.Pagination" %>  
<% if(Model.TotalPages >1) { %>

<div class="pageitem fr">Trang: 
    
     <%
         if (Model.TotalPages <= Model.DisplayItems)
         {
             for (int page = 1; page <= Model.TotalPages; page++)
             {
                 if (page == Model.PageIndex)
                 { %>  
              <a class="active"><%=page.ToString()%></a> <%= page == Model.TotalPages ? "" : "|"%>
           <% }
                 else
                 { %>
                
                <a href="<%=Model.PageActionLink.Replace("%7Bpage%7D", page.ToString())%>"><%=page.ToString()%> <%= page == Model.TotalPages ? "" : "|"%></a>
           <% }
             }
         }
         else
         {
             
       %>
       <%
         var firstPation = Model.DisplayItems / 2;
         var secondPattion = Model.DisplayItems - firstPation;

         var loffset = Math.Max(1, Model.PageIndex - firstPation / 2);
         var roffset = Math.Min(Model.TotalPages, loffset + firstPation - 1);
         var endoffset = Math.Max(Model.TotalPages - secondPattion+1, roffset+1);

         if (roffset >= Model.TotalPages)
         {
             loffset = Math.Max(Model.TotalPages - Model.DisplayItems, 1);
         }
             
        %>
           <%if (loffset > 1)
             {%>
           <a class="static">...</a>
           <%} %>
           <%
               for (int page = loffset; page <= roffset; page++)
               {
                   if (page == Model.PageIndex)
                   { %>  
              <a class="active"><%=page.ToString()%></a> <%= page == roffset ? "" : "|"%>
           <% }
                   else
                   { %>
                
                <a href="<%=Model.PageActionLink.Replace("%7Bpage%7D", page.ToString())%>"><%=page.ToString()%> <%= page == roffset ? "" : "|"%></a>
           <% }
               }
             %>

             <% if(roffset <Model.TotalPages) { %>
                <a class="static">...</a>
             <%} %>
             <%

             for (int page = endoffset; page <= Model.TotalPages; page++)
               {
                   if (page == Model.PageIndex)
                   { %>  
                      <a class="active"><%=page.ToString()%></a> <%= page == Model.TotalPages ? "" : "|"%>
                   <% }
                       else
                   { %>
                
                <a href="<%=Model.PageActionLink.Replace("%7Bpage%7D", page.ToString())%>"><%=page.ToString()%> <%= page == Model.TotalPages ? "" : "|"%></a>
           <% }
               }
             %>

             
       <%} %>
 </div>

  <%} %>
   
