
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
        <title>Stores</title>
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
                    <a class="navbar-brand" href="css.jsp">Home</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                       
                        <li><a href="#">Products</a></li>
                        <li><a href="#">Deals</a></li>
                        <li><a href="stores.jsp">Stores</a></li>
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

    </div>
        <h1><u>Some of our stores across Ireland</u></h1>
        
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2346.0036503197102!2d-6.39618368406821!3d53.984958836819494!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4860cc1416459c83%3A0x6cc743bdadf216c2!2sDundalk+Institute+of+Technology!5e0!3m2!1sen!2sie!4v1518094813746" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>

</body>


</html>
