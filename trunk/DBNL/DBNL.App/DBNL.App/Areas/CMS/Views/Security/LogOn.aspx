<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>LogOn</title>
    <style type="text/css">
    border:1px dashed #CCCCCC;
margin-bottom:20px;
margin-top:20px;
padding:10px;
}
legend {
background:none repeat scroll 0 0 #666666;
border:1px solid #333333;
color:#FFFFFF;
font-family:Arial,Helvetica,sans-serif;
font-size:90%;
font-weight:bold;
letter-spacing:-1px;
line-height:1.1;
padding:2px 6px;
}
h1 {
color:#333333;
font-family:Arial,Helvetica,sans-serif;
font-size:175%;
font-weight:normal;
letter-spacing:-1px;
line-height:1.1;
}
label {
background-color:#E8EEF4;
color:#666666;
display:block;
float:left;
font-family:Arial,Helvetica,sans-serif;
font-size:115%;
font-weight:normal;
height:32px;
letter-spacing:-1px;
line-height:1.1;
margin-right:2px;
margin-top:3px;
padding-left:6px;
padding-top:11px;
width:140px;
}
.form {
margin:0;
padding:0;
}
#container {
margin:auto;
padding:10px;
width:750px;
}
#top {
height:50px;
width:680px;
}
#leftSide {
float:left;
padding-top:30px;
width:530px;
}
#rightSide {
background-color:#FFFFFF;
border:1px solid #CCCCCC;
color:#666666;
float:right;
font:12px Arial;
margin-top:40px;
padding:5px;
width:200px;
}
.clear {
clear:both;
}
.holder {
background-color:#FFFFFF;
}
.div_texbox {
background-color:#E6E6E6;
float:right;
height:35px;
margin-top:3px;
padding-bottom:3px;
padding-left:5px;
padding-top:5px;
width:347px;
}
.textbox {
background-color:#FFFFFF;
background-image:url("../../images/16t.png");
background-position:left center;
background-repeat:no-repeat;
color:#999999;
font:18px Arial;
padding:3px 5px 3px 19px;
width:285px;
}
.textbox:focus, .textbox:hover {
background-color:#F0FFE6;
}
.username {
background-color:#FFFFFF;
background-image:url("../../images/16m.png");
background-position:left center;
background-repeat:no-repeat;
color:#999999;
font:18px Arial;
padding:3px 5px 3px 19px;
width:285px;
}
.username:focus, .username:hover {
background-color:#F0FFE6;
}
.password {
background-color:#FFFFFF;
background-image:url("../../images/16s.png");
background-position:left center;
background-repeat:no-repeat;
color:#999999;
font:18px Arial;
padding:3px 5px 3px 19px;
width:285px;
}
.password:focus, .password:hover {
background-color:#F0FFE6;
}
.button_div {
background-color:#FFFFFF;
border:1px solid #CCCCCC;
float:right;
height:35px;
margin-top:3px;
padding:5px 32px 3px;
text-align:right;
width:287px;
}
.buttons {
background:none repeat scroll 0 0 #E3E3DB;
border-color:#FFFFFF #D8D8D0 #D8D8D0 #FFFFFF;
border-style:solid;
border-width:2px;
color:#989070;
font-size:12px;
font-weight:bold;
padding:6px 14px;
text-decoration:none;
text-transform:uppercase;
cursor: pointer;
}
fieldset {
    border:1px dashed #CCCCCC;
    margin-bottom:20px;
    margin-top:20px;
    padding:10px;
}
legend {
    background:none repeat scroll 0 0 #666666;
    border:1px solid #333333;
    color:#FFFFFF;
    font-family:Arial,Helvetica,sans-serif;
    font-size:90%;
    font-weight:bold;
    letter-spacing:-1px;
    line-height:1.1;
    padding:2px 6px;
}

    </style>
</head>
<body>
    <div style="padding: 50px 0px 0px 320px">
        
    <div id="leftSide">
        <fieldset>
            <legend>Content Management System</legend>
            <%using (Html.BeginForm())
              {  %>
            <%= Html.ValidationSummary(true) %>
          
                <label>Tên Đăng nhập</label>
                <div class="div_texbox">
                    <%=Html.TextBox("Username", null, new {@class="username" })%>
                </div>
                <label>Mật Khẩu</label>
                <div class="div_texbox">
                <%=Html.Password("Password", null, new { @class = "password" })%>
                </div>
            <div class="button_div">
	            <input type="submit" value="Đăng Nhập" class="buttons" />
	        </div>
            <% } %>
            <div class="clear">
            </div>
        </fieldset>
        <%--<hr size="1">
        <fieldset>
            <legend>Personal details</legend>
            <form class="form" method="POST" action="pay.php">
            <label for="name">
                Name</label>
            <div class="div_texbox">
                <input type="text" value="John Doe" id="name" class="textbox" name="name">
            </div>
            <label for="address">
                Address</label>
            <div class="div_texbox">
                <input type="text" value="12 main" id="address" class="textbox" name="address">
            </div>
            <label for="city">
                City</label>
            <div class="div_texbox">
                <input type="text" value="Rochester" id="city" class="textbox" name="city">
            </div>
            <label for="country">
                Country</label>
            <div class="div_texbox">
                <input type="text" value="United States" id="country" class="textbox" name="country">
            </div>
            <div class="button_div">
                <input type="button" class="buttons" value="Submit" name="Submit">
            </div>
            </form>
            <div class="clear">
            </div>
        </fieldset>--%>
    </div>
    </div>
</body>
</html>
