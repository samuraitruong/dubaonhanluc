function toListView() {
    
    $.cookie('view', 'list')
    return true;
}
function onSelectDate() { }
function toColumnView() {
    var div = $("<div/>");
    div.addClass("ss_im_news");
    var ul = $("<ul/>");
    ul.addClass("k_ss_im_news");
    $("div[rel='Item']").each(function () {
        var li = $("<li/>", {});

        var item = $(this).attr('class', 'im_news_object').attr("style","min-height:270px");
        $("div:first", item).attr('class', 'im_news_pic');
        $("img", item).attr("height", "90").attr("width", "110");
        $(".des", item).removeAttr("class")
        li.append(item);
        ul.append(li);
    });
    div.append(ul);
    
    $("#contentholder").html("");
    $("#contentholder").append(div);
    $.cookie('view', 'column')
    return false;
}
function makeBookmark() {
    if (window.sidebar) { // Mozilla Firefox Bookmark
        window.sidebar.addPanel(document.title, document.location.href, "");
    } else if (window.external) { // IE Favorite
        window.external.AddFavorite(document.location.href, document.title);
    }
    else if (window.opera && window.print) { // Opera Hotlist
        return true;
    }
}

$(document).ready(function () {
    $("#nav > li:last").addClass("end");
    $("#nav2 > li:last").addClass("end");
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
    $(".pageitem a[rel='CtrlPrint']").each(function () {
        $(this).click(function () {
            addthis_sendto('print');
            return false;
        });
    });
    $(".pageitem a[rel='CtrlEmail']").each(function () {
        $(this).click(function () {
            addthis_sendto('email');
            return false;
        });
    });

    $("#saveBookmark").click(function () {
        makeBookmark();
        return false;

    });
    
    var cookie = $.cookie('view');
    if (cookie != null && cookie == 'column')
        toColumnView();
    if ($("#datepicker").html() != null) {
        $("#datepicker").attr("style", "");
        $("#datepicker").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy',
            onSelect: onSelectDate
        }
    )
    .hide()
    .click(function () {
        //$(this).hide();
    });
        $("#showPicker").bind("click", function () {
            $("#datepicker").show();
        });
    }
});


