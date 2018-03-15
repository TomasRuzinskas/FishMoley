
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      <%@include file="includes/styleandscripts.jsp" %>
        <title>Error</title>
    </head>
    <%@include file="includes/nav.jsp" %>
    <body>
        <h1>Something went wrong</h1>
        <%
            // Get the error message variable out of the session
            Object msg = session.getAttribute("errorMessage");
            // Cast it to a String so we can use it
            String error = (String) msg;
            // Display the message
%>

        <div> <%=error%> </div>
        <%
            // We have finished with the results of this action
            // so now we can remove the value from the session
            session.removeAttribute("errorMessage");
            // This makes sure that old error messages 
            // don't mistakenly get printed out later
%> 

<div><a href="index.jsp">Back to index</a></div>
    </body>
</html>
