
$(document).ready(function () {
    $("#nav li:last").addClass("end");
    $("#nav2 li:last").addClass("end");
    location.href = "#neo_content";
    $('#nav').droppy({ speed: 150 });
    $('#nav2').droppy({ speed: 150 });
    var curentUrl = window.location.pathname;
    var menuItem = $("li[rel='" + curentUrl + "']");
    if (menuItem != null) menuItem.addClass("active");

   // $("li").each(function() {alert($(this).attr('rel'))});

});
  