<%-- 
    Document   : loggedin
    Created on : 07-Nov-2017, 13:30:23
    Author     : d00186050
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Success</title>
    </head>
    <body>
        <h1>Success!</h1>
        <%
            // Get the error message variable out of the session
            Object msg = session.getAttribute("loggedin_status");
            // Cast it to a String so we can use it
            String loggedin = (String) msg;
            // Display the message
%>

        <div> <%=loggedin%> </div>
        <%
            // We have finished with the results of this action
            // so now we can remove the value from the session
            session.removeAttribute("loggedin_status");
            // This makes sure that old error messages 
            // don't mistakenly get printed out later
%> 

<div><a href="index.html">Back to index</a></div>
<a href="register.jsp">Register</a><br>
<a href="viewProducts.jsp">View Products</a><br>
<a href="login.jsp">Logout</a>
    </body>
</html>
