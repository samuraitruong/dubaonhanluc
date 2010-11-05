<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

 <script language="JavaScript" type="text/javascript">
<!--
     //Chống chọn văn bản
     window.onload = function () {
         document.onselectstart = function () { return false; } // ie
         document.onmousedown = function () { return false; } // mozilla
     }
     //Chống click chuột phải
     var message = "Sorry, that function is disabled.\nThis Page Copyrighted and\nImages and Text protected!\nALL RIGHTS RESERVED";
     function click(e) {
         if (document.all) {
             if (event.button == 2) {
                 alert(message);
                 return false;
             }
         }
         if (document.layers) {
             if (e.which == 3) {
                 alert(message);
                 return false;
             }
         }
     }
     if (document.layers) {
         document.captureEvents(Event.MOUSEDOWN);
     }
     document.onmousedown = click;
// -->

</script> 

<!------ disable right click ------->
<script language="JavaScript" type="text/javascript">
<!--

var message="";
///////////////////////////////////
function clickIE()

{if (document.all)
{(message);return false;}}

function clickNS(e) {
if
(document.layers||(document.getElementById&&!document.all))
{
if (e.which==2||e.which==3) {(message);return false;}}}
if (document.layers)
{document.captureEvents(Event.MOUSEDOWN);document. onmousedown=clickNS;}
else
{document.onmouseup=clickNS;document.oncontextmenu =clickIE;}

document.oncontextmenu=new Function("return false")
// -->
</script>
<!------ /disable right click ------->
<script language="JavaScript1.2" type="text/javascript">
<!--
function disableselect(e){
return false
}
function reEnable(){
return true
}
//if IE4+
document.onselectstart=new Function ("return false")
//if NS6
if (window.sidebar){
document.onmousedown=disableselect
document.onclick=reEnable
}
// -->
</script>