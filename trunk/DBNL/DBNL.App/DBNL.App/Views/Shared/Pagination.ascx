<%@ Control Language="C#" AutoEventWireup="true"  Inherits="DBNL.App.Models.Entities.Pagination" %>  
<% if(Model.TotalPages >1) { %>
  <ul class="pagination-flickr">  
      <% if (Model.HasPreviousPage)  
          { %>  
            <li class="previous"><a href="<%=Model.PageActionLink.Replace("%7Bpage%7D", (Model.PageIndex - 1).ToString())%>">« Trang trước</a></li>  
       <% }  
         else  
          { %>  
            <li class="previous-off">« Trang trước</li>  
       <% } %>  
        <% 
            var leftoffset = Math.Max(1, Model.PageIndex - Model.DisplayItems / 2);
            // Math.Max(1, Model.TotalPages - Model.DisplayItems); 
            var rightoffset = Math.Min(leftoffset + Model.DisplayItems-1, Model.TotalPages);

            while ((rightoffset - leftoffset) < Model.DisplayItems-1 && Model.DisplayItems < Model.TotalPages)
            {
                leftoffset = Math.Max(1, leftoffset - 1);
                if ((rightoffset - leftoffset) < Model.DisplayItems-1)
                {
                    rightoffset = Math.Min(rightoffset + 1, Model.TotalPages);
                }
            }
            %>
       <%for (int page = leftoffset; page <= rightoffset; page++)  
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
                <li class="next"><a href="<%=Model.PageActionLink.Replace("%7Bpage%7D", (Model.PageIndex + 1).ToString())%>">Trang kế »</a></li>  
           <% }  
         else  
              { %>  
                 <li class="next-off">Trang kế »</li>  
           <% } %>  
  </ul>   
  <%} %>

  <%--<div class="pager">
		
		
			<a href="#" class="pre"><span class="bullet"><span></span></span>Prev</a>
			<a href="#" class="next"><span class="bullet"><span></span></span>Next</a>
		
		
		
		
			<ul class="pagedots">
			
				<!-- ONE OF THE REPEATING ITEM IN THE PAGER -->

				<li class="dot">
					<a href="#">
						<span class="bullet">&bull;</span>
						<span class="tipbullet"><span></span></span>
						<span class="tiplabel">First Page's Title Comes Here</span>
					</a>
				</li>
			
			
				<!-- ONE OF THE REPEATING ITEM IN THE PAGER -->

				<li class="dot">
					<a href="#">
						<span class="bullet">&bull;</span>
						<span class="tipbullet"><span></span></span>
						<span class="tiplabel">Second Page's Title Comes Here</span>
					</a>
				</li>
				
				
				
				<!-- ACTIVE ITEM IN THE PAGER -->

				<!-- 
					class of <li> tag is ActiveDot
				 -->
				<li class="activedot">
					<a href="#">
						<span class="bullet">&bull;</span>
						<span class="tipbullet"><span></span></span>
						<span class="tiplabel">3</span>
					</a>
				</li>

				
				
				
				<!-- ONE OF THE REPEATING ITEM IN THE PAGER -->
				<li class="dot">
					<a href="#">
						<span class="bullet">&bull;</span>
						<span class="tipbullet"><span></span></span>
						<span class="tiplabel">Fourth Page's Title Comes Here</span>
					</a>
				</li>

				
				
				
				<!-- ONE OF THE REPEATING ITEM IN THE PAGER -->
				<li class="dot">
					<a href="#">
						<span class="bullet">&bull;</span>
						<span class="tipbullet"><span></span></span>
						<span class="tiplabel">Fifth Page's Title Comes Here</span>
					</a>
				</li>

				
				
				
				<!-- ONE OF THE REPEATING ITEM IN THE PAGER -->
				<li class="dot">
					<a href="#">
						<span class="bullet">&bull;</span>
						<span class="tipbullet"><span></span></span>
						<span class="tiplabel">Sixth Page's Title Comes Here</span>
					</a>
				</li>

				
				
				
			</ul>		</div>
--%>
