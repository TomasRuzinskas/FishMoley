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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            /* Remove the navbar's default rounded borders and increase the bottom margin */ 
            .navbar {
                margin-bottom: 50px;
                border-radius: 0;
            }

            /* Remove the jumbotron's default bottom margin */ 
            .jumbotron {
                margin-bottom: 0;
               background-image: url("images/wallpaper.jpg");
            }

            /* Add a gray background color and some padding to the footer */
            footer {
                background-color: #f2f2f2;
                padding: 25px;
            }
            body{
                background-image: url("images/wallpaper.jpg");
                 
            }
           
        </style>
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
