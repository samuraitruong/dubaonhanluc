<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DBNL.App.Models.Banner>>" %>
<html>
<head>
<title></title>
<script type="text/javascript">
    var pic = new Array()

    function banner(name, width, link) {
        this.name = name
        this.width = width
        this.link = link
    }
    <% var index =0; %>
    <% foreach(var item in Model) { %>
        pic[<%= index++%>] = new banner('<% = item.BannerImageUrl %>', 118, '#')
    <%} %>
    
    var speed = 20

    var kk = pic.length
    var ii
    var hhh
    var nnn
    var myInterval
    var myPause
    var mode = 0


    var imgArray = new Array(kk)
    var myLeft = new Array(kk)

    for (ii = 0; ii < kk; ii++) {
        imgArray[ii] = new Image()
        imgArray[ii].src = pic[ii].name
        imgArray[ii].width = pic[ii].width

        hhh = 0
        for (nnn = 0; nnn < ii; nnn++) {
            hhh = hhh + pic[nnn].width
        }
        myLeft[ii] = hhh
    }

    function ready() {
        for (ii = 0; ii < kk; ii++) {
            if (document.images[ii].complete == false) {
                return false
                break
            }
        }
        return true
    }


    function startScrolling() {
        if (ready() == true) {
            window.clearInterval(myPause)
            myInterval = setInterval("autoScroll()", speed)
        }
    }


    function autoScroll() {
        for (ii = 0; ii < kk; ii++) {
            myLeft[ii] = myLeft[ii] - 1

            if (myLeft[ii] == -(pic[ii].width)) {
                hhh = 0
                for (nnn = 0; nnn < kk; nnn++) {
                    if (nnn != ii) {
                        hhh = hhh + pic[nnn].width
                    }
                }
                myLeft[ii] = hhh
            }


            document.images[ii].style.left = myLeft[ii]
        }
        mode = 1
    }

    function stop() {
        if (mode == 1) {
            window.clearInterval(myInterval)
        }
        if (mode == 0) {
            window.clearInterval(myPause)
        }
    }

    function go() {
        if (mode == 1) {
            myInterval = setInterval("autoScroll()", speed)
        }
        if (mode == 0) {
            myPause = setInterval("startScrolling()", 3000)
        }
    }

    myPause = setInterval("startScrolling()", 300)

</script>
</head>
<body bgcolor="#92e0d7">


<script>
    //<a href = ' + pic[ii].link + ' target="_blank" ></a>
    for (ii = 0; ii < kk; ii++) {
        document.write('<img space=0 hspace=0 vspace=0 border=0 height=65 width=118 style=position:absolute;top:0;left:' + myLeft[ii] + '; src=' + pic[ii].name + ' onMouseOver=stop() onMouseOut=go()>')
    }
</script></body>

</html>


