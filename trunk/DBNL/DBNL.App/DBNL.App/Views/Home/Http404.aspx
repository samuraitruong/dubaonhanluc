<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

  <head>
    <title>404 | /title>
    <script type="text/javascript" src="/scripts/mootools.js"></script>
    <link rel="shortcut icon" type="image/x-icon" href="http://www.cuoma.com/favicon.ico" />
    <link rel="stylesheet" type="text/css" href="/Content/main404.css" />
    <link rel="stylesheet" type="text/css" href="/Content/main404en.css" media="screen" />
    <!--[if IE]><link rel="stylesheet" type="text/css" href="/inc/css/main404fix.css" /><![endif]-->
    <script type="text/javascript">
        window.addEvent( "domready", function () {
        // external links.
         var links = $$("a[rel=nofollow]");
         for ( var i = 0; i < links.length; i++ )
         links[i].target = "_blank";
         new SmoothScroll({duration:500});
 });

    </script>
  </head>

  <body>

        <div id="header">
      <a id="top" name="top" />
      <div id="logo"><a href="/"><img src="/images/logo-cuoma.gif" alt="cuoma" title="CUOMA Design Studios" /></a></div>
              <div id="menu">
          <ul>
                          <li>
                <a href="/works" class="works" title="Works: Clients &amp; Projects"><span>Works</span></a>
              </li>
                            <li>
                <a href="/services" class="services" title="Services: For All Your Needs"><span>Services</span></a>
              </li>
                            <li>
                <a href="/about" class="about" title="About: Our Story"><span>About</span></a>
              </li>
                            <li>
                <a href="/contact" class="contact" title="Contact: Your Best Decision"><span>Contact</span></a>
              </li>
                        </ul>
        </div>
            </div>

    <div id="error404" class="content">
      <div class="block">
        <h1><span>Error 404</span></h1>
        <h2><span>Oops!</span></h2>
        <div class="dontWorry">It�s looking like you may have taken a wrong turn.

<br/>Don�t worry... it happens to the best of us.
<br/></div>
                  <div id="innerMenu">
            <p>Here�s a little map that might help you get back on track:</p>
            <ul>
              <li><a href="/" class="home"><span>Go to Home</span></a></li>
                              <li><a href="/works" class="works" title="Works: Clients &amp; Projects"><span>Works</span></a></li>
                                <li><a href="/services" class="services" title="Services: For All Your Needs"><span>Services</span></a></li>
                                <li><a href="/about" class="about" title="About: Our Story"><span>About</span></a></li>
                                <li><a href="/contact" class="contact" title="Contact: Your Best Decision"><span>Contact</span></a></li>
                              <li><a href="/blog/lang/en/" class="blog"><span>Blog</span></a></li>
            </ul>
          </div>
                </div>
    </div>

        <div id="footer">
      <div class="content">
        <div id="reel"><a href="/reel" title="Want to learn more?
Watch our reel."><span>Want to learn more?
Watch our reel.</span></a></div>
        <hr/>
      </div>
            <div id="relatedInfo">
        <div class="content">
          <strong>CUOMA Design Studios</strong><br/>
          2978 Concepci�n Arenal, 4th Floor O Loft,

<br/>(C1426DGH) Capital Federal - Argentina<br/>
          Phone: [+5411] 4115 6100<br/><br/>
          <span class="copyright">Copyright 2008 <span>|</span> All rights reserved.</span><br/><br/>
          <div id="validations">
            <a href="http://validator.w3.org/check?uri=http://www.cuoma.com/404" rel="external">XHTML</a> <span>|</span>
            <a href="http://jigsaw.w3.org/css-validator/validator?uri=http://www.cuoma.com" rel="external">CSS</a><br/>
          </div>
          <div class="links">
            <a href="/sitemap.xml" rel="external">Sitemap</a> |
            <a href="/?lang=es">�Quer�s cambiar a Espa�ol?</a>
          </div>
        </div>
      </div>
    </div>

        <!--  Stats  Mint-->
    <script src="/mint/?js" type="text/javascript"></script>

    <!--  Stats  GetClicky-->
    <script src="http://static.getclicky.com/52.js" type="text/javascript"></script>
    <noscript><p><img alt="Clicky" src="http://in.getclicky.com/52-db1.gif" /></p></noscript>

    
  </body>

</html>
