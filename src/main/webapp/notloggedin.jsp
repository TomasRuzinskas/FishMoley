<%-- 
    Document   : notloggedin
    Created on : 07-Nov-2017, 13:54:58
    Author     : d00186050
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
               <h1>Something went wrong</h1>
        <%
            // Get the error message variable out of the session
            Object msg = session.getAttribute("loggedin_status");
            // Cast it to a String so we can use it
            String loggedin = (String) msg;
            // Display the message
%> 

        <div> <%=loggedin%> </div>


<div><a href="index.jsp">Back to index</a></div>
    </body>
</html>
