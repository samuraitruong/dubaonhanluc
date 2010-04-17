
  <%@ Control Language="C#" AutoEventWireup="true"  Inherits="DBNL.App.Models.Entities.Pagination" %>  
  <ul class="pagination-flickr">  
      <% if (Model.HasPreviousPage)  
          { %>  
            <li class="previous"><a href="<%=Model.PageActionLink.Replace("%7Bpage%7D", (Model.PageIndex - 1).ToString())%>">« Previous</a></li>  
       <% }  
         else  
          { %>  
            <li class="previous-off">« Previous</li>  
       <% } %>  
    
       <%for (int page = 1; page <= Model.TotalPages; page++)  
          {
              if (page == Model.PageIndex)  
              { %>  
                <li class="active"><%=page.ToString()%></li>  
           <% }  
          else  
              { %>  
                <li><a href="<%=Model.PageActionLink.Replace("%7Bpage%7D", page.ToString())%>"><%=page.ToString()%></a></li>  
           <% }  
          }

               if (Model.HasNextPage)  
              { %>  
                <li class="next"><a href="<%=Model.PageActionLink.Replace("%7Bpage%7D", (Model.PageIndex + 1).ToString())%>">Next »</a></li>  
           <% }  
         else  
              { %>  
                 <li class="next-off">Next »</li>  
           <% } %>  
  </ul>   
