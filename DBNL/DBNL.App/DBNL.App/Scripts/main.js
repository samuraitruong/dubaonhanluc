
$(document).ready(function () {
    $("#nav li:last").addClass("end");
    $("#nav2 li:last").addClass("end");
    location.href = "#neo_content";
    $('#nav').droppy({ speed: 150 });
    $('#nav2').droppy({ speed: 150 });
    var curentUrl = window.location.pathname;
    var menuItem = $("li[rel='" + curentUrl + "']");
    if (menuItem != null) menuItem.addClass("active");

    $(".pageitem a[rel='CtrlBack']").each(function () {
        $(this).click(function () {
            window.history.go(-1);
            return false;
        });
    });

    $("#saveBookmark").click(function () {
        alert('av');
        if (document.all)
            window.external.AddFavorite(document.location.href, document.title)//IE
        window.sidebar.addPanel(document.location.href, document.title, ''); //Moz


        return false;

    });
});


