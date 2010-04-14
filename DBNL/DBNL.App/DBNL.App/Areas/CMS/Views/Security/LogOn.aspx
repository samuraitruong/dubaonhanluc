<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>LogOn</title>
</head>
<body>
    <div>
        <%using(Html.BeginForm()){  %>
        <%= Html.ValidationSummary(true) %>
         <p>
            <label> Username</label>
            <%=Html.TextBox("Username") %>
            
         </p>
         <p>
            <label> Password</label>
            <%=Html.Password("Password") %>
            
         </p>
        <p>
                <input type="submit" value="LogOn" />
            </p>
            
        <% } %>
    </div>
</body>
</html>
