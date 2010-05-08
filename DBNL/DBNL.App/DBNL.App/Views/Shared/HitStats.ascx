<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>


<p>Tổng lượt truy cập: <%= ApplicationManager.Counter.Visits%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Số người online: <%= ApplicationManager.Counter.OnlineUsers%></p>
<!-- Histats.com  START  (standard)-->
<script type="text/javascript">    document.write(unescape("%3Cscript src=%27http://s10.histats.com/js15.js%27 type=%27text/javascript%27%3E%3C/script%3E"));</script>
<a href="http://www.histats.com" target="_blank" title="free web page counters" ><script  type="text/javascript" >
</script></a>
<noscript><a href="http://www.histats.com" target="_blank"><img  src="http://sstatic1.histats.com/0.gif?1094115&101" alt="free web page counters" border="0"></a></noscript>
<!-- Histats.com  END  -->
