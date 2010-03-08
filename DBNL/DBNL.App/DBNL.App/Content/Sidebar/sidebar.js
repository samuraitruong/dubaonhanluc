$(document).ready(function () {
    $("#sidebar").css({ left: "0px" });
    $(".sidebarOpen").toggle(function () {
        alert('close');
        $(this).removeClass("sidebarOpen")
				.addClass("sidebarClose")
				.animate({ right: "205px" }, 500);
        $("#sidebar").animate({ left: "205px" }, 500);
    }, function () {
        $(this)
				.removeClass("sidebarClose")
				.addClass("sidebarOpen")
				.animate({ right: "205px" }, 500);
        $("#sidebar").animate({ left: "205px" }, 500);
    });

    $("#sidebar ul").accordion({
        header: 'h2',
        event: 'mouseover',
        activeClass: 'selected'
    });
});