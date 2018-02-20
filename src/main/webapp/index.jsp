<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Fishmoley Store</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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
                 
            }
           
        </style>
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


        <div class="container">
            <div class="row">
                <div class="col-sm-8">
                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                            <div class="item active">
                                <img src="images/thegames.jpg" alt="games">
                                <div class="carousel-caption">
                                    <h3>Games$</h3>
                                    <p>Gimme Gimme.</p>
                                </div>      
                            </div>

                            <div class="item">
                                <img src="images/consoles.jpg" alt="consoles">
                                <div class="carousel-caption">
                                    <h3>Consoles $</h3>
                                    <p>EZ Clap</p> 
                                </div>      
                            </div>
                        </div>

                        <!-- Left and right controls -->
                        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>



                
                <div class="container">    
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="panel panel-primary">
                                <div class="panel-heading">Top Brass</div>
                                <div class="panel-body"><img src="images/deals.jpg" class="img-responsive" style="width:100%" alt="deals"></div>
                                <div class="panel-footer">Top PS4 Games</div>
                            </div>
                        </div>
                        <div class="col-sm-4"> 
                            <div class="panel panel-danger">
                                <div class="panel-heading">Top Brass</div>
                                <div class="panel-body"><img src="images/xboxgames.jpg" class="img-responsive" style="width:100%" alt="xbox games"></div>
                                <div class="panel-footer">Top Xbox Games</div>
                            </div>
                        </div>
                        <div class="col-sm-4"> 
                            <div class="panel panel-success">
                                <div class="panel-heading">Top Brass</div>
                                <div class="panel-body"><img src="images/pcgames.jpg" class="img-responsive" style="width:100%" alt="pc games"></div>
                                <div class="panel-footer">Top PC Games</div>
                            </div>
                        </div>
                    </div>
                </div><br>

                <div class="container">    
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="panel panel-primary">
                                <div class="panel-heading">BLACK FRIDAY DEAL</div>
                                <div class="panel-body"><img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"></div>
                                <div class="panel-footer">Buy 50 mobiles and get a gift card</div>
                            </div>
                        </div>
                        <div class="col-sm-4"> 
                            <div class="panel panel-primary">
                                <div class="panel-heading">BLACK FRIDAY DEAL</div>
                                <div class="panel-body"><img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"></div>
                                <div class="panel-footer">Buy 50 mobiles and get a gift card</div>
                            </div>
                        </div>
                        <div class="col-sm-4"> 
                            <div class="panel panel-primary">
                                <div class="panel-heading">BLACK FRIDAY DEAL</div>
                                <div class="panel-body"><img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"></div>
                                <div class="panel-footer">Buy 50 mobiles and get a gift card</div>
                            </div>
                        </div>
                    </div>
                </div><br><br>

                <footer class="container-fluid text-center">
                    <p>Online Store Copyright</p>  
                    <form class="form-inline">Get deals:
                        <input type="email" class="form-control" size="50" placeholder="Email Address">
                        <button type="button" class="btn btn-danger">Sign Up</button>
                    </form>
                </footer>

                </body>
                </html>
