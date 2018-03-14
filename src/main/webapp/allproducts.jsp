<%-- 
    Document   : allProducts
    Created on : 08-Mar-2018, 12:38:49
    Author     : d00186050
--%>


<%@page import="Daos.ProductDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                color: #000000;
            }
            footer{
                background-image: url("images/wallpaper");
            }
            tr{
            }

        </style>
        <title>Login</title>
    </head>
    <body>
        <div class="jumbotron">
            <div class="container text-center">
                <h1>Fish Moley Store</h1>      
            </div>
        </div>

        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand" href="css.jsp">Logo</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Home</a></li>
                        <li><a href="#">Products</a></li>
                        <li><a href="#">Deals</a></li>
                        <li><a href="#">Stores</a></li>
                        <li><a href="#">Contact</a></li>


                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="login.jsp"><span class="glyphicon glyphicon-user"></span> Login</a></li>
                        <li><a href="register.jsp"><span class="glyphicon glyphicon-user"></span> Register</a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
                    </ul>



                </div>
            </div>
        </nav>
        <div>         

     <%
         ProductDao products = new ProductDao("fishmoley");
         String productname;
         double productprice;
         String productdetails;
         for(int i = 0; i<products.AllProducts().size(); i++) {
         productname = products.AllProducts().get(i).getProduct_name();
         productprice = products.AllProducts().get(i).getProduct_price();
         productdetails = products.AllProducts().get(i).getProduct_details();
         %>
     <%=productname%>
     <%=productprice%>
     <%=productdetails%>

     <%
         }
     
     %>

    </body>


</html>

