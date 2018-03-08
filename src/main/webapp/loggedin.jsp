<%-- 
    Document   : loggedin
    Created on : 07-Nov-2017, 13:30:23
    Author     : d00186050
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Dtos.User"%>
<%@page import="Daos.UserDao"%>
<%@page import="Dtos.User"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile</title>
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

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
                color: black;
                 
            }
           
        </style>
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
      <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand" href="index.jsp">Logo</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="index.jsp">Home</a></li>
                        <li><a href="#">Products</a></li>
                        <li><a href="#">Deals</a></li>
                        <li><a href="stores.jsp">Stores</a></li>
                        <li><a href="#">Contact</a></li>


                    </ul>





                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="login.jsp"><span class="glyphicon glyphicon-user"></span> Logout</a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
                    </ul>



                </div>
            </div>
        </nav>

        <div> <%=loggedin%> </div>
        <%
            // We have finished with the results of this action
            // so now we can remove the value from the session
            session.removeAttribute("loggedin_status");
            // This makes sure that old error messages 
            // don't mistakenly get printed out later
%> 



    </body>
</html>
